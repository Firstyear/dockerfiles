## `UPDATE.M4'

`RUN' /usr/bin/DNFYUM install -y redhat-rpm-config deltarpm ifdef(`WITHDNF', , epel-release ) && /usr/bin/DNFYUM upgrade -y
