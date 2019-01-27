extends Node

func _process(delta):
	set_data(200, 150, ["caja", "palo", "rata"])
	pass

#@param score int (puntos dentro de truck al final del tiempo)
#@param score1 int (puntos dentro de truck2 al final del tiempo)
#@param objects array (todos los objetos que entraron en el camion del ganador)
func set_data(score, score1, objects):
	if score < score1 :
		$RichTextLabel.set_text("Player 2 Win \n Score:"+str(score1)+"\n List objects:"+str(objects))
		pass
