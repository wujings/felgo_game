import QtQuick 2.0
import Felgo 3.0

Item {

    id: audioPlayer
//   Background Music
    BackgroundMusic {
      id: mainTheme

      autoPlay: false

      source: "../../assets/music/theme.mp3"
    }
    SoundEffect {
      id: playerJump
      source: "../../assets/sound/smas_jump.wav"
    }
    function startMusic(music) {
      // if music is already playing, we don't have to do anything
      if(music.playing)
        return

      // otherwise stop all music tracks
      menuMusic.stop()
      playMusic.stop()
      editMusic.stop()

      // play the music
      music.play()
    }

    // play the sound effect with the given name
    function playSound(sound) {
      if(sound === "playerJump")
        playerJump.play()
        else if(sound === "playerHit")
        playerHit.play()
      else if(sound === "playerDie")
        playerDie.play()
      else if(sound === "playerInvincible")
        playerInvincible.play()
      else if(sound === "collectCoin")
        collectCoin.play()
        else if(sound === "collectMushroom")
        collectMushroom.play()
      else if(sound === "finish")
        finish.play()
      else
        console.debug("unknown sound name:", sound)
    }

}
