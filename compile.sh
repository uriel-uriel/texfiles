#! /bin/sh

if [ -n "$WORKDIR" ]; then
    echo $WORKDIR
else
    echo "empty WORKDIR"
    exit 0
fi

MAIN=$WORKDIR/main.tex
cd $WORKDIR
pdflatex -synctex=1 -interaction=batchmode -shell-escape $MAIN
biber $MAIN --onlylog #--validate_datamodel
makeglossaries $MAIN
pdflatex -synctex=1 -interaction=batchmode -shell-escape $MAIN
lualatex -synctex=1 -interaction=errorstopmode -shell-escape $MAIN
