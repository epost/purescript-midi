module Main where

import Prelude
import Control.Monad.Eff
import Control.Monad.Eff.Console
import Midi as Midi
import Music

main :: forall e. Eff (midi :: Midi.MIDI, console :: CONSOLE | e) Unit
main = do
  Midi.loadPlugin { soundfontUrl: "bower_components/midi/examples/soundfont/"
		  , instrument:   "acoustic_grand_piano"
                  }
                  (const play)

play :: forall e. Eff (midi :: Midi.MIDI | e) Unit
play = do
  Midi.setVolume channel 127

  Midi.noteOn  channel (Midi.toNoteNumber 4 C Natural) velocity (0.0 * delay)
  Midi.noteOff channel (Midi.toNoteNumber 4 C Natural)          (3.0 * delay)

  Midi.noteOn  channel (Midi.toNoteNumber 4 E Natural) velocity (1.0 * delay)
  Midi.noteOff channel (Midi.toNoteNumber 4 E Natural)          (3.0 * delay)

  Midi.noteOn  channel (Midi.toNoteNumber 4 G Natural) velocity (2.0 * delay)
  Midi.noteOff channel (Midi.toNoteNumber 4 G Natural)          (3.0 * delay)
  where
    channel = 0
    note = 127
    delay = 0.75
    velocity = 127
