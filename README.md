# go-cli-COMPFEST
Final Assigment Compfest Stage 2

description task : http://bit.ly/seacfxtask2 

## Running 
There are three ways to run the apps, but i didnt get to finish it.

### 1. Running without parameter (default)
```
ruby go-cli.rb
```
- 20 * 20 size of the map
- One user with random position
- 5 Driver with random name & random coordinate

### 2. Running it with 3 integer as parameter
```
ruby go-cli.rb n x y
```
- n * n size of the map
- One user with x,y position
- 5 Driver with random name & random coordinate

<<<<<<< HEAD
### 2. Running with file text as a parameter
*(Not finished)*
````
ruby go-cli.rb input.txt
````
### 3. Running it with 3 integer as parameter
```
ruby go-cli.rb 15 3 2
```

````
=======
### 3. Running with filename as a parameter
````
ruby go-cli.rb input.txt
````
- Size of the map, user position, number of driver & position will be set on filetext.


#### Format file
```
mapsize 15
user 1,2
dimas 2,3
ardan 5,5
jono 5,1
firsan 3,6
```
 
 First line should be size of the map
 Second line is put user position with
 and next line is driver name and position 
>>>>>>> 29bbe7a600f8eaa0537c6dd3d041132849ae1fe7

## Assumptions
1. User and Driver positions can not overlap in one place as well as driver within another driver.
2. The route just goes vertically in the first direction, then turns and then goes horizontally.
