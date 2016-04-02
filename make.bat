xelatex main
bibtex main
xelatex main
xelatex main
latexmk -c
start main.pdf
python wc.py