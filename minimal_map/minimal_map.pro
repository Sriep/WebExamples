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
    release/default.desktop \
    deploy/deploy - Shortcut.lnk \
    deploy/buildLinux_minimal_map.sh \
    deploy/minimal_map.iss \
    deploy/LicenseFileWin.txt \
    deploy/InfoBeforeWin.txt \
    deploy/InfoAfterWin.txt \
    deploy/buildWin_minimal_map_final.bat \
    deploy/buildWin_minimal_map2.bat \
    deploy/buildWin_minimal_map1.bat
