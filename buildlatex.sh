#!/bin/sh

if [ $1 ] #first input is the filename (without .tex)
then

    latex $1
    latex $1
    bibtex $1
    latex $1
    dvips $1
    ps2pdf $1.ps

else
    echo "ERROR -> The name of .tex file to compile if required!"
fi


