import Felgo 3.0
import QtQuick 2.0
import"common"

GameWindow {
   id: gameWindow
   activeScene: gameScene
   screenHeight: 640

   GameScene {
    id: gameScene
  }
   AudioPlayer{
       id:audioPlayer
   }
}
