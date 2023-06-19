import Felgo 3.0
import QtQuick 2.0
import "../"

SceneBase {
  id:menuScene

  // signal indicating that the gameScene should be displayed
  signal gameScenePressed
  // background image
  Image {
    anchors.fill: menuScene.gameWindowAnchorItem
//    source: "../../assets/menuBackground.png"
  }
  //     filled the screen with blue
      Rectangle {
        anchors.fill: menuScene.gameWindowAnchorItem
        color: "#74d6f7"
      }
  // column aligns its child components within a column
  Column {
    anchors.centerIn: parent
    spacing: 20

    // play button to start game
    Rectangle {
      width: 150
      height: 50
      color: "#F0E68C"
       Text{
            text:"play"
            anchors.centerIn: parent
            color: "black"
            font.pixelSize: 21
       }


      MouseArea {
        id: gameSceneMouseArea
        anchors.fill: parent
        onClicked: gameScenePressed()
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
           text:"option"
           anchors.centerIn: parent
           color: "black"
           font.pixelSize: 21
      }
      MouseArea {
        id: optionSceneMouseArea
        anchors.fill: parent
//        onClicked:
      }
    }

  }
}
