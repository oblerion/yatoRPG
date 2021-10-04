
-- type d'unitée 
function newClass()
	local class={
		stat={
			vie=0,--stat vie
			force=0,--atk phys
      magie=0,--atk magic
      chance=0,--chance toucher/esquive
		},
    stat_equi=
    {
      attaque=0,defence=0,resistance={--feu=0,--eau=0,
      },mana=0,mouvement=3
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
  class.equipOf=function(pitem)
    class.equip[pitem.type]=pitem
  end
  class.getEquip=function(type)
    if(type< #class.equip and type>0)then
      return class.equip[type]
    end
    return 0
  end
  class.print_equip=function()
    --local equip = class.equip
    print("equip","type")
    for n,v in pairs(class.equip)do
      if(v ~= 0)then
        print(v.name,n)
        --v.print()
      end
    end
  end
  stat.generator(class)
	return class
end

function newHumain()
 local hum = newClass()
 return hum
end

