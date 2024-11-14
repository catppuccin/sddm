import QtQuick 6.8
import QtQuick.Controls 6.8

Item {
  implicitHeight: sleepButton.height
  implicitWidth: sleepButton.width

  Button {
    id: sleepButton
    height: inputHeight
    width: inputHeight
    hoverEnabled: true

    icon.source: Qt.resolvedUrl("../icons/sleep.svg")
    icon.height: height
    icon.width: width
    icon.color: config.crust

    background: Rectangle {
      id: sleepButtonBg
      color: config.red
      radius: 3
    }

    states: [
      State {
        name: "hovered"
        when: sleepButton.hovered
        PropertyChanges {
          target: sleepButtonBg
          color: config.rosewater
        }
      }
    ]

    transitions: Transition {
      PropertyAnimation {
        properties: "color"
        duration: 300
      }
    }

    onClicked: sddm.suspend()
  }
}
