import Felgo 3.0
import QtQuick 2.0

EntityBase {
  id: player
  entityType: "player"
  width: 28
  height: 21

  // add some aliases for easier access to those properties from outside
    property alias collider: collider
    property alias horizontalVelocity: collider.linearVelocity.x
    property int contacts: 0
    property int healthPoint:1
    property bool alive: true
  // property binding to determine the state of the player like described above
  state: contacts > 0 ? "walking" : "jumping"
  onStateChanged: console.debug("player.state " + state)
  MultiResolutionImage {
    id: img
    source: "marioS-0.png"

  }
  TexturePackerSpriteSequence {
    id: marioSSprite
    anchors.centerIn: parent
    TexturePackerSprite {
      name: "stand"
      source: "../../assets/marioS/marioS.json"
      frameNames: ["marioS-0.png"]
    }
    TexturePackerSprite {
      name: "walk"
      source: "../../assets/marioS/marioS.json"
      frameNames: ["marioS-0.png", "marioS-1.png", "marioS-2.png", "marioS-3.png"]
      frameRate: 4
    }
    TexturePackerSprite {
      name: "jump"
      source: "../../assets/marioS//img/marioS.json"
      frameNames: ["marioS-0.png", "marioS-1.png", "marioS-2.png", "marioS-3.png"]
      to: {"jump": 1, "walk": 3}
      frameRate: 4
    }

//    Keys.onPressed:{
//        switch(event.key)
//        {
//        case Qt.Key_Up:
//            marioSSprite.jumpTo("jump");
//            marioSSprite.running=true
//            break;
//        case Qt.Key_Left:
//            marioSSprite.jumpTo("walk");
//            marioSSprite.running=true
//            break;
//        }
//    }

  }
  function changeDirection(){
      if(controller.xAxis == 1)
          marioSSprite.mirror = false
      if(controller.xAxis == -1)
          marioSSprite.mirror = true
  }
//PolygonCollider{
//id:collider
//anchors.horizontalCenter: parent.horizontalCenter
//anchors.verticalCenter: parent.verticalCenter
//    vertices:[
//        Qt.point(0,0), // top left
//        Qt.point(0, 18), // bottom left
//        Qt.point(25, 18), // bottom right
//        Qt.point(25, 0) // top right
//    ]
//    categories: Box.Category1
//    // Category3: opponent body, Category5: solids,
//    // Category6: powerups, Category7: reset sensor
//    collidesWith: Box.Category3 | Box.Category5 | Box.Category6 | Box.Category7
//    bullet: true
//    sleepingAllowed: false
//    // apply the horizontal value of the TwoAxisController as force to move the player left and right
//    force: Qt.point(controller.xAxis*170*32,0)
//    // limit the horizontal velocity
//    onLinearVelocityChanged: {
//      if(linearVelocity.x > 170) linearVelocity.x = 170
//      if(linearVelocity.x < -170) linearVelocity.x = -170
//    }
//    fixture.onBeginContact:{//contacts with other entities
//        var otherEntity = other.getBody().target
//        if (otherEntity.entityType ==="Goomba"){
//                console.log("contact Goomba")
//                player.die()
//        }
//        else
//           console.log("contact with otherEntity")
//    }
//}
  BoxCollider {
        id: collider
        height: parent.height
        width: 18
        anchors.horizontalCenter: parent.horizontalCenter
        // this collider must be dynamic because we are moving it by applying forces and impulses

        bodyType: Body.Dynamic

        fixedRotation: true

        categories: Box.Category1
        collidesWith: Box.Category3 | Box.Category5 | Box.Category6 | Box.Category7

        bullet: true
        sleepingAllowed: false
        // apply the horizontal value of the TwoAxisController as force to move the player left and right
        force: Qt.point(controller.xAxis*170*32,0)
        // limit the horizontal velocity
        onLinearVelocityChanged: {
        if(linearVelocity.x > 170) linearVelocity.x = 170
        if(linearVelocity.x < -170) linearVelocity.x = -170
        }
        fixture.onBeginContact: {
        var otherEntity = other.getBody().target
            if(otherEntity.entityType === "coin"){
                console.debug("coins collect")
                otherEntity.collect()
            }
            else if(otherEntity.entityType === "goomba") {
                console.debug("contact goomba begin")
                player.die()
                }
            }
  }
  BoxCollider{
      id:killCollider
      width:18
      height: 5
      collisionTestingOnlyMode: true
      anchors.horizontalCenter: parent.horizontalCenter
      anchors.top: parent.bottom
      bodyType: Body.Dynamic
      categories: Box.Category2
      collidesWith: Box.Category3 | Box.Category5
//      collisionTestingOnlyMode: true

      fixture.onBeginContact: {
        var otherEntity = other.getBody().target
        // if colliding with opponent...
        if(otherEntity.entityType === "Monster") {
          // ...calculate the lowest point of the player and the opponent...
          var playerLowestY = player.y + player.height
          var oppLowestY = otherEntity.y + otherEntity.height

          // if the player's y position is at least5px above the opponent's...
          if(playerLowestY < oppLowestY - 5) {
            // ...kill opponent...
            console.debug("kill monster")
            otherEntity.die()
              jump()
          }
        }
        // else if colliding with another solid object...
      }

  }

  // this timer is used to slow down the players horizontal movement. the linearDamping property of the collider works quite similar, but also in vertical direction, which we don't want to be slowed
  Timer {
    id: updateTimer
    // set this interval as high as possible to improve performance, but as low as needed so it still looks good
    interval: 55
    running: true
    repeat: true
    onTriggered: {
      var xAxis = controller.xAxis;
      // if xAxis is 0 (no movement command) we slow the player down until he stops
      if(xAxis == 0) {
        if(Math.abs(player.horizontalVelocity) > 10) player.horizontalVelocity /= 1.5
        else player.horizontalVelocity = 0
      }
    }
  }

  function jump() {
    console.debug("jump requested at player.state " + state)
    if(player.state == "walking") {
      console.debug("do the jump")
      // for the jump, we simply set the upwards velocity of the collider
      collider.linearVelocity.y = -420
    }
  }
  function die(){
      jump()
      console.debug("player die")
      alive = false
      collider.linearVelocity.x =0
  }
}

