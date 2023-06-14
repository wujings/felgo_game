import QtQuick 2.0
import Felgo 3.0

EntityBase {
  id: monster
  //base class of enemy
//enabled:
  entityType: "opponent"

  property int column
  property int row
  x:(column-1)*gameScene.gridSize
  y:gameScene.gridSize*20 - row*gameScene.gridSize

  property bool alive: true


  function getShot() {
    visible = false
  }

}
