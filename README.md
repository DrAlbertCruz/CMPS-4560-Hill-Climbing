# CMPS-4560-Hill-Climbing
CMPS 4560 Lab: Hill Climbing in MATLAB

# Introduction

## Requirements
* MATLAB
* The files in this repository. Run:
```
$ git clone https://github.com/DrAlbertCruz/CMPS-4560-Hill-Climbing.git
```
change into this directory, then launch matlab *locally* on your machine.

## Prerequisites
* Simulated annealing algorithm

# Background

This lab assumes that you've read about the simulated annealing algorithm and are familiar with it. Please revisit the textbook if you need a refresher on it. 

In this lab you will create a MATLAB function to run a local search in a search space with one local maxima, one global maxima, and a very noisy search space. Execute:

```
>> testFunc
```

in MATLAB. `testFunc` runs the `testFunc.m` script. `testFunc` will run a local search algorithm 1000 times and attempt to find the global maxima. It notes the number of times that the search was complete (it was successful) and the average time to complete a single run of the search. If you run it now you will get something like:

```
Completion rate of: 0.01
Averate time in ms: 0.002781
```

This means that the search was only 1% successful! Indeed, hill climbing will get stuck because it cannot make any suboptimal steps. If you look at the data by entering the following in the MATLAB command line:

```matlab
>> load data
>> plot(data)
```
while we can see two clear modes, note that it is very noisy. There are very subtle ups and downs every few steps. We will need a more advanced local search algorithm to complete this search.

# Approach

Your task is to implement simulated annealing in MATLAB. You should start by copying the `hillClimb.m` file:

```shell
$ cp hillClimb.m mySimAnnealing.m
```

You can also do this within the MATLAB command line interface with the `copyfile` command. 

A complete simulated annealing search should have no problem with this search space. Some sample results:

```
Completion rate of: 1
Averate time in ms: 0.035631
```

Good luck! Show the instructor your code for full credit.
