import QtQuick 2.0
import Felgo 3.0
//basic and classic mario enemy Goomba
Monster{
id:goomba
entityType: "opponent"
    TexturePackerAnimatedSprite {
       id:goombaSprite
      source: "../../assets/goomba/goomba.json"
      frameNames: ["goomba-00.png", "goomba-01.png"]
      frameRate: 3
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
      // Category3: opponent body
      categories: Box.Category3
      // Category2: player body, Category2: player feet sensor,
      // Category5: tiles
//      collidesWith: Box.Category1 | Box.Category2 | Box.Category5

    }
//    BoxCollider {
//      id: collider
//      height: parent.height
//      width: 20
//      anchors.horizontalCenter: parent.horizontalCenter
//      // this collider must be dynamic because we are moving it by applying forces and impulses
//      bodyType: Body.Dynamic // this is the default value but I wanted to mention it ;)
//      fixedRotation: true // we are running, not rolling...
//      bullet: true // for super accurate collision detection, use this sparingly, because it's quite performance greedy
//      sleepingAllowed: false
//      // apply the horizontal value of the TwoAxisController as force to move the player left and right
//      force: Qt.point(controller.xAxis*170*32,0)
//      // limit the horizontal velocity
//      onLinearVelocityChanged: {
//        if(linearVelocity.x > 170) linearVelocity.x = 170
//        if(linearVelocity.x < -170) linearVelocity.x = -170
//      }

//    }

}

