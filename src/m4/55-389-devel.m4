## `389-DEVEL.M4'

`EXPOSE' 80 389 443 636

`RUN' useradd -d / -M -r -s /bin/false dirsrv; true
`RUN' useradd -d / -M -r -s /bin/false dirsrv_rest; true

# Temporal volumes for each instance
VOLUME /opt/dirsrv


