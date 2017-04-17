Install instructructions:

0. This softare relies on latexdiff which can be downloaded from http://www.ctan.org/tex-archive/support/latexdiff

1. Fork the git repo to your local machine. latex_git_track_changes

2. Fork the testing environment repo to your local machine. test_latex_git_track_changes.

3. Within the test_latex_git_track_changes root directory create a symbolic link called 'track_changes' in the repo root directory latex_git_track_changes. eg: 
 ln -s $path_to_repo/latex_git_track_changes/ track_changes

4. The next step is setting up the user_config.sh file which is loacted in test_latex_git_track_changes. Open the user_config.sh file for seperate set up documentation.

5. From within test_latex_git_track_changes run the script track_changes/set_author_info_color.sh This will auto generate three files:
  a) author_colors.tex
  b) color_change.tex
  c) author_info.tex
  These files are need to get up define each authors colours, set up to do note propoerties, etc.

6. 
