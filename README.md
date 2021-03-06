# Elm Prague Coding Dojo #6

## [Minesweeper Kata](https://codingdojo.org/kata/Minesweeper/)

### About this Kata

Kata originated here: acm.uva.es/p/v101/10189.html

Difficulty: Easy

### Problem Description

Have you ever played Minesweeper? It’s a cute little game which comes within a certain Operating System whose name we can’t really remember. Well, the goal of the game is to find all the mines within an MxN field. To help you, the game shows a number in a square which tells you how many mines there are adjacent to that square. For instance, take the following 4x4 field with 2 mines (which are represented by an \* character):

```
*...
....
.*..
....
```

The same field including the hint numbers described above would look like this:

```
*100
2210
1*10
1110
```

You should write a program that takes input as follows:

The input will consist of an arbitrary number of fields. The first line of each field contains two integers `n` and `m` (where `0 < n,m <= 100`) which stands for the number of lines and columns of the field respectively. The next `n` lines contains exactly m characters and represent the field. Each safe square is represented by an `.` character and each mine square is represented by an `*` character. The first field line where `n = m = 0` represents the end of input and should not be processed.

Your program should produce output as follows:

For each field, you must print the following message in a line alone:

```
Field #x:
```

Where `x` stands for the number of the field (starting from 1). The next `n` lines should contain the field with the `.` characters replaced by the number of adjacent mines to that square. There must be an empty line between field outputs.

### Clues

As you may have already noticed, each square may have at most 8 adjacent squares.

### Suggested Test Cases

This is the acceptance test input:

```
4 4
*...
....
.*..
....
3 5
**...
.....
.*...
0 0
```

and output:

```
Field #1:
*100
2210
1*10
1110

Field #2:
**100
33200
1*100
```

## Run Tests

```sh
yarn test:watch
```

Or `yarn test` to run without watch mode.

## Format Code

```sh
yarn fomart
```

## Run Dev

```sh
yarn dev
```

Then open [localhost:8000/src/Main.elm](http://localhost:8000/src/Main.elm)

## Build For Production

```sh
yarn build
```

Output is in `./build/elm.min.js`.
