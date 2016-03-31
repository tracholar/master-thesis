if not "%1" == "" (
    echo %1
) else (
    echo Hello.
    set DAY=date /T
)