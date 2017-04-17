First please look at the workflow.png for a visual description of how to manage your project.

This package assumes there is only one manager of the project who is competent at using git and latex. 

This software makes use of the 

The manager can then use this software to generate a track changed latex document:

1. Generate a new file paper.tex with the preamble as in test_latex_git_track_changes/article.tex

2. Initialise a git repository, then create one branch for each author and an extra one called 'editing'. Push changes to a remote repository.

3. On each branch make desired changes to the paper.tex file. Ask all authors to push their changes and stop working on their files until they hear from you. When your ready to merge the files the run ./track_changes/build_diff.sh This will generate the file article_diff.tex on each branch.

4. Then run ./track_changes/manage_merge.sh to merge paper.tex from each authors branch. This stage can be time consuming and can't be automated. It uses git patch, see https://git-scm.com/docs/git-checkout to merge the changes together in small chunks. There are basic instructions provided in the manage_merge.sh file which is a copy of the documentation and an example.

5. Then run ./track_changes/go_to_editing.sh to checkout out the editing branch version of paper.tex and work on blending the version together, fixing spelling, formatting etc. 

6. When your happy with the edits, run ./track_changes/compare_editing.sh to generate a pdf for each authors that shows the changes to the document since their last revision. These files are located within the Editing/ folder. I usually send these pdf's via email to my authors.

7. At this stage the editing branch has the most up-to-date version, so the master and each of the authors branches need to be updates. On the editing branch, merge the master into editing BUT we want to keep the version of the files that are on editing branch. The merge strategy for this is git merge -s ours master

8. Then checkout the master and merge in the editing branch (which will not have any conflicts as we already merged these on the editing branch). Then merge the master into the author branches. We want to keep the files from the master and 'clobber' the files on the author branches so run: git merge -X theirs master.

9. At this stage all branches are up-to-date and this should be pushed to the remote repo. I would then email all authors and advise that their branch has been updated and they need to pull the changes. 

10. Each author can continue to work on their file and then repeat steps 3-9.
