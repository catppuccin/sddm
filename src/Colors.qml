pragma Singleton
import QtQuick 2.15
import "."

QtObject {
  // window / panels
  readonly property color windowBackground: Palette.base
  readonly property color panelBackground: Palette.mantle

  // body text and text-field selection
  readonly property color textPrimary: Palette.text
  readonly property color selectionColor: Palette.overlay0

  // input fields, session button/popup, session list entries (elevation ramp)
  readonly property color surfaceBase: Palette.surface0
  readonly property color surfaceHover: Palette.surface1
  readonly property color surfaceActive: Palette.surface2

  // power/reboot/sleep buttons
  readonly property color dangerButtonBackground: Palette.red
  readonly property color dangerButtonBackgroundHover: Palette.rosewater

  // login button
  readonly property color primaryButtonBackground: Palette.accent
  readonly property color primaryButtonBackgroundHover: Palette.subtext0

  // icon/text drawn on top of the danger/primary buttons above
  readonly property color textOnAccent: Palette.crust
}
