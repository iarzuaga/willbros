extends RichTextLabel

var shown = false
onready var img2 = get_node("../book/winer2")
onready var img = get_node("../book/winer")
	
func _process(delta):
	if not shown:
		shown = true
		set_data()

#@param score int (puntos dentro de truck al final del tiempo)
#@param score1 int (puntos dentro de truck2 al final del tiempo)
#@param objects array (todos los objetos que entraron en el camion del ganador)
#@param values array (el valor de los objetos en el mismo orden que su nombre)
func set_data():
	var winner = {}
	print(global.player_blue_points)
	print(global.player_red_points)
	if global.player_blue_points > global.player_red_points :
		winner.score = global.player_blue_points
		winner.name = "Player 1"
		winner.items = global.player_blue_item
		img2.visible = true
	else:
		winner.score = global.player_red_points
		winner.name = "Player 2"
		winner.items = global.player_red_item
		img.visible = true
	print(winner)
	set_text(winner.name + " Win \n Score: "+str(winner.score)+"\n List objects: "+str(winner.items))

##falta que se puedan ver los puntajes y los objetos en forma de lista
