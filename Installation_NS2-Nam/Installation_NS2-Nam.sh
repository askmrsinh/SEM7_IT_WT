#!/bin/bash

# To run:
#  open terminal,
#  change directory to this script's location,
#    $ cd <link to InstallHadoop.sh parent directory>
#  give execute permission to the script,
#    $ sudo chmod +x Installation_NS2-Nam.sh
#  then execute the script,
#    $ ./Installation_NS2-Nam.sh

sudo apt-get install -y ns2

if [[ "$(uname -m)" = "x86_64" ]]; then
	ARCH="amd64"
else
	ARCH="i386"
fi

CACHEDIR="/var/cache/ns2_nam";
mkdir -p "$CACHEDIR"
cd "$CACHEDIR"

URL=https://raw.githubusercontent.com/user501254/BE_IT_7_WT/master/Installation_NS2-Nam/nam_1.15-10_$ARCH.deb
FILE=${URL##*/}

wget -c "$URL" -O "$FILE"

if [[ ! -f "$FILE" ]]; then
	exit 1
fi

sudo dpkg -i $FILE


#check
dpkg -l|grep ns2 
nam
