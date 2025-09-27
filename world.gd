# world.gd
extends Node2D

# Palabra clave para poder ver el resultado de este script en el editor
tool

# Una función para crear una plataforma estática (el suelo)
func create_platform(position: Vector2, size: Vector2):
    var platform = StaticBody2D.new()
    platform.position = position
    platform.name = "Platform"
    
    # 1. Forma de colisión
    var collision = CollisionShape2D.new()
    var shape = RectangleShape2D.new()
    shape.size = size
    collision.shape = shape
    platform.add_child(collision)
    
    # 2. Representación visual
    var sprite = ColorRect.new()
    sprite.color = Color.GREEN_YELLOW
    sprite.size = size
    sprite.position = -size / 2 # Centrar el ColorRect
    platform.add_child(sprite)
    
    add_child(platform)
    return platform

# Función que se ejecuta cuando el nodo está listo
func _ready():
    # 1. Crear el suelo principal
    create_platform(Vector2(512, 600), Vector2(1024, 50)) # Posición y tamaño
    
    # 2. Crear una plataforma flotante
    create_platform(Vector2(200, 450), Vector2(150, 20))
    
    # 3. Instanciar el personaje de Goku
    var player_scene = load("res://player.tscn")
    if player_scene:
        var goku = player_scene.instantiate()
        goku.position = Vector2(512, 500)
        add_child(goku)
    else:
        print("ERROR: No se pudo cargar la escena del jugador (player.tscn)")
