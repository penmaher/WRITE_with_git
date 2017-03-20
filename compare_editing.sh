#!/bin/bash

#The purpose of this shell script is compar local author bracnhes to editing and generate pdfs located it Editing folder

echo 'Running compare_editing: '

. ./user_config.sh

cd $paper_path

if [ -d "$editing_path" ]; then
  mkdir $editing_path
fi

echo 'Changed into ' $paper_path

for author in "${author_list[@]}"
  do

    branch_name="$branch_prefix$author"

    if [ `git branch --list $branch_name` ]
    then
      echo '  On branch ' $branch_name 'generating local diff'

      git checkout $branch_name
      headid=`git rev-parse HEAD`

      git checkout editing

      $git_path/track_changes/runlatexdiffgit.sh ${tex_name} $headid

      cp ${tex_name}_diff.pdf $editing_path/${tex_name}_diff_$author.pdf
      git reset --hard HEAD

    else
      echo 'WARNING: Author undefined'
    fi

  done

echo 'Finished compare_editing'
exit



