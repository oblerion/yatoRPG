local add=function(c)
  local path = "lib/rpg/"
  for _,v in pairs(c) do
    require(path..v)
  end
end
add({"player","class","stat","item"})

-- A FAIRE --

-- stat :
-- x generator
-- x print
-- A stat_equip() after equip
-- A attack()
-- A defend()
-- A miss()

-- player :
-- x move
-- x draw
-- A GUI stat,inventaire,equip

-- PLUS TARD --

-- class :
-- x newClass()
-- A newHumain()
-- A newHelio()
-- A newMut()
-- x equipOf(item)
-- x Getequip(type)

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
