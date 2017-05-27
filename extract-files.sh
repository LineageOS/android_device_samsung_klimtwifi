#!/bin/bash

VENDOR=samsung
DEVICE=klimtwifi

BASE=../../../vendor/$VENDOR/$DEVICE/proprietary
rm -rf $BASE/*

set -e

if [ -z "$STOCK_ROM_DIR" ]; then
    if [ "$(adb root | grep -c 'adbd')" -eq 1  ]; then
	echo "adbd root: OK!"
	adb wait-for-device
    else
	echo "/system/bin/gpsd requires root privileges to be extracted"
	echo "root access is disabled by system setting - enable in settings -> development options"
	adb wait-for-device
	exit
    fi
fi

for FILE in `egrep -v '(^#|^$)' proprietary-files.txt`; do
    OLDIFS=$IFS IFS=":" PARSING_ARRAY=($FILE) IFS=$OLDIFS
    FILE=${PARSING_ARRAY[0]}
    DEST=${PARSING_ARRAY[1]}
    if [ -z $DEST ]
    then
        DEST=$FILE
    fi
    DIR=`dirname $FILE`
    if [ ! -d $BASE/$DIR ]; then
        mkdir -p $BASE/$DIR
    fi

    if [ -z "$STOCK_ROM_DIR" ]; then
        adb pull /system/$FILE $BASE/$DEST
    else
        cp $STOCK_ROM_DIR/$FILE $BASE/$DEST
    fi

    # if file does not exist try destination
    if [ "$?" != "0" ]
    then
        adb pull /system/$DEST $BASE/$DEST
    fi
done

./setup-makefiles.sh
