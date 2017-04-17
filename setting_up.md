Install instructions:

1. This package relies on latexdiff which can be downloaded from http://www.ctan.org/tex-archive/support/latexdiff

2. Fork this repo (WRITE_with_git) to your local machine.

3. Fork the testing environment repo (testing_WRITE_with_git) to your local machine. 

4. Within the testing_WRITE_with_git root directory create a symbolic link called 'track_changes' that points to the root directory of WRITE_with_git. eg: 
 ln -s $path_to_repo/WRITE_with_git/ track_changes

5. The next step is setting up the user_config.sh file which is located in testing_WRITE_with_git. Open the user_config.sh file for documentation.

6. From within testing_WRITE_with_git run the script ./track_changes/set_author_info_color.sh This will auto-generate three files:
  a) author_colors.tex
  b) color_change.tex
  c) author_info.tex
  These files are need to set up and define each authors colours, set up to do note properties, etc.
