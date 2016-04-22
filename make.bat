@if "%1"=="print" goto p
@if "%1"=="fast" goto f
@if "%1"=="-h" goto h

@echo 正在编译电子版
xelatex main
bibtex main
xelatex main
xelatex main
@goto c

:p
@echo 正在编译打印版
xelatex "\def\print{1}\input{main.tex}"
bibtex main
xelatex "\def\print{1}\input{main.tex}"
xelatex "\def\print{1}\input{main.tex}"
latexmk -c
@if exist print.pdf (
    del print.pdf
)
ren main.pdf print.pdf
start print.pdf
python wc.py
@goto end

:f
xelatex main
@goto c

:c
latexmk -c
start main.pdf
python wc.py
@goto end

:h
@echo 用法 make [option]
@echo option为空则编译电子版
@echo option=print编译打印版
@echo option=fast快速编译，不会插入引文

:end
