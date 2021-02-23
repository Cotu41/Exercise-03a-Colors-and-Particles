extends ColorRect

onready var HUD = get_node("/root/Game/HUD")
var c = 0
var colors = [Color(0,0,0,1), Color("212529"), Color("343a40") ,Color("212529")
]

func _ready():
	HUD.connect("changed",self,"_on_HUD_changed")
	update_color()

func _on_HUD_changed():
	update_color()

func _on_Timer_timeout():
	if HUD.color_background:
		c = wrapi(c+1, 0, colors.size())
		update_color()


func update_color():
	if HUD.color_background:
		color = colors[c]
	else:
		color = Color(0,0,0,1)
