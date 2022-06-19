self: super:

# DESIGN: Hard to update as a flake, so running this script
#
# NIX_PATH=nixpkgs=/home/tnks/.nix-defexpr/channels/nixpkgs-unstable \
#     ~/src/external/nixpkgs/pkgs/applications/networking/browsers/microsoft-edge/update.sh
#
let makeEdge = "${super.path}/pkgs/applications/networking/browsers/microsoft-edge/browser.nix";
    metadata = {
        channel = "stable";
        version = "102.0.1245.44";
        revision = "1";
        sha256 = "sha256:10r12xlkcnag5jdmnwpqsbkjx1ih1027l573vxmcxmvpmj6y4373";
    };
in super.callPackage (import makeEdge metadata) {}
