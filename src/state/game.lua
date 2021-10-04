local j1 =player(newHumain())
--local e1 =Enemy(newHumain())

--os.getenv(env)
--love.system.getOS()
--os.execute("ls")
j1.equipOf(items.get("sword",2))

j1.print_equip()
return {
  load=function()
    asset.new({"perso.png"})
  end,
  init=function()
	
  end,
  update=function(dt)
    j1.move()
  end,
  draw=function()
    stat.print(j1)
    love.graphics.draw(asset["perso.png"],j1.x,j1.y)
    j1.draw()
    --e1.draw()
  end
}
