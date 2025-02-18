@echo off 

echo %1
echo %2

mkdir %1
cd %1
mkdir %2
cd %2

set year=%1
set month=%2

set /A divisivelPor4=year %% 4
set /A divisivelPor100=year %% 100
set /A divisivelPor400=year %% 400

if %divisivelPor4%==0 (
    if %divisivelPor100%==0 (
        if %divisivelPor400%==0 (
            set anoBissexto=1
        ) else (
            set anoBissexto=0
        )
    ) else (
        set anoBissexto=1
    )
) else (
    set anoBissexto=0
)

if %anoBissexto%==1 (
    echo %year% é um ano bissexto.
    set days=29
) else (
    echo %year% não é um ano bissexto.
    set days=28
)
if %month%==1 set days=31
if %month%==3 set days=31
if %month%==4 set days=30
if %month%==5 set days=31
if %month%==6 set days=30
if %month%==7 set days=31
if %month%==8 set days=31
if %month%==9 set days=30
if %month%==10 set days=31
if %month%==11 set days=30
if %month%==12 set days=31

for /L %%D in (1,1,%days%) do (
    mkdir %%D
)