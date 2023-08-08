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
      height: inputHeight
      width: parent.width
      highlighted: sessionList.currentIndex == index
      contentItem: Text {
        renderType: Text.NativeRendering
        font.family: config.Font
        font.pointSize: config.FontSize
        font.bold: true
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: config.text
        text: name
      }
      background: Rectangle {
        id: sessionEntryBackground
        color: config.surface1
        radius: 3
      }
      states: [
        State {
          name: "hovered"
          when: sessionEntry.hovered
          PropertyChanges {
            target: sessionEntryBackground
            color: config.surface2
          }
        }
      ]
      transitions: Transition {
        PropertyAnimation {
          property: "color"
          duration: 300
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
  }
  Button {
    id: sessionButton
    height: inputHeight
    width: inputHeight
    hoverEnabled: true
    icon {
      source: Qt.resolvedUrl("../icons/settings.svg")
      height: height
      width: width
      color: config.text
    }
    background: Rectangle {
      id: sessionButtonBackground
      color: config.surface0
      radius: 3
    }
    states: [
      State {
        name: "pressed"
        when: sessionButton.down
        PropertyChanges {
          target: sessionButtonBackground
          color: config.surface1
        }
      },
      State {
        name: "hovered"
        when: sessionButton.hovered
        PropertyChanges {
          target: sessionButtonBackground
          color: config.surface2
        }
      },
      State {
        name: "selection"
        when: sessionPopup.visible
        PropertyChanges {
          target: sessionButtonBackground
          color: config.surface2
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
    x: (sessionButton.width + sessionList.spacing) * -7.6
    y: -(contentHeight + padding * 2) + sessionButton.height
    padding: inputHeight / 10
    background: Rectangle {
      radius: 5.4
      color: config.surface0
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
          from: sessionPopup.x + (inputWidth * 0.1)
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
