extends Node2D

@onready var mannequin = $Mannequin

func _ready():
	mannequin.dead.connect(teste)

func _process(delta):
	pass

func teste():
	print("entendi")
