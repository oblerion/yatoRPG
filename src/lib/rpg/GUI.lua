GUI={
    timer=sys.Timer()
}
GUI.infoEntitee=function(class,x,y)
    local str = "[stat]"..
    "\nvie: "..class.stat.vie..
    "\nforce: "..class.stat.force..
    "\nmagie: "..class.stat.magie..
    "\nchance: "..class.stat.chance..
    "\n\n[stat equip]"
    for i=1,2 do
      if(type(class.getEquip(i))=="table")then
        if(class.getEquip(i).effet.pta_type=="n")then
          str=str.."\n("..i..")attaque : "..
          class.getEquip(i).effet.pta_min..
          " - "..class.getEquip(i).effet.pta_max
        elseif(class.getEquip(i).effet.pta_type=="s")then
          str=str.."\n("..i..")soin : "..
          class.getEquip(i).effet.pta_min..
          " - "..class.getEquip(i).effet.pta_max
        elseif(class.getEquip(i).effet.pta_type=="b")then
          str=str.."\n("..i..")blocage : "..
          class.getEquip(i).effet.pta_min..
          " - "..class.getEquip(i).effet.pta_max
        end
      end
    end
    str=str.."\ndefence: "..class.stat_equip.defence..
    "\nmana: "..class.stat_equip.mana..
    "\nlife: "..class.stat_equip.vie..
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
    for i=1,#class.inventaire do 
      if(type(class.inventaire[i])=="table")then
        str=str.."\n"..class.inventaire[i].name
      end
    end
    sys.text(str,x,y,15)
  end
  function jauge(x,y,max,uni,w,h,col1,col2)
    local hp = math.floor((uni/max)*w)
    sys.color.set(col1)
    love.graphics.rectangle("fill",x,y,w,h)
    sys.color.set(col2)
    love.graphics.rectangle("fill",x,y,hp,h)
    sys.color.set("blanc")
  end
  -- interface minimale pv mana
  GUI.mini=function(class,x,y)
    jauge(x,y,class.stat_equip.vie,class.vie,40,5,"noir","rouge")
    sys.color.set("noir")
    sys.text(class.vie.."/"..class.stat_equip.vie,x,y+5,7)
    if(class.stat_equip.mana>0)then
      jauge(x,y+6,class.stat_equip.mana,class.mana,40,5,"noir","bleue")
    end
  end
  -- affiche icone equip
  function draw_equip(item,x,y)
    if(type(item)=="table")then
      if(asset[item.asset.."3.png"]~=nil)then
        love.graphics.draw(asset[item.asset.."3.png"],x,y)
        sys.color.set("noir")
        sys.color.set(0.5)
        if(item.lvl<10)then
          love.graphics.rectangle("fill",x+4,y+44,20,15)
        elseif(item.lvl >= 10)then
          love.graphics.rectangle("fill",x+4,y+44,30,15)
        end
        sys.color.set("blanc")
        sys.text("L"..item.lvl,x+4,y+44,15)
      else
        print("not found "..item.asset..item.lvl..".png")
      end
    end
  end
  -- interface joueur 
  GUI.med=function(class,x,y)
    local i
    local t_item
    local btn_equip={
      sys.btn.simple(x,y+60,64,64),
      sys.btn.simple(x+64,y+60,64,64),
      sys.btn.simple(x+(2*64),y+60,64,64),
      sys.btn.simple(x+(3*64),y+60,64,64)
    }
    -- jauge vie
    jauge(x,y,class.stat_equip.vie,class.vie,100,15,"noir","rouge")
    sys.color.set("blanc")
    sys.text("hp: "..(math.floor(class.stat_equip.vie/class.vie)*100).."%",x+30,y,12)
    -- jauge mana
    if(class.stat_equip.mana>0)then
      jauge(x,y+23,class.stat_equip.mana,class.mana,100,15,"noir","bleue")
      sys.color.set("blanc")
      sys.text("mp: "..(math.floor(class.stat_equip.vie/class.vie)*100).."%",x+30,y+23,12)
    end
    -- equip update switch atk item
    for i=1,2 do
      if(GUI.timer.test() and 
        btn_equip[i].ifselect()==true)then
        if(sys.mouse.btng==true)then
          if(class.getEquip(1) ~= 0 and class.getEquip(2) ~=0)then
            t_item = class.getEquip(1)
            class.equipOf(class.getEquip(2),1)
            class.equipOf(t_item,2)
          end
          GUI.timer.start(20)
        end
        if(sys.mouse.btnd==true)then
          class.unequipOf(i)
          GUI.timer.start(25)
        end
      end
    end
    -- equip draw
    for i=1,4 do
      sys.color.set("blanc")
      sys.text("equip:",x,y+40,15)
      love.graphics.rectangle("line",x+(i-1)*64,y+60,64,64)
      draw_equip(class.getEquip(i),x+(i-1)*64,y+60)
    end
    -- inventaire update
    for i=1,#class.inventaire do
      if(GUI.timer.test() and 
      sys.mouse.btnd==true and 
      sys.collide(sys.mouse,{x=x+((i-1)%4)*64,y=y+145+math.floor((i-1)/4)*64,w=64,h=64}))then
        if(class.inventaire[i].type==1 or 
        class.inventaire[i].type==2)then
          if(class.getEquip(1)==0)then
            class.equipOf(class.inventaire[i],1)
            class.delToInventory(i)
          elseif(class.getEquip(2)==0)then
            class.equipOf(class.inventaire[i],2)
            class.delToInventory(i)
          else
            t_item = class.getEquip(1)
            class.equipOf(class.inventaire[i],1)
            class.delToInventory(i)
            class.addToInventory(t_item)
          end
        elseif(class.inventaire[i].type==3)then
          if(class.getEquip(3)==0)then
            class.equipOf(class.inventaire[i],3)
            class.delToInventory(i)
          else
            t_item = class.getEquip(3)
            class.equipOf(class.inventaire[i],3)
            class.delToInventory(i)
            class.addToInventory(t_item)
          end
        elseif(class.inventaire[i].type==4)then
          if(class.getEquip(4)==0)then
            class.equipOf(class.inventaire[i],4)
            class.delToInventory(i)
          else
            t_item = class.getEquip(4)
            class.equipOf(class.inventaire[i],4)
            class.delToInventory(i)
            class.addToInventory(t_item)
          end
        end
        GUI.timer.start(30)
      end
    end
    -- inventaire draw
    sys.text("inventaire:",x,y+125,15)
    for i=1,#class.inventaire do
      love.graphics.rectangle("line",x+((i-1)%4)*64,y+145+math.floor((i-1)/4)*64,64,64)
      draw_equip(class.inventaire[i],x+((i-1)%4)*64,y+145+math.floor((i-1)/4)*64)
    end
    love.graphics.rectangle("line",x-5,y-5,270,305)
    --Text(str,x,y+25,15)
  end