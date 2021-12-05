--debug
io.stdout:setvbuf('no')
--if arg[#arg] == "-debug" then require("mobdebug").start() end
love.graphics.setDefaultFilter("nearest")
require("lib/sys")
require("lib/rpg")

sys.asset.new(sys.filesystem.getAll("asset"))
--sys.state.new("title")
sys.state.new("game")
sys.state.new("editor_map")
sys.state.set("game")



