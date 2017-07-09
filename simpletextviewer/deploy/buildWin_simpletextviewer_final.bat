REM Batch file for auto build

REM Set project identity variables
set PROJECTNAME=simpletextviewer
set GITHUB_URL=https://github.com/Sriep/WebExamples.git
set BUILD_DIR=C:\Data\Build_%PROJECTNAME%

REM Set executable locations
set QT_DIR=C:\Qt\5.9.1\msvc2015_64
set QT_CREATORDIR=C:\Qt\Tools\QtCreator

REM Set internal variables
set SRCDIR=%BUILD_DIR%\WebExamples\%PROJECTNAME%
set PATH=%QT_DIR%\bin;%QT_CREATOR_DIR%/bin;%PATH%

REM Setup build directory
mkdir %BUILD_DIR%
cd %BUILD_DIR%

REM Download from GitHub
git clone %GITHUB_URL%

REM Initialise builds
call C:\"Program Files (x86)\Microsoft Visual Studio 14.0\VC"\vcvarsall.bat amd64

REM Build project
cd %SRCDIR%
qmake.exe %SRCDIR%\%PROJECTNAME%.pro -spec win32-msvc "CONFIG+=qtquickcompiler" && jom.exe qmake_all
jom.exe 
jom.exe clean

REM Build release
set WINDEPLOYQT_EXE=%QT_DIR%\bin\windeployqt.exe
set RELEASE_DIR=%SRCDIR%\release
set QML_DIR=%SRCDIR%
%WINDEPLOYQT_EXE% --qmldir %QML_DIR% %RELEASE_DIR%\%PROJECTNAME%.exe

REM Generate qhc files
qhelpgenerator %QML_DIR%\documentation\simpletextviewer.qhp -o %QML_DIR%\documentation\simpletextviewer.qch
qcollectiongenerator %QML_DIR%\documentation\simpletextviewer.qhcp -o %QML_DIR%\documentation\simpletextviewer.qhc
copy /y %QML_DIR%\documentation\simpletextviewer.qhc %RELEASE_DIR%\simpletextviewer.qhc
copy /y %QML_DIR%\documentation\simpletextviewer.qhc %RELEASE_DIR%\simpletextviewer.qch

REM Copy files for for assistant.exe
copy /y  %QT_DIR%\bin\assistant.exe %RELEASE_DIR%\assistant.exe
copy /y  %QT_DIR%\bin\Qt5Help.dll %RELEASE_DIR%\Qt5Help.dll
copy /y  %QT_DIR%\bin\Qt5Printsupport.dll %RELEASE_DIR%\Qt5Printsupport.dll
copy /y  %QT_DIR%\bin\Qt5Sql.dll %RELEASE_DIR%\Qt5Sql.dll
REM Copy sql drivers
mkdir %RELEASE_DIR%\sqldrivers
copy /y  %QT_DIR%\plugins\sqldrivers\qsqlite.dll %RELEASE_DIR%\sqldrivers\qsqlite.dll
copy /y  %QT_DIR%\plugins\sqldrivers\qsqlmysql.dll %RELEASE_DIR%\sqldrivers\qsqlmysql.dll
copy /y  %QT_DIR%\plugins\sqldrivers\qsqlodbc.dll %RELEASE_DIR%\sqldrivers\qsqlodbc.dll
copy /y  %QT_DIR%\plugins\sqldrivers\qsqlpsql.dll %RELEASE_DIR%\sqldrivers\qsqlpsql.dll

REM Create install file
set INNO_DIR="C:\Program Files (x86)\Inno Setup 5"
cd %INNO_DIR%
iscc /Q %SRCDIR%\deploy\%PROJECTNAME%.iss

