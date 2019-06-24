/**
  Copyright 2012 Michael Morris-Pearce

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program. If not, see <http://www.gnu.org/licenses/>.
*/

(function() {

  /* Piano keyboard pitches. Names match sound files by ID attribute. */

  let keys =[
    'C3', 'D3',  'E3', 'F3',  'G3', 'A3', 'B3',
    'C4', 'Db4', 'D4', 'Eb4', 'E4', 'F4', 'Gb4', 'G4', 'Ab4','A4', 'Bb4', 'B4',
    'C5', 'Db5', 'D5', 'Eb5', 'E5', 'F5', 'Gb5', 'G5', 'Ab5','A5', 'Bb5', 'B5',
    'C6'
  ];

  let keys2 =[
    'Db3', 'Eb3', 'F3', 'Gb3', 'Ab3', 'Bb3', 'B3',
    'C4', 'Db4', 'D4', 'Eb4', 'E4', 'F4', 'Gb4', 'G4', 'Ab4','A4', 'Bb4', 'B4',
    'C5', 'Db5', 'D5', 'Eb5', 'E5', 'F5', 'Gb5', 'G5', 'Ab5','A5', 'Bb5', 'B5',
    'C6'
  ];

  /* Corresponding keyboard keycodes, in order w/ 'keys'. */
  /* QWERTY layout:
  /*   upper register: Q -> P, with 1-0 as black keys. */
  /*   lower register: Z -> M, , with A-L as black keys. */
  let codes = [
    192,  49,    50,   51,   52,    53,   54,    55,
    65,   83,    68,   70,   71,    72,   74,    75,   76,   186,  222,  13,
    81,    87,   69,   82,    84,   89,    85,   73,   79,   80,   219,
    221
  ];

  let pedal = 32; /* Keycode for sustain pedal. */
  let tonic = 'A2'; /* Lowest pitch. */

  /* Piano state. */

  let intervals = {};
  let depressed = {};

  /* Selectors */

  function pianoClass(name) {
    return '.piano-' + name;
  };

  function soundId(id) {
    return 'sound-' + id;
  };

  function sound(id) {
    let it = document.getElementById(soundId(id));
    return it;
  };


  /* Virtual piano keyboard events. */

  function keyup(code) {
      let offset = codes.indexOf(code);
      let k;
      if (offset >= 0 && event.shiftKey === false) {
        k = keys.indexOf(tonic) + offset;
        return keys[k];
      } else if (offset >= 0 && event.shiftKey === true) {
        k = keys2.indexOf(tonic) + offset;
        return keys2[k];
      }
  };

  function keydown(code) {
    return keyup(code);
  };

  function press(key) {
    let audio = sound(key);
    if (depressed[key]) {
      return;
    }
    clearInterval(intervals[key]);
    if (audio) {
      audio.pause();
      audio.volume = 1.0;
      if (audio.readyState >= 2) {
        audio.currentTime = 0;
        audio.play();
        depressed[key] = true;
      }
    }
    $(pianoClass(key)).animate({
      'backgroundColor': '#88FFAA'
    }, 0);
  };

  /* Manually diminish the volume when the key is not sustained. */
  /* These values are hand-selected for a pleasant fade-out quality. */

  function fade(key) {
    let audio = sound(key);
    let stepfade = function() {
      if (audio) {
        if (audio.volume < 0.03) {
          kill(key)();
        } else {
          if (audio.volume > 0.2) {
            audio.volume = audio.volume * 0.95;
          } else {
            audio.volume = audio.volume - 0.01;
          }
        }
      }
    };
    return function() {
      clearInterval(intervals[key]);
      intervals[key] = setInterval(stepfade, 5);
    };
  };

  /* Bring a key to an immediate halt. */

  function kill(key) {
    let audio = sound(key);
    return function() {
      clearInterval(intervals[key]);
      if (audio) {
        audio.pause();
      }
      if (key.length > 2) {
        $(pianoClass(key)).animate({
          'backgroundColor': 'black'
        }, 300, 'easeOutExpo');
      } else {
        $(pianoClass(key)).animate({
          'backgroundColor': 'white'
        }, 300, 'easeOutExpo');
      }
    };
  };

  /* Simulate a gentle release, as opposed to hard stop. */

  let fadeout = true;

  /* Sustain pedal, toggled by user. */

  let sustaining = false;

  /* Register mouse event callbacks. */

  keys.forEach(function(key) {
    $(pianoClass(key)).mousedown(function() {
      $(pianoClass(key)).animate({
        'backgroundColor': '#88FFAA'
      }, 0);
      press(key);
    });
    if (fadeout) {
      $(pianoClass(key)).mouseup(function() {
        depressed[key] = false;
        if (!sustaining) {
          fade(key)();
        }
      });
    } else {
      $(pianoClass(key)).mouseup(function() {
        depressed[key] = false;
        if (!sustaining) {
          kill(key)();
        }
      });
    }
  });

  /* Register keyboard event callbacks. */

  $(document).keydown(function(event) {
    if (event.which === pedal) {
      sustaining = true;
      $(pianoClass('pedal')).addClass('piano-sustain');
    } else {
      press(keydown(event.which));
    }
    if (keydown(event.shiftKey)) {
      press(keydown(event.shiftKey));
    }
  });


  $(document).keyup(function(event) {
    if (event.which === pedal) {
      sustaining = false;
      $(pianoClass('pedal')).removeClass('piano-sustain');
      Object.keys(depressed).forEach(function(key) {
        if (!depressed[key]) {
          if (fadeout) {
            fade(key)();
          } else {
            kill(key)();
          }
        }
      });
    }
    if (keyup(event.which)) {
      depressed[keyup(event.which)] = false;
      if (!sustaining) {
        if (fadeout) {
          fade(keyup(event.which))();
        } else {
          kill(keyup(event.which))();
        }
      }
    }
    if (keyup(event.shiftKey)) {
      depressed[keyup(event.shiftKey)] = true;
      if (!sustaining) {
        if (fadeout) {
          fade(keyup(event.shiftKey))();
        } else {
          kill(keyup(event.shiftKey))();
        }
      }
    }
  });

})();
