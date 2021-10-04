--debug
io.stdout:setvbuf('no')
--if arg[#arg] == "-debug" then require("mobdebug").start() end
love.graphics.setDefaultFilter("nearest")
require("lib/sys")
require("lib/rpg")

state.new("title")
state.new("game")
state.set("title")



