module Midi where

import Prelude
import Control.Monad.Eff
import Music

type NoteNumber = Int
type Channel = Int
type Velocity = Int
type Delay = Number

foreign import data MIDI :: Effect

foreign import loadPlugin :: forall e. PluginConfigRec -> (Unit -> Eff (midi :: MIDI | e) Unit) -> Eff (midi :: MIDI | e) Unit

foreign import noteOn     :: forall e. Channel -> NoteNumber -> Velocity -> Delay               -> Eff (midi :: MIDI | e) Unit

foreign import noteOff    :: forall e. Channel -> NoteNumber ->             Delay               -> Eff (midi :: MIDI | e) Unit

foreign import setVolume  :: forall e. Channel -> Velocity                                      -> Eff (midi :: MIDI | e) Unit


type PluginConfigRec =
  { soundfontUrl :: String
  , instrument   :: InstrumentName
  }

type InstrumentName = String

toNoteNumber :: Octave -> Note -> Accidental -> NoteNumber
toNoteNumber oct note acc = (12 * oct) + toNoteNumber' note acc

toNoteNumber' :: Note -> Accidental -> NoteNumber
toNoteNumber' C Natural = 0
toNoteNumber' C Sharp   = 1
toNoteNumber' D Flat    = 1
toNoteNumber' D Natural = 2
toNoteNumber' D Sharp   = 3
toNoteNumber' E Flat    = 3
toNoteNumber' E Natural = 4
toNoteNumber' F Flat    = 4
toNoteNumber' E Sharp   = 5
toNoteNumber' F Natural = 5
toNoteNumber' F Sharp   = 6
toNoteNumber' G Flat    = 6
toNoteNumber' G Natural = 7
toNoteNumber' G Sharp   = 8
toNoteNumber' A Flat    = 8
toNoteNumber' A Natural = 9
toNoteNumber' A Sharp   = 10
toNoteNumber' B Flat    = 11
toNoteNumber' B Natural = 12
toNoteNumber' B Sharp   = 13
toNoteNumber' C Flat    = 13
