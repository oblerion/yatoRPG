state = {list={},scene=""} --table of scene
state.new=function(file)
	local Tstate = require("state/"..file)
	Tstate.name=file
	state.list[Tstate.name]=Tstate
end
state.get=function()
	return state.list[state.scene]
end
state.set=function(name)
	if(state.list[name])then
		state.scene = name
		if(state.get().init)then 
			state.get().init() 
		end
	else 
	  print("ERROR: setState("..name..") => no state ")
	  love.event.quit()
	end
end
