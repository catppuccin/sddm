import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQml.Models 2.12

Item {
  property var session: sessionList.currentIndex
  implicitHeight: sessionButton.height
  implicitWidth: sessionButton.width
  DelegateModel {
    id: sessionWrapper
    model: sessionModel
    delegate: ItemDelegate {
      id: sessionEntry
      highlighted: sessionList.currentIndex == index
      height: inputHeight
      width: parent.width
      contentItem: Text {
        text: name
        renderType: Text.NativeRendering
        font {
          family: config.Font
          pointSize: config.FontSize
          bold: true
        }
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: config.crust
      }
      background: Rectangle {
        id: sessionEntryBg
        radius: 3
        color: config.sapphire
      }
      transitions: Transition {
        PropertyAnimation {
          property: "color"
          duration: 150
        }
      }
      MouseArea {
        anchors.fill: parent
        onClicked: {
          sessionList.currentIndex = index
          sessionPopup.close()
        }
      }
    }
    Button {
      id: sessionButton
      height: inputHeight
      width: inputHeight
      hoverEnabled: true
      icon.source: Qt.resolvedUrl("../icons/settings.svg")
      icon.height: height * 0.6
      icon.width: width * 0.6
      icon.color: config.crust
      background: Rectangle {
        id: sessionButtonBackground
        color: config.green
        radius: 3
      }
      states: [
        State {
          name: "pressed"
          when: sessionButton.down
          PropertyChanges {
            target: sessionButtonBackground
            color: config.green
          }
        },
        State {
          name: "hovered"
          when: sessionButton.hovered
          PropertyChanges {
            target: sessionButtonBackground
            color: config.green
          }
        },
        State {
          name: "selection"
          when: sessionPopup.visible
          PropertyChanges {
            target: sessionButtonBackground
            color: config.green
          }
        }
      ]
      transitions: Transition {
        PropertyAnimation {
          properties: "color"
          duration: 150
        }
      }
      onClicked: {
        sessionPopup.visible ? sessionPopup.close() : sessionPopup.open()
        sessionButton.state = "pressed"
      }
    }
    Popup {
      id: sessionPopup
      width: inputWidth + padding * 2
      x: sessionButton.width + sessionList.spacing
      y: -(contentHeight + padding * 2) + sessionButton.height
      padding: 15
      background: Rectangle {
        radius: 5.4
        color: config.sapphire
      }
      contentItem: ListView {
        id: sessionList
        implicitHeight: contentHeight
        spacing: 8
        model: sessionWrapper
        currentIndex: sessionModel.lastIndex
        clip: true
      }
      enter: Transition {
        ParallelAnimation {
          NumberAnimation {
            property: "opacity"
            from: 0
            to: 1
            duration: 400
            easing.type: Easing.OutExpo
          }
          NumberAnimation {
            property: "x"
            from: sessionPopup.x - (inputWidth * 0.1)
            to: sessionPopup.x
            duration: 500
            easing.type: Easing.OutExpo
          }
        }
      }
      exit: Transition {
        NumberAnimation {
          property: "opacity"
          from: 1
          to: 0
          duration: 300
          easing.type: Easing.OutExpo
        }
      }
    }
  }
}
