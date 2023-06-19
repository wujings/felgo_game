import QtQuick 2.0
import Felgo 3.0
//flying Koopa Troopa,another classic enemy
Monster{
id:troopa
entityType: "troopa"
property int speed:20
//sprite setting
TexturePackerSpriteSequence {
    id: sprite
    TexturePackerSprite {
        name: "walk"
        source: "../../assets/troopa/tfly.json"
        frameNames: ["tfly-0.png","tfly-3.png"]
        frameRate: 5
    }

    TexturePackerSprite {
        name: "die"
        source: "../../assets/troopa/tdie.json"
        frameNames: ["tdie-0.png", "tdie-1.png","tdie-2.png"]
        frameRate: 5
    }
}
    //Collider setting
PolygonCollider {
  id: collider
  // the vertices, forming the shape of the collider
  vertices: [
      Qt.point(2, 10), // top left
      Qt.point(2, 30), // bottom left
      Qt.point(20, 30), // bottom right
      Qt.point(20, 10) // top right
  ]
  bodyType: Body.Dynamic
  // Category3: opponent body
  categories: Box.Category3
  collidesWith: Box.Category1 | Box.Category2| Box.Category5//1:player 2:player kill area 5:scene
  linearVelocity: Qt.point(direction * speed, 0)

  onLinearVelocityChanged: {
    // if the opponent stops moving, reverse direction
    if(linearVelocity.x === 0)
      direction *= -1

    // make sure the speed is constant
    linearVelocity.x = direction * speed
  }

}
//hide afterdead timer
    Timer {
      id: hideTimer
      interval: 1500
      onTriggered: hidden = true
    }
    Timer{
        id:jumpTimer
        interval:1000
//        autoplay:true
        onTriggered:collider.linearVelocity.y = -300
    }
//call when die
    function getShot() {
       alive = false
//        audioPlayer.playSound("troopaDie")
        player. jump()
        console.debug("troopa die")
        sprite.jumpTo("die")
        collider.linearVelocity.x =0
        hideTimer.start()

    // for every killed opponent, the time gets set back a little bit
    //      gameScene.time -= 5
    }
}
