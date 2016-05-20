## `UPDATE.M4'

`USER' root
`RUN' /usr/bin/DNFYUM install -y redhat-rpm-config deltarpm ifdef(`WITHDNF', , epel-release )

`RUN' /usr/bin/DNFYUM upgrade -y
