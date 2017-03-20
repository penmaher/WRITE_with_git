#!/bin/sh

#call this function from the terminal with ./runlatexdiffgit.sh  $tex_name (optional git commit)
if [ $1 ] #first input is the filename (without .tex)
then

    $git_path/track_changes/buildlatex.sh $1

    if [ $2 ] #the commit id 
    then
        latexdiff-vc --git --force -r $2 $1.tex -d changes/

        if [ $3 ] #the string for naming the output file 
        then
            cp changes/$1.tex $1_$3.tex
        else
            cp changes/$1.tex $1_diff.tex

        fi
    else
        echo "Running latexdiff against git HEAD"
        latexdiff-vc --git --force -r $1.tex 
        mv $1-diff.tex $1_diff.tex

    fi
    $git_path/track_changes/buildlatex.sh $1_diff

else
    echo "ERROR -> The name of .tex file to compile if required!"
fi


