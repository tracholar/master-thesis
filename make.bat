@if "%1"=="print" goto p
@if "%1"=="fast" goto f
@if "%1"=="-h" goto h

@echo ���ڱ�����Ӱ�
xelatex main
bibtex main
xelatex main
xelatex main
@goto c

:p
@echo ���ڱ����ӡ��
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
@echo �÷� make [option]
@echo optionΪ���������Ӱ�
@echo option=print�����ӡ��
@echo option=fast���ٱ��룬�����������

:end
