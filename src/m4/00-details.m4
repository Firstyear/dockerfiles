define(`AUTHOR', wibrown@redhat.com)dnl
define(`USER', `esyscmd(`printf ${USER}')')dnl
define(`UID', `esyscmd(`printf %s "$(id -u)"')')dnl
define(`GID', `esyscmd(`printf %s "$(id -g)"')')dnl
define(`TZ', Australia/Brisbane)dnl
define(`DNFYUM', ifdef(`WITHDNF', dnf, yum))dnl
