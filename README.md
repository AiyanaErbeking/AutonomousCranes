*Running the project*
- the entire project is contained in the scene `crane.tscn`
- open the project in Godot (by opening the `project.godot` file) and load this scene
- there are two cameras which can be toggled on/off
	- the camera that is a child node of `Boom` is the camera footage we want to use as input for our CV algorithm


*Integrating a CV algorithm in Godot*
- it is possible to export camera feed as an image or texture eg. with `get_viewport().get_texture()`
- these can then be passed as input to a CV algorithm
- the CV algorithm can be written in Python
- integrate Godot with Python
	- `GDNative`: links Godot with external Python libraries eg. `OpenCV`
	- `Godot-Python`: directly call Python scripts from within Godot


*Reinforcement Learning in Godot*
- use the Godot library `RL Agents` https://github.com/edbeeching/godot_rl_agents


*Performance*
- RL training can be run in parallel with environment duplications - supported by `RL Agents`


*To Fix*
- currently the collision boxes of `Truck`, `Hook` and `Gruzchik` are a bit erroneous (it is possible to push Gruzchik with the hook and the hook moves through the truck)
