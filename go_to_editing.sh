#!/bin/bash

echo 'Running go_to_editing: '

. ./user_config.sh

cd $paper_path

echo 'Changed into ' $paper_path

git checkout $editing_branch

$git_path/track_changes/buildlatex.sh ${tex_name}


echo "Open ${tex_name}.tex and then its time to have some fun editing!!! Keep ${tex_name}_diff.tex as is so you know what the changes are."

exit
