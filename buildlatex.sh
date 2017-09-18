#!/bin/sh

if [ $1 ] #first input is the filename (without .tex)
then
    # TODO: make build latex quiet when compiling
    #if [[ $2 -eq "--quiet" ]]; then
    #else
    #fi

    latex $1
    latex $1
    bibtex $1
    latex $1
    dvips $1
    ps2pdf $1.ps

else
    echo "ERROR -> The name of .tex file to compile if required!"
fi


