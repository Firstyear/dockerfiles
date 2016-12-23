## `USER.M4'

# I would like to set this to -u `UID'
`RUN' groupadd -g GID USER
`RUN' useradd -l -d /home/USER -s /bin/zsh -M -G wheel -s /bin/zsh -u UID -g GID USER

# This might not do what I hope ... 
# The volume, while per container, these other commands "don't stick" to it. :(
# Don't make it a volume, leave it as part of the layer

# `RUN' mkdir -p /home/USER/build
# `RUN' chown -R USER: /home/USER/build
# Only needs to be done once?
`COPY' devel/zshrc /home/USER/.zshrc
`COPY' devel/zshrc /root/.zshrc
`COPY' devel/vimrc /home/USER/.vimrc
`RUN' mkdir -p /home/USER/.vim/backup
`RUN' mkdir -p /home/USER/development

`RUN' chown -R USER: /home/USER
`COPY' core/user-sudo /etc/sudoers.d/USER-sudo


