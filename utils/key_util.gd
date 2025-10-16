extends Node

enum Action{LEFT,RIGHT,UP,DOWN,SHOOT,PASS}
const ACTION_MAP:Dictionary = {
	Player.ControlScheme.P1 : {
		Action.LEFT:"p1_left",
		Action.RIGHT: "p1_right",
		Action.UP: "p1_up",
		Action.DOWN : "p1_down",
		Action.SHOOT : "p1_shoot",
		Action.PASS : "p1_pass"
	},
	Player.ControlScheme.P2 : {
		Action.LEFT:"p2_left",
		Action.RIGHT: "p2_right",
		Action.UP: "p2_up",
		Action.DOWN : "p2_down",
		Action.SHOOT : "p2_shoot",
		Action.PASS : "p2_pass"
	},
}

"""接受操控类型和具体行为,  获取当前类型及行为下的 Vector"""
func get_input_vector(control:Player.ControlScheme):
	return Input.get_vector(
		ACTION_MAP[control][Action.LEFT],
		ACTION_MAP[control][Action.RIGHT],
		ACTION_MAP[control][Action.UP],
		ACTION_MAP[control][Action.DOWN],
	)

"""接受一个操作方式以及行为, 判定行为是否按下"""
func is_action_pressed(control:Player.ControlScheme , action : Action):
	return Input.is_action_pressed(ACTION_MAP[control][action])

"""接受一个操作方式以及行为, 判定行为是否按下,只检测一次 , 不是按下的时候都执行"""
func is_action_just_pressed(control:Player.ControlScheme , action : Action):
	return Input.is_action_just_pressed(ACTION_MAP[control][action])

"""接受一个操作方式以及行为, 判定行为是否松开 , 只检测一次"""
func is_action_just_release(control:Player.ControlScheme , action : Action):
	return Input.is_action_just_released(ACTION_MAP[control][action])
