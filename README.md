# WRITE - with Git

**Write Review edIT latEx** - WRITE - with Git.

A track-changes tool for LaTeX for writing journal articles with multiple authors.

## Description

This project contains is a software package that consists of shell scripts that perform commands using *latexdiff* and a
track-changes document that is helpful for paper projects involving multiple authors. After the execution of these
scripts, a review document displaying each individual authors changes is produced.

The work flow that must be followed when using this track-changes package is presented in
[work_flow](https://github.com/penmaher/WRITE_with_git/blob/master/workflow.png). As shown in this figure, each author
is given an individual branch in the paper project to perform their revisions. At intervals set by the manager of the
paper project, the revisions will be collected and a track-changes document is created. This track-changes document can
then be passed to all authors to show all revisions that have been made.

The manager of the paper must coordinate the authors and ensure the merging of different changes is successful. The
collating of the revisions is performed by calling
[build_diff.sh](https://github.com/penmaher/WRITE_with_git/blob/master/build_diff.sh).  This produces a diff on each
author branch against the head of the master (which should be the common ancestor for all author branches). Merging the
changes made by each author is performed by calling
[manage_merge.sh](https://github.com/penmaher/WRITE_with_git/blob/master/manage_merge.sh).  During the execution of this
script the user is prompted to review the changes made by each author. A track-changes document is produced on the
Editing branch.  The helper script
[go_to_editing.sh](https://github.com/penmaher/WRITE_with_git/blob/master/go_to_editing.sh) moves the user to the
Editing branch to continue editing the merged document.  Finally, the script
[compare_editing.sh](https://github.com/penmaher/WRITE_with_git/blob/master/compare_editing.sh) creates a diff between
the version on the Editing branch and the versions provided by the authors.  This will produce an individual
track-changes document for each author showing the difference to the version on the Editing branch.

For more detailed instructions please read:

- [Setup](https://github.com/penmaher/WRITE_with_git/blob/master/setting_up.md)
- [Instructions for use](https://github.com/penmaher/WRITE_with_git/blob/master/Instructions_for_use.md)
- [FAQ](https://github.com/penmaher/WRITE_with_git/blob/master/FAQ.md)

## Requirements

- [latexdiff](http://www.ctan.org/tex-archive/support/latexdiff)
- LaTeX packages: xparse, todonotes, datetime (optionally: xcolor)
