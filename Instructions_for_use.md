This software makes use of the [latexdiff](http://www.ctan.org/tex-archive/support/latexdiff) package. It is intended for writing scientific journal articles but you may find other uses for it.

First please look at the [work_flow](https://github.com/penmaher/WRITE_with_git/blob/master/workflow.png) for a visual description of how to manage your project.

Then follow the directions to set up the required links for run the track changes software. The instructions for this can be found in [INSTALL](https://github.com/penmaher/WRITE_with_git/blob/master/INSTALL.md)

This package assumes there is only one manager of the project who is competent at using git and LaTeX. The manager can then use this software to generate a track changed LaTeX document and manage revisions. Here is a description of the workflow.

1. Generate a new file paper.tex (you do not need to use *paper.tex*, the name of the main tex file should be defined in *user_config.sh*) with the preamble as in the example repo
   [testing_WRITE_with_git/article.tex](https://github.com/penmaher/testing_WRITE_with_git/blob/master/article.tex)

2. Initialise a git repository, then create one branch for each author and one extra called *editing*. Push changes to a remote repository.

3. Each author makes changes to paper.tex on their own branch. When each author is finished, ask all authors to push their changes and stop working on their files until further notice. When you're ready to start editing all of the author revisions, run `./track_changes/build_diff.sh`. This will generate the file *paper_diff.tex* on each branch.

4. Run `./track_changes/manage_merge.sh` to merge each authors revision into the *editing* branch. This stage requires the user to review each of the changes made by the authors. As such, this process can be time consuming and can't be automated. It uses the patch option of `git checkout`, see https://git-scm.com/docs/git-checkout, to merge the changes together in small hunks. Basic instructions are provided in [manage_merge.sh](https://github.com/penmaher/WRITE_with_git/blob/master/manage_merge.sh) which is a copy of the `git checkout --patch` documentation and includes an example.

5. Run ./track_changes/go_to_editing.sh to check out the *editing* branch version of paper.tex and work on blending the version together, fixing spelling, formatting etc. 
   - In the editing step you must manually remove all latexdiff commands (for example `DIFadd` and `DIFFdel`). This will allow you to produce an updated version of the paper without any latexdiff output.

6. When you're happy with the edits, run ./track_changes/compare_editing.sh to generate a pdf for each author that shows the changes to the document since their last revision. These files are located within the Editing/ folder. I usually send these pdf's via email to my authors. At this stage I usually check which files have changed between branches. To list the files that have changed `git diff --name-status branch1..branch2` or line information with `git diff branch1:path_to_file/file.tex..branch2:path_to_file/file.tex`

7. At this stage the editing branch has the most up-to-date version, so the master and each of the authors branches need to be updated. On the editing branch, merge the master into editing BUT we want to keep the version of the files that are on the editing branch. The merge strategy to achieve this is `git merge -s ours master`.

8. Then checkout the master and merge in the editing branch (which will not have any conflicts as we already merged these on the editing branch).

8. Then merge the master into the author branches. We want to keep the files from the master and 'clobber' the files on the author branches so run: `git merge -X theirs master`.

9. At this stage all branches are up-to-date and this should be pushed to the remote repo. I would then email all authors, attach the pdf showing changes since last revision (each author gets a different pdf) and advise that their branch has been updated and they need to pull the changes. 

10. Each author can continue to work on their file and then repeat steps 3-9.
