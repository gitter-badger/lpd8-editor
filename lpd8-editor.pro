QT += qml quick sql

CONFIG += c++11 link_pkgconfig

SOURCES += src/main.cpp \
    src/application.cpp \
    src/db.cpp \
    src/utils.cpp \
    src/qmltablemodelproxy.cpp \
    src/midiio.cpp \
    src/lpd8controller.cpp \
    src/lpd8_sysex.cpp

RESOURCES += src/qml.qrc \
    src/sql.qrc \
    src/qtquickcontrols2.conf

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

INCLUDEPATH += $$PWD/src

HEADERS += \
    src/application.h \
    src/db.h \
    src/utils.h \
    src/qmltablemodelproxy.h \
    src/midiio.h \
    src/lpd8controller.h \
    src/lpd8_sysex.h \
    src/lpd8_types.h

DISTFILES += \
    README.md

PKGCONFIG += alsa
