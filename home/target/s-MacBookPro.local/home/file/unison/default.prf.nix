shared: hostname:

''
root = ${shared."${hostname}".homeDirectory}/Documents/jelly
root = ssh://jelly/${shared.hole.homeDirectory}/doc/shared/safe

logfile = ${shared."${hostname}".homeDirectory}/var/log/unison.log

ignore = Name *.sock
''
