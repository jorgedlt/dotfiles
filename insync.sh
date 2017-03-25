#!/usr/bin/env bash

# insync.sh - for dot.files

# my bashrc
echo; echo ${GREEN}~/.bashrc ${YELLOW}
diff -sb ./dot.bashrc ~/.bashrc
echo ${RESET}
ls -la ./dot.bashrc ~/.bashrc

# my functions
echo; echo ${GREEN} ~/.bash-func.sh ${YELLOW}
diff -sb ./dot.bash-func.sh ~/.bash-func.sh
echo ${RESET}
ls -la ./dot.bash-func.sh ~/.bash-func.sh

#
