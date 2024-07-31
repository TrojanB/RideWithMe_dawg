extends Control

@onready var loot_box = $LootBox/LootBox
@onready var animation_player = $LootBox/LootBox/AnimationPlayer
@onready var card_particles = $LootBox/LootBox/CardParticles
@onready var falling_particles = $LootBox/LootBox/FallingParticles

var particleColors = [Color(0.7, 1.3, 0.8, 1),Color(0.7, 1.2, 1.3, 1), Color(1.1, 0.85, 1.3, 1),Color(1.3, 1.3, 0.8, 1)]
var particleAmount = [50,100,200,350]

@onready var card_pattern = $LootBox/CardPattern
@onready var upgradeTexture = $LootBox/CardPattern/card/upgradeIcon
@onready var upgradeLabel = $LootBox/CardPattern/card/upgradeLabel
@onready var upgradeDef =  $LootBox/CardPattern/card/upgradeIcon/upgradeDef
@onready var animation_player_card = $LootBox/CardPattern/AnimationPlayerCard

@onready var turningTexture = Menu.turningTexture
@onready var speedTexture = Menu.speedTexture
@onready var lifesTexture = Menu.lifesTexture

@onready var can_open = true

func _ready():
	falling_particles.emitting = false
	card_particles.emitting = false

func _on_loot_box_pressed():
	if Menu.player_data.lootboxes > 0 and can_open:
		can_open = false
		if card_pattern.visible:
			card_pattern.visible = false
		Menu.player_data.lootboxes -= 1
		animation_player.play("open_lootbox")
		createLoot()
		restart_particle()
	elif Menu.player_data.lootboxes <= 0 and can_open:
		get_tree().change_scene_to_file("res://scenes/Menu.tscn")

func createLoot():
	var rand1 = randi_range(1,100)
	var rarity : int 
	var upgradeType = randi() % Menu.upgradeTypes.size()
	
	if rand1 <= 55 : rarity = 0
	elif rand1 > 55 and rand1 <= 80 : rarity = 1
	elif rand1 > 80 and rand1 <=95 : rarity = 2
	else : rarity = 3
	
	var card = UpgradeCard.new()
	card.upgrade = Menu.upgrades[rarity]
	card.upgradeType = Menu.upgradeTypes[upgradeType]
	Menu.player_data.cards.append(card)
	
	card_pattern.upgrade = card.upgrade
	card_pattern.upgradeType = card.upgradeType
	card_pattern.update_card_appearance()
	apply_particle_color(rarity)


func _on_animation_player_card_animation_finished(anim_name):
	if anim_name == "popUp":
		animation_player_card.play("idle")
		can_open = true



func _on_animation_player_animation_finished(anim_name):
	if anim_name == "open_lootbox":
		animation_player_card.play("popUp")
		can_open = false

func apply_particle_color(rarity):
	card_particles.process_material.color = particleColors[rarity]
	falling_particles.process_material.color = particleColors[rarity]
	falling_particles.amount = particleAmount[rarity]
	
func restart_particle():
	falling_particles.emitting = false
	card_particles.emitting = false
	falling_particles.restart()
	card_particles.restart()
