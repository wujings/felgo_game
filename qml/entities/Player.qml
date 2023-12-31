import Felgo 3.0
import QtQuick 2.0
import "../common"
EntityBase {
    id: player
    entityType: "player"
    width: 18
    height: 21
    property bool isBig: false
    scale: isBig ? 1.3 : 1

  // add some aliases for easier access to those properties from outside
    property alias collider: collider
    property alias horizontalVelocity: collider.linearVelocity.x
    property int contacts: 0
    property int healthPoint:1

    property bool alive: true
    property int speed:120

    property int jumpCount:0
    property int coinsCount: 0

  // property binding to determine the state of the player like described above
    state: "standing"
    onStateChanged: console.debug("player.state " + state)
//  MultiResolutionImage {
//    id: img
//    source: "marioS-0.png"

//  }
  TexturePackerSpriteSequence {
    id: sprite
    anchors.centerIn: parent
    TexturePackerSprite {
      name: "stand"
      source: "../../assets/marioS/marioS.json"
      frameNames: "marioS-0.png"
    }

    TexturePackerSprite {
      name: "walk"
      source: "../../assets/marioS/marioS.json"
      frameNames: ["marioS-0.png", "marioS-1.png", "marioS-2.png", "marioS-3.png"]
//      to: { "stand": 3}
      frameRate: 5
    }
    TexturePackerSprite {
      name: "die"
      source: "../../assets/marioS/marioS.json"
      frameNames: ["marioS-8.png", "marioS-9.png"]
      frameRate: 3
    }
    TexturePackerSprite {
      name: "jump"
      source: "../../assets/marioS/marioS.json"
      frameNames: ["marioS-0.png", "marioS-1.png", "marioS-2.png", "marioS-3.png"]
      to: {"jump": 1, "stand": 2}
      frameRate: 5
    }
  }


    BoxCollider {
        id: collider
        height: 20*parent.scale
        width: 18*parent.scale
        anchors.horizontalCenter: parent.horizontalCenter
        // this collider must be dynamic because we are moving it by applying forces and impulses

        bodyType: Body.Dynamic

        fixedRotation: true

        categories: Box.Category1
        collidesWith: Box.Category3 | Box.Category5 | Box.Category6 | Box.Category7|Box.Category8|Box.Category9|Box.Category13

        bullet: true
        sleepingAllowed: false
        // apply the horizontal value of the TwoAxisController as force to move the player left and right
        force: Qt.point(controller.xAxis*speed*24,0)
        // limit the horizontal velocity
        onLinearVelocityChanged: {
            player.state = "walking"
            if(linearVelocity.x > speed) linearVelocity.x = speed
            if(linearVelocity.x < -speed) linearVelocity.x = -speed
        }
        fixture.onBeginContact: {
        var otherEntity = other.getBody().target
        if(otherEntity.entityType === "coin"){
            console.debug("coins collect")
            ++player.coinsCount
            otherEntity.collect()
        }
        else if(otherEntity.entityType === "mushroom"){
            console.debug("mushroom collect")
            otherEntity.collect()
            player.isBig = true
            ++healthPoint
        }
        else if(otherEntity.entityType === "goomba"||otherEntity.entityType === "troopa") {
//            console.debug("kill monster")
//            otherEntity.getShot()
//              jump()
            console.debug("contact enemy")
            if(otherEntity.alive === true){
                --player.healthPoint
                player.isBig == false
                player.scale=1
            }
            if(player.healthPoint == 0)
                player.die()
            }
        }
  }
  BoxCollider{
      id:killCollider
      width:18*scale
      height: 5*scale

      collisionTestingOnlyMode: true
      anchors.horizontalCenter: parent.horizontalCenter
      anchors.top: parent.bottom

      bodyType: Body.Dynamic
      active: collider.active
      categories: Box.Category2
      collidesWith: Box.Category3
//      collisionTestingOnlyMode: true

      fixture.onBeginContact: {
        var otherEntity = other.getBody().target
        // if colliding with opponent...
        if(otherEntity.entityType === "goomba"||otherEntity.entityType === "troopa") {
            console.debug("kill "+entityType)
            otherEntity.getShot()
            player.jumpCount--
              jump()
        }
        // else if colliding with another solid object...
      }
  }
  BoxCollider{
      id:upCollider //this Collider is used to trigger qblock
      width:12*scale
      height: 3*scale

      collisionTestingOnlyMode: true
      anchors.horizontalCenter: parent.horizontalCenter
      anchors.top: parent.top

      bodyType: Body.Dynamic
      active: collider.active
      categories: Box.Category2
      collidesWith: Box.Category9
//      collisionTestingOnlyMode: true

      fixture.onBeginContact: {
        var otherEntity = other.getBody().target
        // if colliding with opponent...
        if(otherEntity.entityType === "qblock") {
            console.debug("contact qblock")
            otherEntity.trigger()
            ++player.healthPoint
//            ++player.healthPoint
//            otherEntity.getShot()
//              jump()
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
            if(Math.abs(player.horizontalVelocity) > 10)
                player.horizontalVelocity /= 1.5
            else
                 player.horizontalVelocity = 0
            }
        }
    }

    function jump() {
        console.debug("jump requested at player.state " + state)
        if(player.jumpCount < 1) {
            console.debug("do the jump")
            audioPlayer.playSound("playerJump")
            // for the jump, we simply set the upwards velocity of the collider
            collider.linearVelocity.y = -(gameScene.gridSize*18)
            jumpCount++
        }
    }
    function die(){
        jump()
        console.debug("player die")
        sprite.jumpTo("die")
        alive = false
        collider.linearVelocity.x =0
        gameWindow.state="dead"
    }
    //when player walk or jump change sprite
    function changeSprite(){
        if(player.state==="walking")
            sprite.jumpTo("walk")
        else if(player.state==="jump")
            sprite.jumpTo("jump")
        else
            sprite.jumpTo("stand")
    }
    function changeDirection(){
        if(controller.xAxis == 1)
            sprite.mirror = false
        if(controller.xAxis == -1)
            sprite.mirror = true
    }
}

