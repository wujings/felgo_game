import QtQuick 2.0
import Felgo 3.0

EntityBase {

    id: coin
    entityType: "coin"

    // this property is true when the player collected the coin
    property bool collected: false
    TexturePackerAnimatedSprite{
        id:img
        visible: true
        source: "../../assets/coins/coins.json"
        frameNames: ["coin-0.png", "coin-1.png", "coin-2.png","coin-3.png","coin-4.png","coin-5.png"]
        frameRate: 5
    }
    CircleCollider {
      id: collider

      // make the collider a little smaller than the sprite
      radius: parent.width / 2

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
        collected = true
        img.visible = false
    }

}
