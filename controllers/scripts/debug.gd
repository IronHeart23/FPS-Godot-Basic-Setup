extends PanelContainer

@onready var property_container: VBoxContainer = %VBoxContainer

#var property
var frames_per_second : String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.debug = self
	
	visible = false
	

func _input(event):
	if event.is_action_pressed("debug"):
		visible = !visible
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if visible:
		frames_per_second = "%.2f" % (1.0/delta)
		Global.debug.add_property("FPS",frames_per_second,2)
	

func add_property(title: String, value, order):
	var target
	target = property_container.find_child(title,true,false)
	if !target:
		target = Label.new()
		property_container.add_child(target)
		target.name = title
		target.text = target.name + ": " + str(value)
	elif visible:
		target.text = title + ": " + str(value)
		property_container.move_child(target,order)
	

#func add_debug_property(title : String,value):
	#property = Label.new()
	#property_container.add_child(property)
	#property.name = title
	#property.text = property.name + value
