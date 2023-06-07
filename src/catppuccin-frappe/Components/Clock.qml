import QtQuick 2.12
import SddmComponents 2.0

Clock {
  id: time
  color: config.text
  timeFont.family: config.Font
  anchors {
    margins: 10
    top: parent.top
    right: parent.right
  }
}
