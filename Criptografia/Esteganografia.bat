echo off
CHCP 65001 >NUL
mode con:cols=100 
Title Esteganografia - Programa Cifras
:Esteganografia 
cls
echo.
echo               Esteganografia 
echo.
echo                   .--.      
echo               --:-....://-    
echo             -:.````````` -o.  
echo            --``````...``   o. 
echo            +..````/odo: ```.o 
echo            o``````:oyo-````.o 
echo            /:``````````   `/: 
echo             /+`          .+:  
echo              `o+/.````.:/:`   
echo              :od/--::--`      
echo             /sh-              
echo           .+hy`               
echo          -od+                 
echo         :sm:                  
echo       `/hh.                   
echo      .oms`                    
echo      `// 
echo.
echo	[1] - Iniciar Função
echo.	
echo	[2] - Sair
echo.
echo.
set /p "Esto=Escolha uma Opção da Esteganografia [1,2]>"
if  %Esto%==1 goto est1
if  %Esto%==2 goto Exit
if not %Esto% LEQ 2 start C:\Users\Tucira\Desktop\Criptografia\VBS\Parametros_Incorrectos.vbs&&goto Esteganografia
:est1
cls
echo.
REM Camuflar ficheiro numa fotografia,ou outro tipo de ficheiro (ex.:jpeg,mpeg4,mp3,pdf,word), de forma criptografada e com palavra-passe
set /p "D1=Digite o Caminho do Ficheiro, que pretende Ocultar>"
IF {%D1%}=={} goto est1
echo.
echo.
CHCP 860 >NUL
set "psCommand=powershell -Command "$pword = read-host 'Insira a sua palavra-passe' -AsSecureString ; ^
     $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword); ^
           [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
for /f "usebackq delims=" %%p in (`%psCommand%`) do set password=%%p
echo %password%>C:\Users\Tucira\Desktop\senha.txt
set password=C:\Users\Tucira\Desktop\senha.txt
goto est2
:est2
echo.
echo.
set "psCommand=powershell -Command "$pword = read-host 'Insira novamente a sua palavra-passe' -AsSecureString ; ^
     $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword); ^
           [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
for /f "usebackq delims=" %%p in (`%psCommand%`) do set pass=%%p
echo %pass%>C:\Users\Tucira\Desktop\senha2.txt
fc /L /LB1 C:\Users\Tucira\Desktop\senha.txt C:\Users\Tucira\Desktop\senha2.txt >NUL
IF %ERRORLEVEL% EQU 1 GOTO est3 
if %ERRORLEVEL% EQU 0 GOTO est4
:est3  
cls
del C:\Users\Tucira\Desktop\senha2.txt
del C:\Users\Tucira\Desktop\senha.txt
start C:\Users\Tucira\Desktop\Criptografia\VBS\Palavra_Passe_Incorrecta.vbs&&goto Esteganografia
:est4
del C:\Users\Tucira\Desktop\senha.txt
del C:\Users\Tucira\Desktop\senha2.txt&&goto est5 
:est5
md C:\Users\Tucira\Desktop\Criptografia\tempo
start/wait winrar.exe a -ep -hp%Pass% "C:\Users\Tucira\Desktop\Criptografia\tempo\temp.rar" %D1%
ren C:\Users\Tucira\Desktop\Criptografia\tempo "tempo Locker" 
attrib +h +s "C:\Users\Tucira\Desktop\Criptografia\tempo Locker"
echo.
echo.
:est6
set /p "D2=Digite Caminho do Ficheiro (ex.:jpeg,mpeg4,mp3,pdf,word),que vai servir de Camuflagem>"
IF {%D2%}=={} goto est6
echo. 
echo.
:est7
set /p "D3=Digite o Caminho para enviar o resultado Final>"
IF {%D3%}=={} goto est7
echo.
echo.
echo.
attrib -h -s "C:\Users\Tucira\Desktop\Criptografia\tempo Locker"
ren "C:\Users\Tucira\Desktop\Criptografia\tempo Locker" tempo
set temp="C:\Users\Tucira\Desktop\Criptografia\tempo\temp.rar"
copy /b %D2% + %temp% %D3%
del "C:\Users\Tucira\Desktop\Criptografia\tempo\temp.rar"  
rd "C:\Users\Tucira\Desktop\Criptografia\tempo"
pause
goto inicio