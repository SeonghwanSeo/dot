#!/bin/bash
export TRASHCAN=$WORK_DIR/.Trash
TRASHCAN_ABS=$( realpath -- $TRASHCAN )

function trash() {
    mkdir -p $TRASHCAN
    mkdir -p $TRASHCAN/.metadata
    datetime=$(date '+%Y%m%d-%H-%M-%S')
    while getopts 'f' OPTION; do
        command="${command}-$OPTION "
    done
    shift $(($OPTIND -1))
    for filepath in "$@"; do
        if [ ! -e ${filepath} ]; then
            echo "$filepath is not exists"
            continue
        fi
        basename=$( basename -- $filepath )
        abspath=$( realpath -- $filepath )
        dirname=$( dirname -- $( realpath -- $filepath ) )
        if [ "$dirname" = "$TRASHCAN_ABS" ]; then
            echo "Ignore File in Trash Can: ${filepath}"
            continue
        fi
        i=0
        local newname=${datetime}_${i}_${basename}
        local newfilepath=$TRASHCAN/${newname}
        while [ -e $newfilepath ]; do
            i=$((i+1))
            newname=${datetime}_${i}_${basename}
            newfilepath=$TRASHCAN/${newname}
        done
        metadatapath=$TRASHCAN/.metadata/${newname}

        if [[ $OPTION != 'f' ]]; then
            echo -n "Do you want to remove ${filepath}? [y|n]: "
            read _answer

            if [[ $_answer != 'y' ]]; then
                continue
            fi
        fi
        echo "Move $filepath to $newfilepath"
        mv $filepath $newfilepath
        echo $abspath > ${metadatapath}
    done
}
function restore() {
    for filepath in "$@"; do
        basename=$( basename -- $filepath )
        metadatapath=$TRASHCAN/.metadata/${basename}
        abspath=$( cat $metadatapath )

        echo "restore $abspath"
        mv $filepath $abspath
        /bin/rm $metadatapath
    done
}
function trashcheck() {
    for filepath in "$@"; do
        basename=$( basename -- $filepath )
        metadatapath=$TRASHCAN/.metadata/${basename}
        abspath=$( cat $metadatapath )

        echo "$basename -> $abspath"
    done
}
function trashremove() {
    command='/bin/rm -i '
    while getopts 'rf' OPTION; do
        command="${command}-$OPTION "
    done
    shift $(($OPTIND -1))
    for filepath in "$@"; do
        basename=$( basename -- $filepath )
        dirname=$( dirname -- $( realpath -- $filepath) )

        if [ "$dirname" != "$TRASHCAN_ABS" ]; then
            echo "Ignore File not in Trash Can: ${filepath}"
        elif [ $basename = '.metadata' ]; then
            echo "Ignore Metadata Path: ${filepath}"
        else
            metadatapath=$TRASHCAN/.metadata/${basename}

            eval "$command $filepath"
            if [ ! -f $filepath ]; then
                /bin/rm $metadatapath
            fi
        fi
    done
}
function trashview() {
    printf '%.s*' $(seq 1 $(tput cols))
    numfiles=$( ls -a $TRASHCAN | wc -l )
    echo "Trash Can   $(($numfiles -3)) Files"
    echo "DATE        TIME        PATH"
    for filepath in $TRASHCAN/*; do
        basename=$( basename -- $filepath )
        if [ $basename = '.metadata' ]; then
            continue
        fi
        abspath=$( cat ${TRASHCAN}/.metadata/$basename )
        echo "${basename:0:4}-${basename:4:2}-${basename:6:2}  ${basename:9:2}:${basename:12:2}:${basename:15:2}    ${abspath} <- $filepath"
    done
    printf '%.s*' $(seq 1 $(tput cols))
}
function trashempty() {
    local _answer=''
    trashview
    echo -n "\nDo you want to remove all files? [y|n]: "
    read _answer

    if [[ $_answer == 'y' ]]; then
        /bin/rm -rf $TRASHCAN/[^.metadata]*
        /bin/rm -rf $TRASHCAN/.metadata/*
    elif [[ $_answer != 'n' ]]; then
        echo "Please answer 'y' for yes, or 'n' for no."
    fi
}
