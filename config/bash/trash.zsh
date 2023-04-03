#!/bin/bash
TRASH_DIR_ABS=$( realpath -- $TRASH_DIR )

function trash() {
    mkdir -p $TRASH_DIR
    mkdir -p $TRASH_DIR/.metadata
    datetime=$(date '+%Y%m%d-%H-%M-%S')
    f=false
    while getopts 'f' OPTION; do
        f=true
    done
    shift $(($OPTIND -1))
    for filepath in "$@"; do
        if [ -L ${filepath} ]; then
            if ( ! $f ); then
                echo -n "Do you want to remove symbolic link ${filepath}? [y|n]: "
                read _answer
                if [[ $_answer != 'y' ]]; then
                    continue
                fi
            fi
            /bin/rm $filepath
            continue
        elif [ ! -e ${filepath} ]; then
            echo "$filepath is not exists"
            continue
        fi
        basename=$( basename -- $filepath )
        abspath=$( realpath -- $filepath )
        if [[ $abspath == ${TRASH_DIR_ABS}* ]]; then
            echo "Ignore File in Trash Can: ${filepath}"
            continue
        fi
        i=0
        local newname=${datetime}_${i}_${basename}
        local newfilepath=$TRASH_DIR/${newname}
        while [ -e $newfilepath ]; do
            i=$((i+1))
            newname=${datetime}_${i}_${basename}
            newfilepath=$TRASH_DIR/${newname}
        done
        metadatapath=$TRASH_DIR/.metadata/${newname}

        if ( ! $f ); then
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
function trashrestore() {
    for filepath in "$@"; do
        basename=$( basename -- $filepath )
        metadatapath=$TRASH_DIR/.metadata/${basename}
        abspath=$( cat $metadatapath )

        echo "restore $abspath"
        mv $filepath $abspath
        /bin/rm $metadatapath
    done
}
function trashcheck() {
    for filepath in "$@"; do
        basename=$( basename -- $filepath )
        metadatapath=$TRASH_DIR/.metadata/${basename}
        abspath=$( cat $metadatapath )

        echo "$basename -> $abspath"
    done
}
function trashrm() {
    command='/bin/rm -i '
    while getopts 'rf' OPTION; do
        command="${command}-$OPTION "
    done
    shift $(($OPTIND -1))
    for filepath in "$@"; do
        basename=$( basename -- $filepath )
        abspath=$( realpath -- $filepath )
        if [[ $abspath != ${TRASH_DIR_ABS}* ]]; then
            echo "Ignore File not in Trash Can: ${filepath}"
        elif [ $abspath = $TRASH_DIR_ABS ]; then
            echo "Ignore Trash Can: ${filepath}"
        elif [ $basename = '.metadata' ]; then
            echo "Ignore Metadata Path: ${filepath}"
        else
            metadatapath=$TRASH_DIR/.metadata/${basename}

            eval "$command $filepath"
            if [ ! -e $filepath ]; then
                /bin/rm $metadatapath
            fi
        fi
    done
}
function trashview() {
    printf '%.s*' $(seq 1 $(tput cols))
    numfiles=$( ls -a $TRASH_DIR | wc -l )
    echo "Trash Can   $(($numfiles -3)) Files"
    echo "DATE        TIME        PATH"
    for filepath in $TRASH_DIR/*; do
        basename=$( basename -- $filepath )
        if [ $basename = '.metadata' ]; then
            continue
        fi
        abspath=$( cat ${TRASH_DIR}/.metadata/$basename )
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
        /bin/rm -rf $TRASH_DIR/[^.metadata]*
        /bin/rm -rf $TRASH_DIR/.metadata/*
    elif [[ $_answer != 'n' ]]; then
        echo "Please answer 'y' for yes, or 'n' for no."
    fi
}
