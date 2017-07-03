HEADERS       = mainwindow.h \
                findfiledialog.h \
                assistant.h \
                textedit.h
SOURCES       = main.cpp \
                mainwindow.cpp \
                findfiledialog.cpp \
                assistant.cpp \
                textedit.cpp

QT += widgets

target.path = $$[QT_INSTALL_EXAMPLES]/assistant/simpletextviewer
docs.files += $$PWD/documentation
docs.path = $$target.path

INSTALLS += target docs

RESOURCES += \
    resources.qrc

DISTFILES += \
    deploy/buildWin_simpletextviewer.bat \
    deploy/buildWin_simpletextviewer1.bat \
    deploy/buildWin_simpletextviewer2.bat \
    deploy/buildWin_simpletextviewer3.bat \
    deploy/InfoAfterWin.txt \
    deploy/InfoBeforeWin.txt \
    deploy/LicenseFileWin.txt \
    deploy/simpletextviewer.iss \
    deploy/buildLinux_simpletestviewer.sh \
    release/default.desktop
