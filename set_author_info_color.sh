#!/bin/bash

# This file should only be run once as an initialisation of the project, or when the author list is updated.
# This file should be run from the root of the paper git repo. The call is track_changes/set_author_info_color.sh

AUTHORINFONAMES=author_info_names.tex
COLORCHANGENAMES=color_change_names.tex

rm -rf $AUTHORINFONAMES
rm -rf $COLORCHANGENAMES

echo 'Running author_personalisations: '

. ./user_config.sh

cd $paper_path

echo 'Changed into ' $paper_path

# Adding personal info for the author names. The created file (author_info_names.tex) will be input into author_info.tex
echo '% This file is the individual personalisations for the author info.' >> $AUTHORINFONAMES
echo '' >> $AUTHORINFONAMES
echo '' >> $AUTHORINFONAMES

echo '%Assign \colourauthor based on \currentauthor as defined in .tex' >> $AUTHORINFONAMES
for author in "${author_list[@]}"
do  
  echo "\\ifcase\\pdfstrcmp{\\currentauthor}{${author^}}\\newcommand{\\colourauthor}{\\colour${author^}}\\fi" >> $AUTHORINFONAMES
  echo "\\newauthor{${author^}}{mm}{\\textbf{#1:}~#2}" >> $AUTHORINFONAMES
  echo '' >> $AUTHORINFONAMES
done


# Adding personal info for the color changes. The created file (color_change_names.tex) will be input into color_change.tex
echo '% This file is the individual personalisations for the color change.' >> $COLORCHANGENAMES
echo '' >> $COLORCHANGENAMES
echo '' >> $COLORCHANGENAMES

echo '%author specific' >> $COLORCHANGENAMES
for author in "${author_list[@]}"
do  
  echo "\\providecommand{\\DIFadd${author^}}[1]{{\\protect\\color{\\colour${author^}}\\uwave{#1}}} %DIF PREAMBLE" >> $COLORCHANGENAMES
  echo "\\providecommand{\\DIFdel${author^}}[1]{{\\protect\\color{\\colour${author^}}\\sout{#1}}}  %DIF PREAMBLE" >> $COLORCHANGENAMES
  echo '' >> $COLORCHANGENAMES
done


exit

0.1 create author_info_
1. loop over all authors
  1.1 create authors

2. loop over all authors
  2.1 create colour changes
