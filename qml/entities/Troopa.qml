import QtQuick 2.0
import Felgo 3.0
//flying Koopa Troopa,another classic enemy
Monster{
id:troopa
entityType: "troopa"
property int speed:30
property int verticalJumpForce: 510
property int horizontalJumpForce: 40
property bool alive:true
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
       sprite.mirror=true
    // make sure the speed is constant
    linearVelocity.x = direction * speed
  }
  fixture.onContactChanged: {
    var otherEntity = other.getBody().target

    // When the opponent stands on a solid object, we want it
    // to wait a little and then jump again.
    // Since we set the collidesWith property, we can be sure
    // that it won't collide with any unwanted entities.
    if(collider.linearVelocity.y === 0 &&alive==true)
      jumpTimer.start()
  }

}
//hide afterdead timer
    Timer {
      id: hideTimer
      interval: 1500
      onTriggered: {
        hidden = true
        troopa.destroy()
      }
    }
    Timer{
        id:jumpTimer
        interval:3000
//        autoplay:true
        onTriggered:{
            // jump in the current direction
//            collider.applyLinearImpulse(Qt.point(direction * horizontalJumpForce, -verticalJumpForce))
            collider.linearVelocity.y = -(gameScene.gridSize*18)

            // alternate direction after every jump
            direction *= -1
          }
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
