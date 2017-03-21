#!/bin/bash

echo 'Running go_to_editing: '

. ./user_config.sh

cd $paper_path

echo 'Changed into ' $paper_path

git checkout editing
$git_path/track_changes/buildlatex.sh ${tex_name}

echo "Open ${tex_name}.tex and then its time to have some fun editing!!!"

exit
