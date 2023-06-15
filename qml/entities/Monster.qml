import QtQuick 2.0
import Felgo 3.0

EntityBase {
  id: monster
  //base class of enemy
//enabled:
  entityType: "monster"
  signal contact
  property int column
  property int row
  x:(column-1)*gameScene.gridSize
  y:gameScene.gridSize*20 - row*gameScene.gridSize

  property bool hidden: false
  property bool alive: true
  property int direction:-1

  Timer {
    id: hideTimer
    interval: 2000
    onTriggered: hidden = true
  }
  function getShot() {
      alive = false

      hideTimer.start()

      if(variationType == "Goomba")
        audioPlayer.playSound("GoombaDie")

      // for every killed opponent, the time gets set back a little bit
//      gameScene.time -= 5
  }
  function die(){
     player. jump()
      console.debug("monster die")
      alive = false
      collider.linearVelocity.x =0
  }
}
