
# 02-基本移动

## 移动的方向

1. 添加奔跑的 player 动画
2. 添加按键映射 , 玩家1和玩家 2 都设置
3. 基本程序
	1. 添加类名
	2. 指定速度, 默认 80
	3. 创建对动画精灵的引用 , 使用唯一引用 % 可以确保之后对层级的更改不会影响引用
	4. 在 process 函数中通过 get_input() 获取按键输入对应的移动方向 direction
	5. velocity设置以及move_and_slide()
	6. 添加动画, 只要 Velocity 长度大于 0 就播放奔跑(不理解为什么教程中是这样写的 , 我的代码中写的是通过与 Vector2.Zero 是否相等进行判断的) , 否则就播放 idle
4. 添加额外的玩家
	1. 只希望有一个是由玩家控制的角色
	2. 添加新的枚举: ControlScheme{CPU,P1,P2}
	3. 创建一个导出变量control_scheme指定枚举 , 并 export 它
	4. 创建工具脚本 , key_utils , 设置它为全局
		1. 在其中枚举所有可能的动画 , Action{LEFT , RIGHT , UP, DOWN , SHOOT , PASS}
		2. 创建字典 ACTIONS_MAP , dictionary 类型 , 
			1. 其中两个键值对 , 分别死 Player 下操作方式映射的玩家1和玩家 2
			2. 每个键值对中包含 ACTIONS_MAP 中所有枚举元素的对应映射字符串
		3. 创建 get_input 方法 , 接受一个方案类型 , 返回一个运动方向
			1. 接受一个 Player中操作方式的映射
			2. 通过这个映射从字典中得到对应的 Action 映射对
			3. 返回 Input.get_vector(映射对中的 LEft , right , up , )等 , 从映射对中获取
		4. 其他函数
			1. 实现 is_action_pressed 判断是否按下, 接受操作方式 , 和行为 , 返回是否 is_action_pressed
			2. 实现 just_pressed的判断
			3. 实现 just_release
	5. 替换脚本中的方法
5. 重构玩家程序
	1. 将动画切换提取到单独的函数 set_movement_animation 中
	2. 在操作方式是 cpu 的时候跳过 , 否则执行 handle_human_movement 函数中 , 这个函数包括velovity 和 direction 设置
6. 改变不同的额外玩家的控制方式
7. 方向改变
	1. 使用变量 heading 存储当前面向的方向
	2. 创建函数set_heading判断当前 velocity 中 x 的正负 , 为正的时候方向改为右侧 , 负改为左侧 , 将这个函数放入主函数
	3. 创建方法 filp_sprites , 根据朝向决定是否翻转精灵, 添加到主流程

## 铲球
1. 添加铲球动画 , 注意循环播放 , 因为只有一帧
