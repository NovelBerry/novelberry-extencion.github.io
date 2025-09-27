extends Area2D

# Configuración visual y de colisión
const SIZE = 32.0

func _ready():
	# 1. Creamos la forma de colisión (a puro código)
	var collision = CollisionShape2D.new()
	var shape = CircleShape2D.new()
	shape.radius = SIZE / 2
	collision.shape = shape
	add_child(collision)
	
	# 2. Representación visual (rojo temporalmente)
	var sprite = ColorRect.new()
	sprite.color = Color.RED # Color temporal para el Champiñón Saiyan
	sprite.size = Vector2(SIZE, SIZE)
	# Centramos el ColorRect para que coincida con la posición del Area2D
	sprite.position = Vector2(-SIZE / 2, -SIZE / 2) 
	add_child(sprite)
	
	# 3. Conectamos la señal de detección de colisión
	# body_entered es una señal integrada que se emite cuando un cuerpo (como Goku) choca
	body_entered.connect(_on_body_entered) 

# Función que se llama automáticamente cuando algo choca
func _on_body_entered(body: Node2D):
	# Verificamos si el objeto que chocó tiene un nombre de "Player"
	if body.name == "Player":
		# Llamamos a la función de transformación que definimos en player.gd
		body.transform_to_ssj()
		
		# Destruimos el champiñón
		queue_free()
