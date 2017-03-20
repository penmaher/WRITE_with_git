#!/bin/bash

#The purpose of this shell script is to ensure branches are up to date with the remote master, build local branch copies $tex_name_diff.tex and generate branch compare.

PULL_REMOTE='false'

for var in "$@"
do
  if [ "$var" == "-pull-remote" ]
  then
    PULL_REMOTE='true'
  fi
done


echo 'Running build_diff: '

. ./user_config.sh

cd $paper_path

echo 'Changed into ' $paper_path

#step 1: Ensure compare does not alread exist and if it does remove it
git branch -D compare

#step 2:  generate new branch from up to date master
git checkout master

if [ "$PULL_REMOTE" == "true" ]
then
  git pull
fi

masterid=`git rev-parse HEAD`

git branch compare
echo '  generated branch compare'

#step 3: Loop over authors, pull and  build diff.tex

for author in "${author_list[@]}"
  do

    branch_name="$branch_prefix$author"

    if [ `git branch --list $branch_name` ]
    then
      echo '  On branch ' $branch_name 'generating local diff'

      git checkout $branch_name
      if [ "$PULL_REMOTE" == "true" ]
      then
        git pull
      fi

      $git_path/track_changes/runlatexdiffgit.sh  $tex_name $masterid
      #manually change the DIFdel and DIFadd for author colour in latex
      sed -ie "s/DIFdel{/DIFdel${author^}{/g" ${tex_name}_diff.tex
      sed -ie "s/DIFadd{/DIFadd${author^}{/g" ${tex_name}_diff.tex
      git add -f ${tex_name}_diff.tex
      git commit -m "Local branch changes to ${tex_name}_diff.tex file"
      git checkout -- changes/${tex_name}.tex
      git push
    else
      echo 'WARNING: Author undefined'
    fi

  done

#Step 4
git checkout compare
$git_path/track_changes/runlatexdiffgit.sh ${tex_name} $masterid
git add -f ${tex_name}_diff.tex
git checkout -- changes/${tex_name}.tex
git commit -m 'Commit merged file.'

git checkout master

exit



