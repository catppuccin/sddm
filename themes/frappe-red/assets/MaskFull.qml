// Generated from SVG file mask.svg
import QtQuick
import QtQuick.Shapes

Item {
    implicitWidth: 192
    implicitHeight: 192
    transform: [
        Scale { xScale: width / 54.328; yScale: height / 54.328 }
    ]
    Shape {
        preferredRendererType: Shape.CurveRenderer
        ShapePath {
            strokeColor: "transparent"
            fillColor: config.LoginBackground == "true" ? config.mantle : config.base
            fillRule: ShapePath.WindingFill
            PathSvg { path: "M 0 0 L 0 54.328 L 54.328 54.328 L 54.328 0 L 0 0 M 27.1637 0.705383 C 41.7763 0.705384 53.622 12.5512 53.622 27.1637 C 53.622 41.7763 41.7763 53.622 27.1637 53.622 C 12.5512 53.622 0.705384 41.7763 0.705383 27.1637 C 0.705383 12.5512 12.5512 0.705383 27.1637 0.705383 " }
        }
        ShapePath {
            strokeColor: config.text
            strokeWidth: 1.37538
            capStyle: ShapePath.FlatCap
            joinStyle: ShapePath.MiterJoin
            miterLimit: 4
            fillColor: "transparent"
            fillRule: ShapePath.WindingFill
            PathSvg { path: "M 53.6402 27.164 C 53.6402 41.7864 41.7864 53.6402 27.164 53.6402 C 12.5416 53.6402 0.687777 41.7864 0.687777 27.164 C 0.687777 12.5416 12.5416 0.687777 27.164 0.687777 C 41.7864 0.687777 53.6402 12.5416 53.6402 27.164 " }
        }
    }
}
