import QtQuick 6.8
import QtQuick.Controls 6.8

Item {
  implicitHeight: powerButton.height
  implicitWidth: powerButton.width

  Button {
    id: powerButton
    height: inputHeight
    width: inputHeight
    hoverEnabled: true

    icon.source: Qt.resolvedUrl("../icons/power.svg")
    icon.height: height
    icon.width: width
    icon.color: config.crust

    background: Rectangle {
      id: powerButtonBackground
      radius: 3
      color: config.red
    }

    states: [
      State {
        name: "hovered"
        when: powerButton.hovered
        PropertyChanges {
          target: powerButtonBackground
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

    onClicked: sddm.powerOff()
  }
}
