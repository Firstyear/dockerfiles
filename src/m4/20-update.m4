## `UPDATE.M4'

ifdef(`WITHDNF', , `RUN' /usr/bin/DNFYUM install -y epel-release )
`RUN' /usr/bin/DNFYUM upgrade -y; /usr/bin/DNFYUM clean all
