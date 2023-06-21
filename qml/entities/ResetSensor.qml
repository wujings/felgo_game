import Felgo 3.0
import QtQuick 2.0

EntityBase {
  id: resetSensor
  entityType: "resetSensor"

  signal contact

  Text {
    anchors.centerIn: parent
    text: "reset sensor"
    color: "white"
    font.pixelSize: 9
  }

  BoxCollider {
    anchors.fill: parent
    collisionTestingOnlyMode: true
    categories: Box.Category7
    fixture.onBeginContact: {
      var otherEntity = other.getBody().target
      if(otherEntity.entityType === "player") {
        resetSensor.contact()
         gameWindow.state="dead"
      }
    }
  }
}

