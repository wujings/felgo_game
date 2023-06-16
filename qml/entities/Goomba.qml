import QtQuick 2.0
import Felgo 3.0
//basic and classic mario enemy Goomba
Monster{
    id:goomba
    entityType: "goomba"
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
      collidesWith: Box.Category1 | Box.Category2| Box.Category5
    }
    Timer {
      id: hideTimer
      interval: 2000
      onTriggered: hidden = true
    }
    function getShot() {
           alive = false
    //        audioPlayer.playSound("GoombaDie")
            player. jump()
            console.debug("goomba die")
            sprite.jumpTo("die")
            collider.linearVelocity.x =0
            hideTimer.start()

        // for every killed opponent, the time gets set back a little bit
        //      gameScene.time -= 5
    }
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

