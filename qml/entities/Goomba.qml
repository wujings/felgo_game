import QtQuick 2.0
import Felgo 3.0
//basic and classic mario enemy Goomba
Monster{
id:goomba
entityType: "goomba"
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
      bodyType: Body.Dynamic
      // Category3: opponent body
      categories: Box.Category3
      collidesWith: Box.Category1 | Box.Category2| Box.Category5
    }
    BoxCollider{
        id:contactCollider
        active: collider.active
        width: 18
        height: 5
        anchors.top: parent.bottom
        anchors.left: parent.Center

        // Category4: opponent sensor
        categories: Box.Category4
        // Category5: solids
        collidesWith: Box.Category5
        collisionTestingOnlyMode: true
        property int contacts: 0
        fixture.onBeginContact: contacts++
        fixture.onEndContact: if(contacts > 0) contacts--
    }

}

