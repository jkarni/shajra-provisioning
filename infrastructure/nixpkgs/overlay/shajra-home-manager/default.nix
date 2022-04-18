self: _super:

let
    progName = "shajra-home-manager";
    meta.description = "Controlled home directory management with Nix";
    sources = (import ../../../.. {}).sources;
in

self.nix-project-lib.writeShellCheckedExe progName
{
    inherit meta;
    path = with self; [
        coreutils
        findutils
        git
        gnugrep
        gnutar
        gzip
        hostname
        home-manager
    ];
}
''
set -eu
set -o pipefail


TARGET="$(hostname)"
NIX_EXE="$(command -v nix || true)"
SLIM=false
SWITCH_NEW=false
ARGS=()


. "${self.nix-project-lib.scriptCommon}/share/nix-project/common.bash"


print_usage()
{
    cat - <<EOF
USAGE: ${progName} [OPTION]... [--] HOME_MANAGER_ARGS...

DESCRIPTION:

    A wrapper of home-manager that heavily controls environment
    variables, including NIX_PATH.  Unrecognized switches and
    arguments are passed through to home-manager.

OPTIONS:

    -h --help         print this help message
    -t --target NAME  target configuration
                      (default autodetected by hostname)
    -N --nix PATH     filepath of 'nix' executable to use
    --slim            exclude packages for testing

    '${progName}' pins all dependencies except for Nix itself,
     which it finds on the path if possible.  Otherwise set
     '--nix'.

EOF
}


main()
{
    while ! [ "''${1:-}" = "" ]
    do
        case "$1" in
        -h|--help)
            print_usage
            exit 0
            ;;
        -t|--target)
            if [ -z "''${2:-}" ]
            then die "$1 requires argument"
            fi
            TARGET="''${2:-}"
            shift
            ;;
        -N|--nix)
            if [ -z "''${2:-}" ]
            then die "$1 requires argument"
            fi
            NIX_EXE="''${2:-}"
            shift
            ;;
        --slim)
            SLIM=true
            ;;
        --)
            shift
            ARGS+=("$@")
            break
            ;;
        switch)
            if new_style_env
            then SWITCH_NEW=true
            else ARGS+=("$1")
            fi
            ;;
        *)
            ARGS+=("$1")
            ;;
        esac
        shift
    done
    add_nix_to_path "$NIX_EXE"
    if "$SWITCH_NEW"
    then switch_new "''${ARGS[@]}"
    else
        if [ "''${#ARGS[@]}" -gt 0 ]
        then manage "''${ARGS[@]}"
        else manage build
        fi
    fi
}

new_style_env()
{
    test -e ~/.nix-profile/manifest.json
}

manage()
{
    local config="${sources.shajra-provisioning}/home/target/$TARGET"
    if $SLIM
    then config="$config/slim.nix"
    fi
    /usr/bin/env -i \
        HOME="$HOME" \
        PATH="$PATH" \
        TERM="$TERM" \
        DBUS_SESSION_BUS_ADDRESS="''${DBUS_SESSION_BUS_ADDRESS:-}" \
        TERMINFO="''${TERMINFO:-}" \
        USER="$USER" \
        NIX_PATH="nixpkgs=${sources.nixpkgs-home}" \
        home-manager -f "$config" "$@"
}

# DESIGN: This deals with Home Manager's incomplete support for 'nix profile'
switch_new()
{
    local result; result="$(manage build --no-out-link "$@")"
    nix profile list \
        | grep home-manager-path \
        | cut -d ' ' -f 4 \
        | xargs nix profile remove
    "$result/activate"
}


main "$@"
''
