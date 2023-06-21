import QtQuick 2.0
import Felgo 3.0
//basic and classic mario enemy Goomba
Monster{
    id:goomba
    entityType: "goomba"
    property int speed:10
    //the sprire sheet
    TexturePackerSpriteSequence {
        id: sprite
        TexturePackerSprite {
            name: "walk"
            source: "../../assets/goomba/goomba.json"
            frameNames: ["goomba-00.png", "goomba-01.png"]
            frameRate: 5
        }

        TexturePackerSprite {
            name: "die"
            source: "../../assets/goomba/goomba.json"
            frameNames: "goomba-02.png"
            frameRate: 5
        }
    }
    //the collider logical
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
      interval:500
      onTriggered: {
        hidden = true
        goomba.destroy()
      }
    }
    //call when die
    function getShot() {
       alive = false
    //        audioPlayer.playSound("GoombaDie")
        collider.linearVelocity.x =0
        player. jump()
        console.debug("goomba die")
        sprite.jumpTo("die")
//        goomba.entityDestroyed()
        hideTimer.start()

    // for every killed opponent, the time gets set back a little bit
    //      gameScene.time -= 5
    }
    //abandon collider
//    BoxCollider{
//        id:contactCollider
//        active: collider.active
//        width: 18
//        height: 5
//        anchors.horizontalCenter: collider.horizontalCenter
//        anchors.top: collider.bottom
//        // Category4: opponent sensor
//        categories: Box.Category4
//        // Category5: solids
//        collidesWith: Box.Category5
//        collisionTestingOnlyMode: true
//        property int contacts: 0
//        fixture.onBeginContact: contacts++
//        fixture.onEndContact: if(contacts > 0) contacts--
//    }

}

