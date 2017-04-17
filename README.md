# WRITE - with Git

**Write Review edIT latEx** (WRITE) - with Git.

A track-changes tool for LaTeX for writing journal articles with multiple authors.

## Description

This project is a software package that consists of shell scripts that use *latexdiff* and produces a
track-changed document that is helpful for paper projects involving multiple authors. After the execution of these
scripts, a review document displaying each individual authors changes is produced.

The git work flow that must be followed when using this package is presented in
[work_flow](https://github.com/penmaher/WRITE_with_git/blob/master/workflow.png). As shown in this figure, each author
is given an individual branch in the project to perform their revisions. At intervals set by the manager of the
project, the revisions will be collected and a track-changed document is created. This track-changed document is 
then given to each author that highlights the changes made since the last revision.

The manager of the paper must coordinate the authors and ensure the merges are successful. The collating of revisions is performed by calling [build_diff.sh](https://github.com/penmaher/WRITE_with_git/blob/master/build_diff.sh).  This produces a diff on each authors branch against the head of the master (which should be the common ancestor for all author branches). Merging the changes made by each author is performed by calling [manage_merge.sh](https://github.com/penmaher/WRITE_with_git/blob/master/manage_merge.sh).  During the execution of this script the user is prompted to review the changes made by each author. A track-changed document is produced on the editing branch.  The helper script [go_to_editing.sh](https://github.com/penmaher/WRITE_with_git/blob/master/go_to_editing.sh) moves the user to the editing branch to continue editing the merged document.  Finally, the script [compare_editing.sh](https://github.com/penmaher/WRITE_with_git/blob/master/compare_editing.sh) creates a diff between the version on the editing branch and the versions provided by the authors.  This will produce an individual track-changes document (found in /Editing) for each author showing the differences between the current and previous revision.


## Instructions

For more detailed instructions please read:

- [Install](https://github.com/penmaher/WRITE_with_git/blob/master/INSTALL.md)
- [Instructions for use](https://github.com/penmaher/WRITE_with_git/blob/master/Instructions_for_use.md)
- [FAQ](https://github.com/penmaher/WRITE_with_git/blob/master/FAQ.md)

## Requirements

- [latexdiff](http://www.ctan.org/tex-archive/support/latexdiff)
- LaTeX packages: xparse, todonotes, datetime (optionally: xcolor)

## Testing environment

There is a test repository  [testing](https://github.com/penmaher/testing_WRITE_with_git) for learning how to use this package.
