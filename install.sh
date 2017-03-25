#!/usr/bin/env bash

# install.sh - for dot.files

# add archive of preexsiting files
echo; echo "${GREEN}INSTALLATION SCRIPT - $(git remote get-url origin) ${YELLOW}"

echo
# my bashrc
echo ${GREEN}installing ... ~/.bashrc${RESET}
/bin/cp -f ./dot.bashrc ~/.bashrc
#ls -la ./dot.bashrc ~/.bashrc

# my functions
echo ${GREEN}installing ... ~/.bash-func.sh${RESET}
/bin/cp -f ./dot.bash-func.sh ~/.bash-func.sh
#ls -la ./dot.bash-func.sh ~/.bash-func.sh

#
echo; echo ${GREEN}comparing ... ~/.bash-func.sh${RESET}
./insync.sh
