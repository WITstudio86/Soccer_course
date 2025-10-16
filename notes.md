# 实现流程记录

## 第一课

### 编辑器配置

> 在为 2D 游戏开发做准备的时候剔除 3D 相关的内容

在 `编辑器 -> 管理编辑器功能` 中可以创建配置, 可以删除 3D 场景 , 资产库 , 3DNode等

### 分辨率设置

- `项目设置 -> 显示中的窗口 -> viewport width/height` , 开启高级设置以后可以修改`window width/height Overrid`
	- 可以覆盖宽高选项 , 例如 1400 , 900 可以在分辨率不变的情况下修改窗口宽高
	- stretch 中的 mode 可以设置游戏的缩放模式
		- Mode下的 viewport 可以设置比例固定
		- scale mode deinteger 可以设置宽高永远是整数
- 渲染 下的纹理
	- canvas texture 中的 Default Texture Filter可以设置纹理过滤器 , 
		- **像素** 画面设置为 Nearest 临近过滤 , 可以避免画面的压缩和模糊
		
### 准备

1. 创建根 Node2D , 包含所有 2D场景 , 名为 World
2. 背景
	1. 3个图层 , 放到同一个Node2D 中 , 名为 Backgrounds
	2. 通过 pitch-background.png 实现Grass精灵 , 比窗口更大
		1. 修改 offset 中的 centered 为 false , 让精灵左上角对齐而不是居中对齐 (素材并不一定是偶数像素)
		2. 这个素材是白色的 , 可以通过visibility 中的 modulate 修改场景颜色为绿色
	3. 创建一个新的精灵pattern包含 piych-pattern.png 纹理 , 作为球场上的图案(关闭 certerd) , 并设置更深一点的颜色
	3. 第三个精灵 lines , 将 pitch-line.png 作为精灵的纹理	
3. 运动员
	1. 使用characterBody2D 实现 , 存在物理检测也可以在其他物理体上滑行, Player 
	2. 使用 soccerr-player 精灵图添加动画 , idle 0.6秒
	3. certerd false, 然后通过offset实现偏移 , 脚对齐原点
	4. 给角色的脚部添加碰撞体积 , 可以是一个横着的胶囊
4. 将运动员实例化到 world 中