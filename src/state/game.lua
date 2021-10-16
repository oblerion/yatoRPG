local j1 =player(newHumain())
--local e1 =Enemy(newHumain())

--os.getenv(env)
--love.system.getOS()
--os.execute("ls")
j1.equipOf(items.get("cure",1),1)
j1.equipOf(items.get("sword",1),2)
--print(j1.stat_equip.attaque_max2)
--print(j1.stat_equip.vitesse)
--j1.print_equip()

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
 --   love.graphics.draw(asset["perso.png"],j1.x,j1.y)
    j1.draw()
    --GUI.infoEntitee(j1,312,34)
    --e1.draw()
    j1.attack()
  end
}
