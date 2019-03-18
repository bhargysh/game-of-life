## Game of Life

The Game of Life, desgined by John Conway defines how 'cells' in an ecosystem evolve depending on their *initial state* from 4 different rules. 

There is an initial configuration represented in a grid format, and the cells evolve according to the rules, which are determined by a cell's neighbours.

#### Dependencies
Need to have ruby installed locally, and rspec if you want to run the tests.
Once you've done a clone of this repository, go to the game-of-life directory and perform a bundle install.
```
git clone https://github.com/bhargysh/game-of-life \
cd game-of-life \
bundle install
```

#### Running the Tests
```
rspec spec/
```

#### Running the App
```
./game_entry.rb
```
This command sets up an initial grid and applies the rules of the game to it. You can see the output in the command line OR (much cooler) it generates a `grid.gif ` file so you can see the cells evolving!
