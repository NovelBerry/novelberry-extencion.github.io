@tool 

extends Node2D

# Una función para crear una plataforma estática (el suelo)
# Corregido: Renombrado 'position' a 'spawn_position' y 'size' a 'platform_size'
func create_platform(spawn_position: Vector2, platform_size: Vector2):
	var platform = StaticBody2D.new()
	
	# Aquí usamos la variable local renombrada
	platform.position = spawn_position 
	platform.name = "Platform"
	
	# 1. Forma de colisión
	var collision = CollisionShape2D.new()
	var shape = RectangleShape2D.new()
	# Aquí usamos la variable local renombrada
	shape.size = platform_size 
	collision.shape = shape
	platform.add_child(collision)
	
	# 2. Representación visual
	var sprite = ColorRect.new()
	sprite.color = Color.GREEN_YELLOW
	# Aquí usamos la variable local renombrada
	sprite.size = platform_size
	sprite.position = -platform_size / 2 # Centrar el ColorRect
	platform.add_child(sprite)
	
	add_child(platform)
	return platform

# Función que se ejecuta cuando el nodo está listo
func _ready():
	# 1. Crear el suelo principal
	# ¡Asegúrate de actualizar los llamados a la función también!
	create_platform(Vector2(512, 600), Vector2(1024, 50)) 
	
	# 2. Crear una plataforma flotante
	create_platform(Vector2(200, 450), Vector2(150, 20))
	
	# 3. Instanciar el personaje de Goku
	var player_scene = load("res://player.tscn")
	
	if player_scene:
		var goku = player_scene.instantiate()
		goku.position = Vector2(512, 500)
		goku.name = "Player" 
		add_child(goku)
	else:
		print("ERROR: No se pudo cargar la escena del jugador (player.tscn).")

	# 4. Instanciar el Champiñón (SSJ)
	var mushroom_scene = load("res://saiyan_mushroom.tscn")
	if mushroom_scene:
		var mushroom = mushroom_scene.instantiate()
		mushroom.position = Vector2(512, 550)
		add_child(mushroom)
