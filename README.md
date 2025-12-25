# luartal
portal but in lua :D

# Documentation
## Surfaces
Surfaces are the 5th data type in jankLoader walls, and can be assigned to different things by different scripts. In luartal, they indicate:
- Portallability
- Portal passability
- Texture
- Collision
---
Surface types

Documentation of surface types. You may want to write this down somewhere if you plan to make maps for the game.
0

- Name: Portallable wall
- Portallable? Yes
- Portal passable? No
- Collision? Yes
- Texture: \27[107;37m░\27[100m

1

- Name: Non-portallable wall/floor
- Portallable? No
- Portal passable? No
- Collision? Yes
- Texture: \27[90;30m░\27[100m

2

- Name: Portallable floor
- Portallable? Yes
- Portal passable? No
- Collision? Yes
- Texture: \27[107;37m■\27[100m

3

- Name: Portallable wall/floor (BTS)
- Portallable? Yes
- Portal passable? No
- Collision? Yes
- Texture: \27[107;37m▒\27[100m

4

- Name: Rusty non-portallable wall/floor (BTS)
- Portallable? No
- Portal passable? No
- Collision? Yes
- Texture: \27[47m\27[38;5;214m░\27[100m

5

- Name: Clean non-portallable wall (BTS)
- Portallable? No
- Portal passable? No
- Collision? Yes
- Texture:\27[47m \27[100m

6

- Name: Grating
- Portallable? No
- Portal passable? No
- Collision? Yes
- Texture: \27[100;37m░\27[100m

7

- Name: Portallable wall (BTS offices)
- Portallable? Yes
- Portal passable? No
- Collision? Yes
- Texture: \27[107m\27[38;5;153m░\27[100m

8

- Name: Portallable floor (BTS offices)
- Portallable? Yes
- Portal passable? No
- Collision? Yes
- Texture: \27[107m\27[38;5;153m■\27[100m

9

- Name: Clipbrush
- Portallable? No
- Portal passable? Yes
- Collision? Yes
- Texture: \27[100m

A

- Name: Fizzler
- Portallable? No
- Portal passable? No
- Collision? No
- Special: Erases placed portals
- Texture: \27[107;96m░\27[100m
