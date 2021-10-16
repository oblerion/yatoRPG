
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
      resistance={--feu=0,--eau=0,
      },
      mana=0,
      vitesse=3
    },
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
    if(class.equip[pos]==0)then
      class.equip[pos]=pitem
    elseif(type(class.equip[pos])=="table")then
      table.insert(class.inventaire,class.equip[pos])
      class.equip[pos]=pitem
    end
    class.update_stat_equip()
  end
  class.update_stat_equip=function()
    local attaque_bonus= function(class)
      local kstatem = "attaque_min"
      local kstatep = "attaque_max" 
      for i=1,2 do
        if(type(class.equip[i])=="table")then
          if(i==2)then 
            kstatem = "attaque_min2"
            kstatep = "attaque_max2" 
          end
          if(class.equip[i].type==1)then
            class.stat_equip[kstatem]=class.stat_equip[kstatem]+math.floor(class.stat.force/5)
            class.stat_equip[kstatep]=class.stat_equip[kstatep]+math.floor(class.stat.force/5)
          elseif(class.equip[i].type==2)then
            if(class.stat_equip[kstatem]<0)then
              class.stat_equip[kstatem]=class.stat_equip[kstatem]-math.floor(class.stat.magie/5)
              class.stat_equip[kstatep]=class.stat_equip[kstatep]-math.floor(class.stat.magie/5)
            else
              class.stat_equip[kstatem]=class.stat_equip[kstatem]+math.floor(class.stat.magie/5)
              class.stat_equip[kstatep]=class.stat_equip[kstatep]+math.floor(class.stat.magie/5)
            end
          end
        end
      end
    end
    for i=1,#class.equip do
      if(type(class.equip[i])=="table")then
        local litem = {}
        litem = class.equip[i]
        for n,v in pairs(litem.effet)do
          if(class.stat_equip[n]~=nil)then
            if(i==2 and(n=="attaque_min"or n=="attaque_max"))then 
              class.stat_equip[n.."2"]=litem.effet[n]
            else
              class.stat_equip[n]=v
            end
          end
        end
      end
    end
    attaque_bonus(class)
  end

  class.getEquip=function(type)
    if(type< #class.equip and type>0)then
      return class.equip[type]
    end
    return 0
  end
  class.print_equip=function()
    --print("equip","type")
    for n,v in pairs(class.equip)do
      if(v ~= 0)then
        --print(v.name,n)
        --v.print()
      end
    end
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