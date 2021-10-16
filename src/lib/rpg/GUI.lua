GUI={}
GUI.infoEntitee=function(class,x,y)
    local str = "[stat]"..
    "\nvie: "..class.stat.vie..
    "\nforce: "..class.stat.force..
    "\nmagie: "..class.stat.magie..
    "\nchance: "..class.stat.chance..
    "\n\n[stat equip]"..
    "\nattaque min: "..class.stat_equip.attaque_min..
    "\nattaque max: "..class.stat_equip.attaque_max..
    "\nattaque min2: "..class.stat_equip.attaque_min2..
    "\nattaque max2: "..class.stat_equip.attaque_max2..
    "\ndefence: "..class.stat_equip.defence..
    "\nmana: "..class.stat_equip.mana..
    "\n\n[equipement]"
    if(class.getEquip(1)~=0)then
      str=str.."\n[main droite]: "..class.getEquip(1).name
    else
      str=str.."\n[main droite]:"
    end
    if(class.getEquip(2)~=0)then
      str=str.."\n[main gauche]: "..class.getEquip(2).name
    else
      str=str.."\n[main gauche]:"
    end
    if(class.getEquip(3)~=0)then
      str=str.."\n[corp]: "..class.getEquip(2).name
    else
      str=str.."\n[corp]:"
    end
    if(class.getEquip(4)~=0)then
      str=str.."\n[pied]: "..class.getEquip(2).name
    else
      str=str.."\n[pied]:"
    end
    str=str.."\n\n[inventaire]"
    local i=1
    while(class.inventaire[i]~=nil) do 
      str=str.."\n"..class.inventaire[i].name
      i=i+1
    end
    Text(str,x,y,15)
  end