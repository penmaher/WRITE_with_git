##FAQ, hints and advice.

####Q. What happens if an author continues to work on a file but I advanced the revision and their branch has conflicts?

The short answer is that you will have conflicts between the revisions. This is annoying and will be time consuming to fix. The manager of the project has to fix it. Ask the author to make no further changes and push their changes. I have not tested this idea as yet but here is the conceptual idea I would test. If they can not push their changes because of merge conflicts then you need to manage their branch for them. To do this revert their branch to the last commit the author made. Please make sure you understand what you are doing before executing any of these codes as you may have undesirable effects. Might also be worth saving the .tex somewhere outside the repo for a back up. To move your branch back: ```git reset -hard HEAD~n``` where `n` is the number of commits behind the head you want to checkout.  When the head has moved back push the branch. Then ask the author to push their changes. Which should occur without conflict. Now you can either manually merge the new revision and their updated (but older revision) or you can run the software again to merge it for you. I recommend a manual merge using [meld](http://meldmerge.org/). 

####Q. What happens if there is a compile error when running build_diff.sh?

Kill the compile. You should already be on the branch with the problem tex file. So manually compile and bug fix until the problem is resolved. Then run build_diff.sh again.

####Q. SSH or HTML git to remote?

SSH so you can set up a ssh key pair. There are a lot of password calls and this will speed up the runtime.

####Q What if I am the only one that contributed to a revision. 
Carry out the same procedure but in the manage merge stage accept all your edits and do not accept any from the other authors (ie don't accept the old revision edits over the top of the new revision). But once the file has been merged just copy over the tex file on the `editing` branch with the file from the branch with the most recent revision. This saves removing all the `diffadd` and `diffdel` form the tex file. You still have the _diff.tex file which is important (and the reason you should run the manage merge in this context).

####Q. My branch is not being tracked. 
Did you push branches upstream when they were initialised? ```git push --all origin``` 

####Q. My branch did not update.
Sometimes a git pull is not sufficient. May need to ```git pull -all```

####Q. I get a compile error where it states that \testcolor is already defined.
This is because the .cls you are using or your article also uses this variable name. Suggest changing the .cls to \testcolorjournal or similar. If this is not the case, do a `grep -r '\testcolor'' to find where it is defined in your local folder.

###Advice:

Do not build someone a branch until they need it, as it slows down the process.

### How to use the patch and edit the chunks

#### Usefull commands

1. To accept a change `y` to reject it `n`.
2. If you are on a branch where no work has been done by that author, then speed through the patch by using 'a' to accept all or 'd' to accept none.
3. To break the hunk down `s`.
4. To manually edit `e`
5. To quit `q`.


#### Manually editing the patches. 

If more than one author was worked on a paragraph then the patch is more complicated. In order to avoid errors in apply the hunk, I recommend keeping both paragraphs then edit later.

#### How to keep text that is staged for removed?

To do this remove the '-' and replace it with a ' ' (ie 1 space). 

### How to use the todo notes with authors who do not want to use WRITE_with_git
The following lates syntax should do the trick
```
\newcommand{\currentauthor}{Penny} %first name with capital to start.
\newcommand{\Penny}[1]{\todo{\small\rmfamily #1} }
```
