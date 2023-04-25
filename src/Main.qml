import QtQuick 2.0
import SddmComponents 2.0
import "Components"

Item {
  id: root
  height: Screen.height
  width: Screen.width
  Item {
    id: background
    anchors.fill: parent
    height: parent.height
    width: parent.width
    color: Qt.darker(config.background)
  }
  Item {
    id: contentPanel
    anchors {
      fill: parent
      topMargin: config.Padding
      rightMargin: config.Padding
      bottomMargin:config.Padding
      leftMargin: config.Padding
    }
    DateTimePanel {
      id: dateTimePanel
      anchors.fill: parent
    }
    LoginPanel {
      id: loginPanel
      anchors.fill: parent
    }
  }
}
