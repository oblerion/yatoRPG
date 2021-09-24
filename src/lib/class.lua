
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
      attaque=0,
      defence=0,
      resistance={
        --feu=0,
        --eau=0,
      }
    },
    mana=0,
    mouvement=3,
    exp=0,
		metrise={
			épée=0,
			lance=0,
			arc=0,
			baton=0,
			hache=0,
			bouclier=0,
      tome=0
		},
		competence={},
		capacitee={}
	}
	return class
end
function print_stat(class)
  Text("magie: "..class.stat.magie,12,24)
  Text("force: "..class.stat.force,12,44)
  Text("vie: "..class.stat.vie,12,64)
  Text("chance: "..class.stat.chance,12,84)
end
function stat_gene(class)
  math.randomseed(love.timer.getTime())
  local rdm = math.random(1,10)
  local pts = 35
  if(rdm > 5)then 
    class.stat.magie = 1
    pts = pts - class.stat.magie
    class.stat.force = 0
  else
    class.stat.force = 1
    pts = pts - class.stat.force
    class.stat.magie = 0
  end
  while(pts>0)do
    rdm = math.random(1,3)
    if(rdm==1)then
      if(class.stat.force==0)then
        class.stat.magie=class.stat.magie+2
        pts=pts-2
      else
        class.stat.force=class.stat.force+2
        pts=pts-2
      end
    elseif(rdm==3)then
        class.stat.vie=class.stat.vie+1
        pts=pts-1
    else
        class.stat.chance=class.stat.chance+1
        pts=pts-1
    end
  end
end
function newHumain()
 
end

