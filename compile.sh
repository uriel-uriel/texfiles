#! /bin/sh
MAIN=/home/teonana/Documents/proshects/tesis/template/main.tex
cd /home/teonana/Documents/proshects/tesis/template/
pdflatex -synctex=1 -interaction=batchmode -shell-escape $MAIN
biber $MAIN --onlylog #--validate_datamodel
makeglossaries $MAIN
pdflatex -synctex=1 -interaction=batchmode -shell-escape $MAIN
lualatex -synctex=1 -interaction=errorstopmode -shell-escape $MAIN
