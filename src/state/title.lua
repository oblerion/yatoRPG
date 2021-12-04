local xtitle=0
local btn1 = sys.btn.img(100,100,sys.asset["Image11.png"])
local ni=1
local canvas = sys.canvas()
canvas.set( function()
  sys.color.set("rouge")
  sys.text("yato RPG",24,23+xtitle,100)
  love.graphics.draw(sys.asset["Image11.png"],12,12)
  sys.color.set("blanc")
  sys.text("play",101,13)
end)

return {
  init=function()
 
  end,
  update=function(dt)
    if(love.keyboard.isDown("up"))then
      ni=2
      state.set("game")
    end
  end,
  draw=function()
    btn1.draw()
    canvas.draw()
  end
}
