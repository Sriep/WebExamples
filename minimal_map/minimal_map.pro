TEMPLATE = app

QT += location

SOURCES += main.cpp

RESOURCES += qml.qrc

target.path = $$[QT_INSTALL_EXAMPLES]/location/minimal_map
INSTALLS += target

DISTFILES += \
    deploy/buildWin_minimal_map.bat \
    deploy/InfoAfterWin.txt \
    deploy/InfoBeforeWin.txt \
    deploy/LicenseFileWin.txt \
    deploy/minimal_map.iss \
    release/default.desktop
