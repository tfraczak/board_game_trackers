# BoardGameTrackers

A simple app for a library of board game state trackers.

# Try it out!

[Desktop web app](https://tfraczak.github.io/bgt_web_app/)

[Google Drive Directory](https://drive.google.com/drive/folders/17TEgfCMIWQNZlDlN-vvCvSgRSVcBslAv?usp=sharing)

# Changelog

- v0.1.1
  - Fixed known issues
    - Persisted individual player state when various app actions are done (add/remove players).
    - Added a preferred orientation for portrait mode for most devices.
  - Additions
    - Added a 20 character limit to player names. This is to prevent stylistic inconsistencies and _poor_ visual effects with potentional displays of names (i.e. remove player dialog box).
  - Todo
    - Add character limit to game name.
    - Add functionality for settings.
      - Game reset: complete wipe of game state and resetting current player states back to initial state.
    - Add board state dependent event triggers (i.e. bonus tiles, stop sign appeal tile... etc.).
- v0.1.0
  - Basic MVP
    - Added support for Ark Nova board tracking.
  - Known issues
    - Ark Nova
      - After changing the state of an existing player (appeal and conservation), adding or removing a player resets everyone's state back to the initial values of 0.
      - On some devices, when orienting the screen to landscape mode, it displays all the player boxes very _poorly_.
