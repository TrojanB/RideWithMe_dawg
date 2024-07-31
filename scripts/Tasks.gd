extends Node

#tasks
var get_score_in_one_run = [2000,5000,10000,30000,50000,100000,200000,500000, 1000000] #No need for player variable, cause will chceck just the score at the end of the game
var get_total_score = [20000,50000,100000,300000,600000,1000000,2000000,3000000,5000000,10000000]

var destroy_cars_in_one_run = [10,20,30,50,70]
var destroy_total_cars = [30,50,100,150,250,350,500,750,1000,2000,3000]

var hit_cars_wo_dying = [5,10,20,30,40,50,75,100,150,200]
var owned_cars = [2,3,4] #No player variable for it, cause it's in Menu.gd, no need to add another one

#player variables for tasks
var total_score = 0
var destroyed_cars_in_one_run = 0
var total_destroyed_cars = 0
var cars_hit_wo_dying = 0
