import QtQuick 2.0
import Felgo 3.0

TiledEntityBase {
  id: ground
  entityType: "ground"

  size: 2 // must be >= 2, because we got a sprite for the start, one for the end and a repeatable center sprite

  Row {
    id: tileRow
    Tile {
      pos: "left"
      image: "../../assets/ground/left.png"
    }
    Repeater {
      model: size-2
      Tile {
        pos: "mid"
        image: "../../assets/ground/mid.png"
      }
    }
    Tile {
      pos: "right"
      image: "../../assets/ground/right.png"
    }
  }

  BoxCollider {
    anchors.fill: parent
    bodyType: Body.Static
    fixture.onBeginContact: {
      var otherEntity = other.getBody().target
      if(otherEntity.entityType === "player") player.contacts++
    }
    fixture.onEndContact: {
      var otherEntity = other.getBody().target
      if(otherEntity.entityType === "player") player.contacts--
    }
  }
}
