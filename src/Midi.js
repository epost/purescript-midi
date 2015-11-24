// module Midi

module.exports = {
	loadPlugin: function(config) {
        return function(callback) {
            return function() {
                window.onload = function() {
                    MIDI.loadPlugin(
                        extend_TODO_eliminate({
		                    onprogress: function(state, progress) {
			                    console.log('onprogress:', state, progress);
		                    },
                            onsuccess: function() {
                                callback()();
                            }
                        }, config
	                ));
                };
            };
        };
    },

    setVolume: function(channel) {
        return function(volume) {
            return function() {
                MIDI.setVolume(channel, volume);
            };
        };
    },

    noteOn: function(channel) {
        return function(note) {
            return function(velocity) {
                return function(delay) {
                    return function() {            
                        console.log('noteOn: MIDI = ', MIDI);
                        MIDI.noteOn(channel, note, velocity, delay);
                    };
                };
            };
        };
    },

    noteOff: function(channel) {
        return function(note) {
            return function(delay) {
                return function() {
                    console.log('noteOff: MIDI = ', MIDI);
                    MIDI.noteOff(channel, note, delay);
                };
            };
        };
    }
};


// TODO eliminate
var extend_TODO_eliminate = function(defaults, options) {
    var extended = {};
    var prop;
    for (prop in defaults) {
        if (Object.prototype.hasOwnProperty.call(defaults, prop)) {
            extended[prop] = defaults[prop];
        }
    }
    for (prop in options) {
        if (Object.prototype.hasOwnProperty.call(options, prop)) {
            extended[prop] = options[prop];
        }
    }
    return extended;
};


