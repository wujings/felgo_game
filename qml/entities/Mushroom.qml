import QtQuick 2.0
import Felgo 3.0

EntityBase {

    property int column
    property int row


    x: row*gameScene.gridSize
    y: level.height - (column+1)*gameScene.gridSize
    id: mushroom
    entityType: "mushroom"
    // this property is true when the player collected the coin
    property bool collected: false
    MultiResolutionImage{
        id:img
        width: gameScene.gridSize-3
        height: gameScene.gridSize-3
        source: "../../assets/mushroom.png"
    }
    CircleCollider {
      id: collider

      // make the collider a little smaller than the sprite
      radius: 6

      // center collider
      x: 3
      y: 3

      active: !collected

      bodyType: Body.Static
      collisionTestingOnlyMode: true

      // Category6: coin
      categories: Box.Category6
      // Category1: player body
      collidesWith: Box.Category1
    }
    function collect(){
        if(collected == false)
        collected = true
        img.visible = false
    }

}

