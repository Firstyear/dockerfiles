## `UPDATE.M4'

`USER' root
ifdef(`WITHDNF', , `RUN' /usr/bin/DNFYUM install -y epel-release )
`RUN' /usr/bin/DNFYUM upgrade -y
