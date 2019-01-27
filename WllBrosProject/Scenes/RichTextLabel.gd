extends RichTextLabel

func _process(delta):
	set_data(270, 250, ["caja", "palo", "rata"], [250, 300, 100])
	pass

#@param score int (puntos dentro de truck al final del tiempo)
#@param score1 int (puntos dentro de truck2 al final del tiempo)
#@param objects array (todos los objetos que entraron en el camion del ganador)
#@param values array (el valor de los objetos en el mismo orden que su nombre)
func set_data(score, score1, objects, values):
	var img2 = get_node("../book/winer2")
	var img = get_node("../book/winer")
	
	if score <= score1 :
		set_text("Player 2 win \n Score "+str(score1)+"\n Objetos recolectados "+str(objects))
		img2.visible = true
		
		
	else:
		set_text("Player 1 win \n Score "+str(score1)+"\n Objetos recolectados "+str(objects))
		img.visible = true
		
##falta que se puedan ver los puntajes y los objetos en forma de lista
