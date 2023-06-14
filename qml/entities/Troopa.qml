import QtQuick 2.0
import Felgo 3.0
//flying Koopa Troopa,another classic enemy
Monster{
id:goomba
entityType: "opponent"
//sprite setting
    TexturePackerAnimatedSprite {
       id:goombaSprite
      source: "../../assets/goomba/goomba.json"
      frameNames: ["goomba-00.png", "goomba-01.png"]
      frameRate: 3
    }
    //Collider setting

}
