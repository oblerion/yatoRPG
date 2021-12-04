  for _,v in pairs(sys.filesystem.getAll("lib/rpg")) do
    require("lib/rpg/"..v:sub(0,v:len()-4))
  end


-- A FAIRE --

-- stat :
-- x generator
-- x print
-- x stat_equip() after equip
-- x update_stat()
  -- life
  -- mana
-- A attack()
-- A defend()
-- A miss()

-- player :
-- x move
-- x draw
-- x GUI inventaire,equip
  -- x move item
  -- x equip to inventory
  -- x inventory to equip
-- x GUI mini

-- item :
-- x Item()
-- x print()
-- x Effet()

-- anim :
-- x demi epee
-- x bouclier moyen

-- PLUS TARD --

-- class :
-- x newClass()
-- A newHumain()
-- A newHelio()
-- A newMut()
-- x equipOf(item)
-- x Getequip(type)
-- A capacity_apply()
-- A pouvoir_apply()

-- ia, enemi : 
-- A ia()
-- A mode_attack()
-- A mode_defend()

-- FINI --

-- item:
-- x Item() 
-- x Effet()
-- x item[]
-- x item.get()
