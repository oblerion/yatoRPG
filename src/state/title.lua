local xtitle=0
local btn1 = Btn_img(100,100,asset["Image11.png"])
return {
  load=function()
   asset.new({"Image11.png"})
  end,
  init=function()
	
  end,
  update=function(dt)
    if(love.keyboard.isDown("up"))then
		state.set("game")
    end
  end,
  draw=function()
    Fill(blanc)
    Color(rouge)
    Text("yato RPG",24,23+xtitle,100)
    love.graphics.draw(asset["Image11.png"],12,12)
    btn1.draw()
    Color(blanc)
    Text("play",101,13)
  end
}
