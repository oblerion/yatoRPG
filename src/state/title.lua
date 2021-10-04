asset.new({"Image11.png"})
local xtitle=0
local btn1 = Btn_img(100,100,asset["Image11.png"])
local ni=1
local canvas = Canvas()
canvas.set( function()
  Color(rouge)
  Text("yato RPG",24,23+xtitle,100)
  love.graphics.draw(asset["Image11.png"],12,12)
  Color(blanc)
  Text("play",101,13)
end)

return {
  load=function()
   
  end,
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
