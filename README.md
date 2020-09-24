# Game Of Life
John Conway's Game of Life, now in [Love2D](https://love2d.org/)! <br/>

### Cellular Automata and the Game of Life
Cellular automata have been around for a while. Essentially, they're state machines plotted out on grids where each cell is determined to be live or dead depending on the state of cells around it. The Game of Life is no exception. Devised by John Conway, the Game of Life is a cellular automaton operating on three major rules: <br/>
1. A live cell dies if it has fewer than two or more than three live neighbours.
2. Any dead cell with three live neighbours becomes a live cell.
3. In all other conditions, cells maintain their current state.  
  
  The initial pattern that you choose is called the 'seed' of your state.

### Using This Sim
##### Setting Window Size
While the original Game of Life is meant to work on an infinite grid of cells, this particular sim only allows a finite grid. However, you can set the size of the window to create the appropriate bounding box for the pattern required. <br/>
To set up number of tiles, go to `LUA/main.lua` and locate the `local` variables `cell_x` and `cell_y`. Set them to the desired number of tiles. <br/>

##### Running the Game
NOTE: This sim requires Love2D to run. <br/>
Once you're done with your configurations, move the contents of `LUA` to a zipped folder and change the file extension to `*.love`. Love2D will take care of the rest. <br/>

##### Running Examples
Some examples have been provided for your convenience, already with the `.love` extension enabled. To view them, go to `LUA/examples` and click on them. Assuming your laptop is equipped with Love2D, they should run perfectly. In case of any bugs, report them under the issues tag.  
  
##### An Alternative Approach
A release has been published containing the basic grid [here](https://github.com/hrishitchaudhuri/GameOfLife/releases/tag/v0.1-alpha), supported for Windows 64-bit operating systems. Run the executable titled `LifeGame.exe`.  
NOTE: This does not allow for changes in bounding box sizes though; to enable greater control, we recommend cloning this repository and running it on the Love2D engine.  

### Credits
File `classic.lua` taken from [rxi](https://github.com/rxi/classic)
