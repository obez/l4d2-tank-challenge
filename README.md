# Tank Challenge

![Downloads](https://img.shields.io/steam/downloads/151833267)
![Subscriptions](https://img.shields.io/steam/subscriptions/151833267)
![Favorites](https://img.shields.io/steam/favorites/151833267)
![Size](https://img.shields.io/steam/size/151833267)

Source for my Left 4 Dead 2 map [Tank Challenge](https://steamcommunity.com/sharedfiles/filedetails/?id=151833267).

## Compiling

The `scripts` directory contains a python build script that:
* Makes copies of the `l4d2_tank_challenge.vmf` file for other round counts: 15, 20 and 30 rounds;
* Checks for updates to each `.vmf` files (md5 hash);
* Compiles each map that has changed to a `.bsp`;
* Runs the game for each map to build the cubemaps;
* Assembles the `.vpk` file;
* Packs and compresses it with WinRAR;
* Copies it to the `ftp` subdirectory and archives any previous one;
* Logs some basic info along the way.

It will compile the maps in production mode (with `-both` and `-final` `rad` options) unless a `-fast` parameter is passed.

Can be run by hand but a best practice is to schedule it to run once a day at night (as it can run for some time).

You can then share the `ftp` subdirectory with your teammates/testers through ftp.

## Notes

The `.bsp` files are not included in the `vpk\l4d2_tank_challenge\maps` directory.

You will need to compile them first and copy them to this directory before packaging the `.vpk`.

This is automatically done by the python script.
