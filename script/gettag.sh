#!/bin/bash

target="$*"

is_gen_all=1;

CSCOPE_DIR=.cscope
TAGS_DIR=.tags
#CFLAGS+=-MMD make $target
#export CFLAGS
function get_dep_files()
{
    sed -r -e 's/\s+/\n/g' | sed -r -e '/\\$/d; /.o:$/d; /^$/d'
}


function cscope_f()
{
    cscope -bk -i $1 -f $2
    #rm $2.in
    #rm $2.po
}


function ctags_f()
{
    ctags --language-force=c --c-kinds=+p --fields=+S --extra=+q -L $1 -f $2
    #ctags --language-force=c++ --c++-kinds=+p --fields=+iaS --extra=+q -L $1 -f $2
}


function gen_total_index()
{
    ctags_f cscope.files tags
    cscope_f cscope.files cscope.out
}

function gen_every_index()
{
    for files in $(find ./ -name '*.d') 
    do
        local name=$(sed -e 's/.d$//g' <<<$files)
        cat $files | sort | uniq| get_dep_files > ${name}.files
        cscope_f ${name}.files $CSCOPE_DIR/${name}.out
        ctags_f ${name}.files $TAGS_DIR/${name}.tags
        rm ${name}.files
    done
}


FILES=$(find ./ -name '*.d') 
if [[ -z $FILES ]]
then
    echo "no .d file"
    exit 0
fi

cat $FILES | sort | uniq | get_dep_files > cscope.files



if [[ ! -d $CSCOPE_DIR ]]
then
    mkdir $CSCOPE_DIR
fi


if [[ ! -d $TAGS_DIR ]]
then
    mkdir $TAGS_DIR 
fi


gen_total_index

if (( is_gen_all )) 
then
    gen_every_index
fi
