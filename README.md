## Code problem details:
-----------
**The Pawn Simulator**

Description:

-  The application is a simulation of a Pawn moving on a chess board, of dimensions 8 squares x 8 squares.

-  There are no other obstructions on the table surface.

-  The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement that would result in the robot falling from the table must be prevented, however further valid movement commands must still be allowed.

**Create an application that can read in commands of the following form**


```
PLACE X,Y,F, C
```


```
MOVE
```

```
LEFT
```


```
RIGHT
```


```
REPORT
```


. PLACE will put the pawn on the board in position X, Y, facing NORTH, SOUTH, EAST or WEST and Colour(White or Black)
. The origin (0,0) can be considered to be the SOUTH WEST most corner.


. The first valid command to the pawn is a PLACE command, after that, any sequence of commands may be issued, in any order, including another PLACE command. The application should discard all commands in the sequence until a valid PLACE command has been executed.

. **MOVE**  will move the toy robot one unit forward in the direction it is currently facing.

. **LEFT** and **RIGHT** will rotate the robot 90 degrees in the specified direction without changing the position of the robot.

. **REPORT** will announce the X,Y,F and C of the robot. This can be in any form, but standard output is sufficient.
. A robot that is not on the table can choose the ignore the MOVE, LEFT, RIGHT and REPORT commands.
. Input can be from a file, or from standard input, as the developer chooses.
. Provide test data to exercise the application.

Constraints:
The toy robot must not fall off the table during movement. This also includes the initial placement of the toy robot.
Any move that would cause the robot to fall must be ignored.

Example Input and Output:

a)

```
PLACE 0,0,NORTH, WHITE
```


```
MOVE
```


```
REPORT
```

Output: *0,1,NORTH, WHITE*

b)

```
PLACE 0,0,NORTH, WHITE
```


```
LEFT
```


```
REPORT
```

Output: *0,0,WEST, WHITE*

c)

```
PLACE 1,2,EAST,BLACK
```


```
MOVE
```

```
MOVE
```


```
LEFT
```


```
MOVE
```


```
REPORT
```

Output: *3,3,NORTH,BLACK*

Deliverables:
The source files, the test data and any test code.
It is not required to provide any graphical output showing the movement of the toy robot.
-------


## REQUIREMENTS:
-----------
ruby  -v 3.0.0

rspec -v 3.11


## TEST THE CODE:
-----------
```
rspec
```

## RUN THE EXAMPLE:
-----------
```
git clone chdivya569@gmail.com

cd ror_task

rspec

ruby simulator/run.rb

MOVE

MOVE

RIGHT

REPORT

```

