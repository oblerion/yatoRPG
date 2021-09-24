--debug
io.stdout:setvbuf('no')
--if arg[#arg] == "-debug" then require("mobdebug").start() end
love.graphics.setDefaultFilter("nearest")
require("lib/sys")
addLib("class")

state.new("title")
state.new("game")
state.set("game")

----------------------MAIN------------------

function love.load()
	for _,v in pairs(state.list)do
	if not(v.load ==nil)then v.load() end
	end
	if(state.get().init)then state.get().init() end
end
function love.update(dt)
	if(love.keyboard.isDown("f5"))then 
		love.event.quit() 
	end
	Mouse.update()
	if(state.get().update)then 
		state.get().update(dt) 
	end
end

function love.draw()
	if(state.get().draw)then state.get().draw() end
end
