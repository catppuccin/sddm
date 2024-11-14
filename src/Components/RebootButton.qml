import QtQuick 6.8
import QtQuick.Controls 6.8

Item {
  implicitHeight: rebootButton.height
  implicitWidth: rebootButton.width

  Button {
    id: rebootButton
    height: inputHeight
    width: inputHeight
    hoverEnabled: true

    icon.source: Qt.resolvedUrl("../icons/reboot.svg")
    icon.height: height
    icon.width: width
    icon.color: config.crust

    background: Rectangle {
      id: rebootButtonBackground
      radius: 3
      color: config.red
    }

    states: [
      State {
        name: "hovered"
        when: rebootButton.hovered
        PropertyChanges {
          target: rebootButtonBackground
          color: config.rosewater
        }
      }
    ]

    transitions: Transition {
      PropertyAnimation {
        property: "color"
        duration: 300
      }
    }

    onClicked: sddm.reboot()
  }
}
