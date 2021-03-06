import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Control {
    id: root

    property int computedImplicitWidth: fontMetrics.boundingRect(noteText.text).width + grid.columnSpacing + noteSpinbox.implicitWidth
    property int computedImplicitHeight: title.implicitHeight + noteSpinbox.implicitHeight * 3 + buttonMomentary.implicitHeight + grid.rowSpacing * 4
    property int computedImplicitDimension: Math.max(computedImplicitWidth, computedImplicitHeight)

    implicitWidth: computedImplicitDimension
    implicitHeight: computedImplicitDimension

    FontMetrics {
        id: fontMetrics
        font: noteText.font
    }

    GridLayout {
        id: grid

        anchors.fill: root
        columns: 2

        Text {
            id: title

            Layout.fillWidth: true
            Layout.columnSpan: 2

            text: 'Pad ' + controlId
        }

        Text {
            id: noteText
            text: "Note"
        }

        SpinBox {
            id: noteSpinbox
            editable: true
            Layout.fillWidth: true;
            to: 127
            value: note
            Binding {
                target: model
                property: "note"
                value: noteSpinbox.value
            }
        }

        Text {
            id: notePC
            text: "PC"
        }
        SpinBox {
            id: pcSpinbox
            editable: true
            Layout.fillWidth: true;
            to: 127
            value: pc
            Binding {
                target: model
                property: "pc"
                value: pcSpinbox.value
            }
        }

        Text {
            id: noteCC
            text: "CC"
        }
        SpinBox {
            id: ccSpinbox
            editable: true
            Layout.fillWidth: true;
            to: 127
            value: cc
            Binding {
                target: model
                property: "cc"
                value: ccSpinbox.value
            }
        }

        Button {
            id: buttonMomentary

            Layout.fillWidth: true
            Layout.columnSpan: 2

            checkable: true
            checked: model.toggle
            text: model.toggle ? "Toggle" : "Momentary"
            onClicked: {
                model.toggle = checked
            }
        }
    }
}
