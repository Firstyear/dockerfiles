## `UPDATE.M4'

`RUN' /usr/bin/DNFYUM install -y redhat-rpm-config ifdef(`WITHDNF', , epel-release ) && /usr/bin/DNFYUM upgrade -y && /usr/bin/DNFYUM clean all && rpm --rebuilddb
