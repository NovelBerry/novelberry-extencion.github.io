# player.gd
extends CharacterBody2D

# [VARIABLES DE VELOCIDAD Y GRAVEDAD ANTERIORES...]
const SPEED = 300.0
const JUMP_VELOCITY = -500.0
@export var gravity = 1200.0 

# Función para configurar los componentes del personaje (solo por código)
func _ready():
    # 1. Creamos el componente visual (Sprite)
    var sprite = Sprite2D.new()
    sprite.texture = load("res://assets/goku_placeholder.png") # Esto lo crearemos más tarde
    sprite.modulate = Color.BLUE # Color temporal: Goku Azul
    add_child(sprite)

    # 2. Creamos el componente de colisión
    var collision_shape = CollisionShape2D.new()
    var shape = RectangleShape2D.new()
    shape.size = Vector2(32, 64) # Tamaño de un personaje de plataforma 2D
    collision_shape.shape = shape
    add_child(collision_shape)
    
# [EL CÓDIGO _physics_process(delta) VA AQUÍ - ES EL MISMO DEL ANTERIOR]
# ... para manejar la física, salto y movimiento ...
