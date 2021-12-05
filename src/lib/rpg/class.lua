
-- type d'unitée 
function newClass()
	local class={
		stat={
			vie=0,--stat vie
			force=0,--contraite item
      magie=0,--contrainte item
      chance=0,--chance toucher/esquive
      -- bonus stat
      b_attaque=0,
      b_defence=0,
      b_exp=0,
      b_metrise=0,
      b_vie=0,
      b_force=0,
      b_magie=0,
      b_chance=0
		},
    stat_equip=
    {
      attaque_min=0,
      attaque_max=0,
      attaque_min2=0,
      attaque_max2=0,
      defence=0,
      --resistance={--feu=0,--eau=0,
      --},
      mana=0,
      vie=0,
      vitesse=3
    },
    vie=0,
    mana=0,
    exp=0,
    lvl=1,
		metrise={épée=0,lance=0,arc=0,baton=0,hache=0,bouclier=0,tome=0
		},
		competence={},
		capacitee={},
    equip={
      0,--main gauche
      0,--main droite
      0,-- armure
      0 -- botte
    },
    inventaire={}
	}
  class.equipOf=function(pitem,pos)
    class.equip[pos]=pitem
    class.update_stat_equip()
  end
  class.unequipOf=function(pos)
    class.addToInventory(class.equip[pos])
    class.equip[pos]=0
    class.update_stat_equip()
  end
  class.update_stat=function()
    class.stat_equip.vie = 100+(class.stat.vie)
    class.vie = class.stat_equip.vie
    --class.stat_equip.mana = 0
    class.mana = class.stat_equip.mana
  end
  class.addToInventory = function(item)
    if(type(item)=="table")then
      table.insert(class.inventaire,item)
    end
  end
  class.delToInventory = function(item)
    if(type(item)=="table")then
      for n,v in pairs(class.inventaire)do
        if(v.name == item.name and
        v.lvl == item.lvl)then
          table.remove(class.inventaire,n)
        end
      end
    elseif(type(item)=="number")then
      table.remove(class.inventaire,item)
    end
  end
  class.update_stat_equip=function()
    for n,_ in pairs(class.stat_equip) do
      class.stat_equip[n]=0
    end

    for i=1,#class.equip do
      if(type(class.equip[i])=="table")then
        local litem = {}
        litem = class.equip[i]
        -- for eatch effect item
        for n,v in pairs(litem.effet)do
          if(class.stat_equip[n]~=nil)then
              class.stat_equip[n]=class.stat_equip[n]+v
          end
        end
      end
    end
    class.update_stat()
  end
  
  class.getPta=function(type)
    local pitem = class.getEquip(type)
    return math.random(pitem.effet.pta_min,pitem.effet.pta_max)
  end

  class.getEquip=function(type)
    if(type< #class.equip and type>0)then
      return class.equip[type]
    end
    return 0
  end
  class.setCapacitee=function(ptable)
    for i=1,#ptable do
      if(str_find(ptable[i],"+") >0)then
        if(str_find(ptable[i],"defence") >0)then
          class.stat.b_defence = 5
        elseif(str_find(ptable[i],"exp") >0)then
          class.stat.b_exp = 1.5
        elseif(str_find(ptable[i],"metrise") >0)then
          class.stat.b_metrise = 1.5
        end
      elseif(str_find(ptable[i],"-") >0)then
        
      end
    end
  end
  stat.generator(class)
	return class
end

function newHumain()
 local hum = newClass()
-- hum.setCapacitee({"metrise +","exp +"})
 return hum
end

function newHelio()
 local hel = newClass()
 --hel.capacitee={"defence +","- equ3"}
 return hel
end

function newMut()
  local mut = newClass()
  -- humain avec stat alteree
  return mut
end