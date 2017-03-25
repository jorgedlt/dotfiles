#!/usr/bin/env bash
# My Functions

# jorgedlt#gmail.com - 24 MAR 2017

# My Colors
   export BLACK=$(tput setaf 0)
   export RED=$(tput setaf 1)
   export GREEN=$(tput setaf 2)
   export YELLOW=$(tput setaf 3)
   export BLUE=$(tput setaf 4)
   export MAGENTA=$(tput setaf 5)
   export CYAN=$(tput setaf 6)
   export WHITE=$(tput setaf 7)
   export GRAY=$(tput setaf 8)
   export GREY=$(tput setaf 8)
   export BOLD=$(tput bold)
   export REVERSE=$(tput rev)
   export RESET=$(tput sgr0)
#

#! alpha ~ Random Quads of alpha patterns
#h alpha ~ no parameters needed, generates 10x random 4-UC-alpha
alpha ()
{
    echo {A..Z}{A..Z}{A..Z}{A..Z} | tr ' ' '\012' | gshuf | gshuf | head | ccze -A
}

atom ()
{
    open -a /Applications/Atom.app "$@"
}

#! busca ~ Searches my Notes in Document folder, provides titles
#h busca ~ busca REGEX
busca ()
{
    searchterm=${1:-word};
    searchtloca=${2:-Documents};
    echo -e "\n${GRAY} Searching in ~/${searchtloca} Folder ${RESET}";
    echo -e "${GREEN}";
    /usr/local/bin/ggrep --exclude-dir="*Archive*" -rwI --color=auto -i "${searchterm}" ~/${searchtloca}/*;
    echo -e "\n${RESET}"
}
# requires - brew tap homebrew/dupes; brew install grep # ggrep is not part moretools

#! dropit ~ move secure files to dropbox with timestamp
#h dropit ~ dropit archive.gz.cpt
dropit ()
{
    [ $# -lt 1 ] && {
        echo -e "\n${YELLOW} usage: Needs one argument; file to move like archive.gz.cpt ${RESET}\n";
        return
    } || {
        :
    };
    [[ "$1" =~ \.(+)gz.cpt$ ]] && echo "$1 appears not be gzip, or encrypted" || :;
    filedate=$(date +"%Y-%m-%d.%H:%M");
    mv -i "$1" "$1.${filedate}";
    mv -i "$1.${filedate}" "$HOME/Dropbox/Archive/.";
    ls -l "$HOME/Dropbox/Archive/$1.${filedate}"
}

#! e2h ~ Convert epoch time string to human readable
#h e2h ~ e2h         requeres no parameters
e2h ()
{
    epochnow=$(gdate +%s);
    epochtime=${1:-$($epochnow)};
    if (( $# < 1 )); then
        echo -e "\n${RED} usage: Needs at least one argument; IP Address${RESET}\n";
        echo But Epoch Time Now is;
        gdate +%s;
        return;
    fi;
    /usr/local/bin/gdate -d @"$epochtime"
}

#! editenv ~ open ATOM with .bashrc .aws-keys .ssh/config
#h editenv ~ editenv     # requires 0 parameters
editenv ()
{
    open -a /Applications/Atom.app "$HOME/.bashrc" "$HOME/.bash-func.sh" "$HOME/.aws-keys" "$HOME/.ssh/config"
}

#! favs ~ show a brief list favorite utils
#h favs ~ favs             # requires 0 parameters
favs ()
{
  echo -e "
  xkpa     \t~ Generate an xkcd style password.
  qrencode \t~ Encode input data in a QR Code and save as a PNG or EPS image.
  ascii    \t~ Prints all aliases of an ASCII character.
  fping    \t~ Scans IP ranges
  arp-scan \t~ Scans MAC address
  dhcpdump \t~ Dumps DHCP info
  dnsmap   \t~ Dumps DHCP info    # https://github.com/makefu/dnsmap or brew install dnsmap
#
  /bin/cp -rf ~/code/awseasy/* ~/.awseasy/.
  ls -lrt ~/code/awseasy ~/.awseasy/.
  " | ccze -A
}

#! fcat ~ fancy-cat display files in color
#h fcat ~ fcat filename    #bash syntax highlight
fcat ()
{
    highlight -O truecolor --syntax=bash -l "$1"
}

#! fhelp ~ shows details howto for .bashrc functions
#h fhelp ~ fhelp  flist_word     requeres one parameters
fhelp ()
{
    command=${1:-fhelp};
    ${GREEN}
    cat "$HOME/.bash-func.sh" | grep '^#h' | grep ${command} | cut -c9- | column -ts '	'
}

#! fixbrew ~  updates brew and dependencies
#h fixbrew ~ fixbrew        # requeres no parameters
fixbrew ()
{
    brew update;
    brew install ccze srm hping pwgen coreutils moreutils figlet htop;
    brew install dnsmap dhcpdump arp-scan fping highlight;
    brew install qrencode ascii watch;
    brew tap homebrew/dupes;
    brew doctor
}

#! flist ~ list all functions within .bashrc
#h flist ~ flist         requeres no parameters
flist ()
{
    cat "$HOME/.bash-func.sh" | grep '^#!' | tr -s ' ' | tr '~' '\t' | cut -c4- | column -ts '	'
}

#! funclist ~ list loaded functions, and provides details
#h funclist ~ funclist [funcname]
funclist ()
{
    if [ $# -lt 1 ] ; then {
        typeset -f | grep '\(\)' | grep -v '^_' | grep -v '^ ' | sort | uniq
        return
    } else {
        typeset -f "$1" | fcat
        }
    fi
}

#! githelp ~ list out typecal git help notes, useful to commit and push
#h githelp ~ githelp - requires no parameters
githelp ()
{
    echo -e "\n${GREEN} My notes of git usage ${RESET}\n";
    echo "${YELLOW}";
    echo git add .;
    echo git status;
    echo git commit -m '"Commit message"';
    echo git push origin master;
    echo "${RESET}"
}

#! glist ~ list scoped CMD history with REGEX match
#h glist ~ glist REGEX
glist ()
{
    history | grep $1
}

#! list ~ list CMD history
#h list ~ list CMD history, requires no paramters
list ()
{
    history
}

#! md ~ Open MacDown - shortcut
#h md ~ Open MacDown - shortcut
md ()
{
    open -a /Applications/MacDown.app/Contents/MacOS/MacDown "$@"
}

#! mkpass ~ Create Secure Passwords, 0 or 1 paramater needed
#h mkpass ~ mkpass [password lenght] ; default is 16
mkpass ()
{
    pw_length=${1:-15};
    echo -e "\n${GRAY} Executing pwgen with cnsB flags${RESET}";
    echo -e "${GREEN}";
    /usr/local/bin/pwgen -cnsB "$pw_length";
    echo -e "\n${RESET}"
}

# pip install xkpa
# http://pctechtips.org/installing-kali-linux-tools-on-ubuntu-using-katoolin/

# shopt -s expand_aliases
# source ~/.bash_aliases

#! numbers ~ Random Quads of number patterns
#h numbers ~ no parameters needed, generates 10x random 4-digit
numbers ()
{
    echo {0..9}{0..9}{0..9}{0..9} | tr ' ' '\012' | gshuf | gshuf | head | ccze -A
}

#! packup ~ copy Notes into encrypted folder on dropdox
#h packup ~ packup     # requires 0 parameters
packup ()
{
    echo -e "\n${YELLOW} Archiving Daily Notes ${RESET}";
    /bin/cp -rf ~/Documents/*Daily* /Volumes/DropBoxSecure/MyNotes-SBD/.;
    touch /Volumes/DropBoxSecure/MyNotes-SBD/.;
    ls -l /Volumes/DropBoxSecure/MyNotes-SBD/.;
    echo -e "\n${YELLOW} Archiving config files ${RESET}";
    storenv
}

_showENV ()
{
    echo "                                    ${GRAY} $1 ${GREEN} $($2) ${RESET}"
}

#! showcolors ~ list all functions within .bashrc
#h showcolors ~ showcolors         requeres no parameters
showcolors ()
{
    for i in 0 1 2 3 4 5 6 7 8 bold rev reset;
    do
        fcolor=$(grep tput .bashrc | grep export | grep "$i" | cut -d' ' -f5 |
          cut -d'=' -f1 | tr '\012' ' ' | tr -d ' ' );
        echo -e $(tput setaf "$i") "$fcolor ${RESET}";
    done | tr -d 'i' | egrep -v 'BOLD|REVERSE';
    echo -e plus "${BOLD}BOLD ${RESET}, ${REVERSE} REVERSE ${RESET}and ${RESET} RESET";
    echo
}

#! showif ~ Show PUBLIC IP address
#h showif ~ showif           # requires no parameters
showif ()
{
    ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active' | ccze -A;
    _showENV PUBLIC 'dig +short myip.opendns.com @resolver1.opendns.com'
}

#! shownet ~ Show PUBLIC IP address
#h shownet ~ shownet           # requires no parameters
shownet ()
{
    _showENV WIRE '/usr/sbin/ipconfig getifaddr en3';
    _showENV WIFI '/usr/sbin/ipconfig getifaddr en0';
    mySSID=$(airport -I | grep ' SSID' | cut -d':' -f2 | tr -d ' ');
    _showENV SSID "echo ${BLUE}[ ${YELLOW} $mySSID ${BLUE}]";
    _showENV Public 'dig +short myip.opendns.com @resolver1.opendns.com';
    activeIF=$(netstat -nr | grep ^default | head -1);
    _showENV 'Active' "echo $activeIF";
    backupIF=$(netstat -nr | grep ^default | head -2 | tail -1);
    _showENV 'Backup' "echo $backupIF"
}

#! showpublicip ~ Show PUBLIC IP address
#h showpublicip ~ showpublicip           # requires no parameters
showpublicip ()
{
    _showENV PUBLIC 'dig +short myip.opendns.com @resolver1.opendns.com'
}

#! skwish ~ Compresses and Encrypts given folder (recursivly)
#h skwish ~ skwish new-archive.gz source-folder
skwish ()
{
    [ $# -lt 2 ] && {
        echo -e "\n${YELLOW} usage: Needs two argument; new-archive.gz source-folder ${RESET}\n";
        return
    } || {
        :
    };
    [ -d "$2" ] && {
        :
    } || {
        echo -e "\n${YELLOW} ERROR: Can not find $2 directory ${RESET}\n";
        return
    };
    echo -e "\n${GREEN} Creating a encrypted gzip archive ${1} of folder ${2} ${RESET}\n";
    tar -zcvf "$1" "$2";
    ccrypt "$1";
    stat -x "${1}*"
}

#! slurp ~ lazy way to resource .bashrc
#h slurp ~ resources .bashrc, requeres no parameters
slurp ()
{
    echo -e "\n${GRAY} sourcing '$HOME/.bashrc' ${RESET}\n";
    source "$HOME/.bashrc"
}

#! splat ~ cat files with titles as headers; 0 or 1 paramenters
#h splat ~ splat [regex]
splat ()
{
    tail -n +1 ${1}* | grep -e $ -e '==.*' | pee pbcopy cat
}

#! storenv ~ Compress, encryot and move to dropbox .bashrc .aws-keys .ssh/config
#h storenv ~ storenv     # requires 0 parameters
storenv ()
{
    source=$( hostname | tr -d '/[|/]' );
    filedate=$(date +"%Y-%m-%d.%H.%M");
    cp -i ~/.bashrc "/Volumes/DropBoxSecure/bashrc-etc/${source}.dot.bashrc.${filedate}";
    cp -i ~/.aws-keys "/Volumes/DropBoxSecure/bashrc-etc/${source}.dot.aws-keys.${filedate}";
    cp -i ~/.ssh/config "/Volumes/DropBoxSecure/bashrc-etc/${source}.dot.ssh-config.${filedate}";
    cp -i ~/.bash-func.sh "/Volumes/DropBoxSecure/bashrc-etc/${source}.dot.bash-func.sh.${filedate}";
    touch "/Volumes/DropBoxSecure/bashrc-etc/${source}.*.${filedate}";
    ls -l "/Volumes/DropBoxSecure/bashrc-etc/${source}.*.${filedate}"
}

# #! tabname ~ renames terminal tab name
# #h tabname ~ tabname newTABname    # requires 1 parameters
# tabname ()
# {
#     printf "\e]1;$1\a"
# }

#! tcpping ~ sends TCP packets to target
#h tcpping ~ tcpping [tcp-ports] [remote-host] with 22 127.0.0.1 are default
tcpping ()
{
    rhost=${1:-127.0.0.1};
    tcpport=${2:-22};
    sudo /usr/local/sbin/hping "$rhost" -c 3 -S -V -A -p "$tcpport" | while read hong; do
        echo "$(date): $hong";
    done
}

#! tping ~ pings with a time stamp
#h tping ~ tping  IPADDRESS       # requeres one parameters
tping ()
{
    ping -c 3 "$1" | while read pong; do
        echo "$(date): $pong";
    done
}

#! whereip ~ Finds geolocation for given ip address
#h whereip ~ whereip           # requires 1 parameters (ip address)
whereip ()
{
    if (( $# < 1 )); then
        echo -e "\n${RED} usage: Needs at least one argument; IP Address${RESET}\n";
        return;
    fi;
    curl -s https://ipapi.co/"${1}"/json/ | pjson
}

# #! winname ~ renames terminal window name
# #h winname ~ winname newWINDOWname    # requires 1 parameters
# winname ()
# {
#    printf "\e]2;$1\a"
# }

#! words ~ show json of query return
#h words ~ In order to find words ...                                   ...use string to query
#h words ~ words with a meaning similar to ringing in the ears                ml=ringing+in+the+ears
#h words ~ words related to duck that start with the letter b                 ml=duck&sp=b*
#h words ~ words related to spoon that end with the letter a                  ml=spoon&sp=*a
#h words ~ words that sound like elefint                                      sl=elefint
#h words ~ words that start with t, end in k, & have 2 letters in between     sp=t??k
#h words ~ words that are spelled similarly to coneticut                      sp=coneticut
#h words ~ words that rhyme with forgetful                                    rel_rhy=forgetful
#h words ~ words that rhyme with grape that are related to breakfast          ml=breakfast&rel_rhy=grape
#h words ~ adjectives that are often used to describe ocean	                 årel_jjb=ocean
#h words ~ adjectives describing ocean sorted by temperature                  rel_jjb=ocean&topics=temperature
#h words ~ nouns that are often described by the adjective yellow	           rel_jja=yellow
#h words ~ words that follow "drink" in a sentence, that start with w	       /lc=drink&sp=w*
#h words ~ suggestions for the user if they have typed in rawand so far	     /sug?s=rawand
#h words ~
#h words ~ more details - lynx http://www.datamuse.com/api/
words ()
{
    maxwords=${2:-4};
    curl -s "https://api.datamuse.com/words?${1}&max=${maxwords}" | jq
}

#! xyz ~ list English words based on query
#h xyz ~ xyz <REGEX>      # requires 1 parameters
#h xyz ~ '.....' = 5 chars / '.r...' = 5 chars, r is the 2nd char
xyz ()
{
    # if [[ $(ps aux | grep process | grep -vc grep)  > 0 ]] ; then echo 1; else echo 0 ; fi
    #     [ $# -lt 1 ] && {

if [ $# -lt 1 ] ; then {
            echo -e "\n${YELLOW} usage: Needs one argument; '.....' = 5 chars / '.r...' = 5 chars, r is the 2nd char ${RESET}\n";
            return ;
        } else {
            grep -w "${1}" /usr/share/dict/words | tr '[:upper:]' '[:lower:]' | sort | uniq | fold -w 40
        }
fi
}

# A quick Clear Screen and Show Status
z ()
{
  /usr/local/bin/archey -o

# WIRE
  _showENV WIRE '/usr/sbin/ipconfig getifaddr en3'

# WIFI
  _showENV WIFI '/usr/sbin/ipconfig getifaddr en0'
  mySSID=$(airport -I | grep ' SSID' | cut -d':' -f2 | tr -d ' ')
  _showENV SSID "echo ${BLUE}[ ${YELLOW} $mySSID ${BLUE}]"

#PUBLIC
  _showENV Public 'dig +short myip.opendns.com @resolver1.opendns.com'
  activeIF=$(netstat -nr | grep ^default | head -1)

#NETWORK
  _showENV 'Active' "echo $activeIF"
  backupIF=$(netstat -nr | grep ^default | head -2 | tail -1)
  _showENV 'Backup' "echo $backupIF"

tail -50 "$HOME/.bash-func.sh" | grep '[:space:]*#\.'
    # Additional Helps and Notes
    #. Bastion Server Access
    #.
    #.     - DevBastion - StageBastion - ProdBastion
    #.
    #.     - MyTestJenkins
    #.
    # Jenkins Nodes
    # ssh -i ~/.aws/gendev-SBD-JENKINS.pem ubuntu@52.90.156.229     #. admin
    # ssh -i ~/.aws/gendev-SBD-JENKINS.pem ubuntu@54.172.93.101     #. ami-base
    # ssh -i ~/.aws/gendev-SBD-JENKINS.pem ubuntu@54.198.126.174    #. android
    #.
    # VBOXs
    # cd vbox/awsSBDcli/ && vagrant up && vagrant ssh
    #
    #. M3 Utility @AWS
    #.     - M3util
    #. tar -zcvf archive.tar.gz directory/
    #. sudo ifconfig en0 down
    #.
}

#
