REM buildWin_minimal_map.bat

REM Initilise builds
call C:\"Program Files (x86)\Microsoft Visual Studio 14.0\VC"\vcvarsall.bat amd64

REM source varables
set PROJECTNAME=simpletextviewer
set GITHUB_URL=https://github.com/Sriep/WebExamples.git

REM Set varables
set BUILD_DIR=C:\Data\Build_%PROJECTNAME%
set SRCDIR=%BUILD_DIR%\WebExamples\%PROJECTNAME%
set QT_DIR=C:\Qt\5.9\msvc2015_64
set PATH=%QT_DIR%\bin;%PATH%
set WINDEPLOYQT_EXE=%QT_DIR%\bin\windeployqt.exe
set INNO_DIR="C:\Program Files (x86)\Inno Setup 5"

REM Setup build directory
mkdir %BUILD_DIR%
cd %BUILD_DIR%

REM Download from GitHub
git clone %GITHUB_URL%

REM build
cd %SRCDIR%
qmake.exe %SRCDIR%\%PROJECTNAME%.pro -spec win32-msvc "CONFIG+=qtquickcompiler" && jom.exe qmake_all
jom.exe 
jom.exe clean

REM Build release
set RELEASE_DIR=%SRCDIR%\release
set QML_DIR=%SRCDIR%
%WINDEPLOYQT_EXE% --qmldir %QML_DIR% %RELEASE_DIR%\%PROJECTNAME%.exe

REM Generate qhc files
qhelpgenerator %SRCDIR%\documentation\simpletextviewer.qhp -o %SRCDIR%\documentation\simpletextviewer.qch
qcollectiongenerator %SRCDIR%\documentation\simpletextviewer.qhcp -o %SRCDIR%\documentation\simpletextviewer.qhc

REM Copy files for for assistant.exe
mkdir %RELEASE_DIR%\bin
copy /y  %QT_DIR%\bin\assistant.exe %RELEASE_DIR%\bin\assistant.exe
copy /y  %QT_DIR%\bin\Qt5Help.dll %RELEASE_DIR%\bin\Qt5Help.dll
copy /y  %QT_DIR%\bin\Qt5Printsupport.dll %RELEASE_DIR%\bin\Qt5Printsupport.dll
copy /y  %QT_DIR%\bin\Qt5Widgets.dll %RELEASE_DIR%\bin\Qt5Widgets.dll
copy /y  %QT_DIR%\bin\Qt5Gui.dll %RELEASE_DIR%\bin\Qt5Gui.dll
copy /y  %QT_DIR%\bin\Qt5Sql.dll %RELEASE_DIR%\bin\Qt5Sql.dll
copy /y  %QT_DIR%\bin\Qt5Core.dll %RELEASE_DIR%\bin\Qt5Core.dll
copy /y  %QT_DIR%\bin\Qt5Network.dll %RELEASE_DIR%\bin\Qt5Network.dll
copy /y  %SRCDIR%\documentation\simpletextviewer.qhc  %RELEASE_DIR%\simpletextviewer.qhc

REM Build setup filescd %INNO_DIR%
cd %INNO_DIR%
iscc /Q %SRCDIR%\deploy\%PROJECTNAME%.iss
