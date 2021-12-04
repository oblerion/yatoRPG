local j1 =player(newHumain())
Monsters.new(newHumain(),300,380)
--newMonster(newHumain(),170,200)

--os.getenv(env)
--love.system.getOS()
--os.execute("ls")
j1.x = 300
j1.y = 400
j1.equipOf(createItem("sword",2),1)
--j1.equipOf(items.get("sword",3),2)
j1.addToInventory(createItem("cure",1))
j1.addToInventory(createItem("cure",2))
j1.addToInventory(createItem("cure",5))
j1.addToInventory(createItem("sheld",10))
sys.gamezone.set(0,0,700,sys.ecran.h)
sys.asset.new({{"persos.png",32}})
local timer = sys.Timer()
return {
  init=function()
    sys.gamezone.set(0,0,700,sys.ecran.h)
  end,
  update=function(dt)
    if(sys.gamezone.ongame(sys.mouse)==true)then
      j1.move(dt)
      Monsters.update(j1)
      j1.update_attack()
      bullets.move(dt)
      if(bullets.collide(j1,Monsters)~=false)then
        local nb,mo = bullets.collide(j1,Monsters)
        Monsters[mo].vie = Monsters[mo].vie-bullets[nb].degat
        table.remove(bullets,nb)
      end
    end
  end,
  draw=function()
    bullets.draw()
    GUI.infoEntitee(j1,722,364)
    GUI.med(j1,720,20)
    Monsters.draw()
    j1.draw()
    GUI.mini(j1,j1.x,j1.y-23)
    if(sys.gamezone.ongame(sys.mouse)==true)then
      j1.draw_attack()
    end
    sys.gamezone.draw()
  end
}
