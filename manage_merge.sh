#!/bin/bash
#http://stackoverflow.com/questions/18115411/how-to-merge-specific-files-from-git-branches


echo 'Running manage_merge: '

. ./user_config.sh

cd $paper_path

echo 'Changed into ' $paper_path

git checkout compare

#Step 5: Loop over authors to merge in changes
for author in "${author_list[@]}"
do
  echo "Merging in changes from $author"
  git checkout --patch $branch_prefix$author ${tex_name}_diff.tex
done

git add -f ${tex_name}_diff.tex
git commit -m "Generated ${tex_name}_diff.tex"

git checkout editing
git checkout compare ${tex_name}_diff.tex
cp ${tex_name}_diff.tex ${tex_name}.tex

git add -f ${tex_name}_diff.tex
git add -f ${tex_name}.tex

git commit -m "Generated ${tex_name}_diff.tex and clobbered ${tex_name}.tex with the changes"

git branch -D compare 
git checkout master

echo 'Finished merge of changes and now back on master branch'

exit

# notes for using git checkout --patch
y - stage this hunk
n - do not stage this hunk
q - quit; do not stage this hunk nor any of the remaining ones
a - stage this hunk and all later hunks in the file
d - do not stage this hunk nor any of the later hunks in the file
g - select a hunk to go to
/ - search for a hunk matching the given regex
j - leave this hunk undecided, see next undecided hunk
J - leave this hunk undecided, see next hunk
k - leave this hunk undecided, see previous undecided hunk
K - leave this hunk undecided, see previous hunk
s - split the current hunk into smaller hunks
e - manually edit the current hunk
? - print help

Example:

-%DIF DEL hierarchies-oldtmp-9819.tex   Thu Mar  2 17:15:39 2017
-%DIF ADD hierarchies.tex               Thu Mar  2 16:51:25 2017
+%DIF DEL hierarchies-oldtmp-7320.tex   Thu Mar  2 16:20:32 2017
+%DIF ADD hierarchies.tex               Thu Mar  2 16:15:47 2017

should be relaced with 

 %DIF DEL hierarchies-oldtmp-9819.tex   Thu Mar  2 17:15:39 2017
-%DIF ADD hierarchies.tex               Thu Mar  2 16:51:25 2017
+%DIF ADD hierarchies.tex               Thu Mar  2 16:15:47 2017

For a line you want that has a -, remove the + line then replace the '-' with a 'space'. For accepting a change a line leave as - and +
