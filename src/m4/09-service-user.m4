## `SERVICE-USER.M4'

`USER' root

# I would like to set this to -u `UID'
`RUN' groupadd -g 1000 service
`RUN' useradd -l -d /home/service -s /bin/zsh -M -s /bin/sh -u 1000 -g 1000 service


