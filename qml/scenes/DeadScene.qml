import QtQuick 2.15
import Felgo 3.0

// EMPTY SCENE

SceneBase {
    id:deadScene
    signal retryPressed
    Rectangle {
        anchors.fill: gameScene.gameWindowAnchorItem
      color: "#74d6f7"
    }
    // column aligns its child components within a column
    Column {
      anchors.centerIn: parent
      spacing: 20
      Rectangle {
        width: 150
        height: 50
        color: "white"
        opacity: 0.4
         Text{
              text:"game over"
              anchors.centerIn: parent
              color: "black"
              font.pixelSize: 21
         }
      }
      // play button to start game
      Rectangle {
        width: 150
        height: 50
        color: "#F0E68C"
         Text{
              text:"try again"
              anchors.centerIn: parent
              color: "black"
              font.pixelSize: 21
         }
         TapHandler {
             acceptedPointerTypes: PointerDevice.GenericPointer | PointerDevice.Finger | PointerDevice.Pen
             onTapped: retryPressed()
         }
      }

      // option button
      Rectangle {
        width: 150
        height: 50
        color: "#F0E68C"
        Image {
          id: optionSceneButton
  //        source: "../../assets/.png"
          anchors.centerIn: parent
        }
        Text{
             text:"exit"
             anchors.centerIn: parent
             color: "black"
             font.pixelSize: 21
        }
            TapHandler {
                acceptedPointerTypes: PointerDevice.GenericPointer | PointerDevice.Finger | PointerDevice.Pen
//                onTapped:
            }
          }
        }

}
