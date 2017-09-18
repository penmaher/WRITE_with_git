#!/bin/bash


echo 'Running update_version: '

. ./user_config.sh

echo 'Checking out master'
git checkout master

var=($(git diff --name-status master..$editing_branch))

if [[ ${#var[@]} -eq 0 ]]; then
  echo 'Performing merge of master to all author branches'
  for author in "${author_list[@]}"
  do

    git merge -X theirs master
  done
else
  echo 'ERROR: Unable to merge master to author branches'
  echo 'master branch is different from $editing_branch branch'
fi
