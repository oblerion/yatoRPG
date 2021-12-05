
anims={}
function shooseAnim(item)
  if(type(item)=="table")then
    if(anims[item.name]~=nil)then
      return anims[item.name]
    else 
      return 0
    end
  end
  return 0
end
function anim_epee(rot_beg,rot_end,rot_spd,width)
  -- sword anim
  local ae={
    active=0,
    st=0,
    en=0,
    rot_beg=rot_beg,
    rot_end=rot_end,
    rot_act=0,
    rot_spd=rot_spd,
    width=width
  }
  ae.drawAnim=function(btn,x,y)
    if(ae.active==0 and btn)then
      ae.st = math.deg(math.atan2(sys.mouse.y-y,sys.mouse.x-x))-(rot_end/2)
      ae.st = ae.st + ae.rot_beg 
      ae.en = ae.st+rot_end
      ae.active=1
      ae.rot_act=ae.st
    elseif(ae.active==1)then
      sys.color.set("blanc")
      if(ae.rot_act<ae.en)then
        ae.rot_act=ae.rot_act+ae.rot_spd
      else
        ae.active=0
      end
      love.graphics.arc("fill",x+5,y+5,ae.width,math.rad(ae.rot_act),math.rad(ae.rot_act+3),10)
    end
  end
  return ae
end
function anim_sheld(rot_end,width)
  local as={
    active=0,
    st=0,
    en=0,
    rot_end=rot_end,
    rot_act=0,
    width=width
  }
  as.drawAnim=function(btn,x,y)
    if(btn)then
      as.st = math.deg(math.atan2(sys.mouse.y-y,sys.mouse.x-x))-(rot_end/2)
      as.en = as.st+as.rot_end
      sys.color.set("blanc")
      sys.color.set(0.5)
      love.graphics.arc("fill",x+5,y+5,as.width,math.rad(as.st),math.rad(as.en),10)
      sys.color.set("bleue")
      sys.color.set(0.5)
      love.graphics.arc("fill",x+5,y+5,as.width-10,math.rad(as.st),math.rad(as.en),10)
    end
  end
  return as
end
anims["sword"] = anim_epee(0,145,10,32)
anims["sheld"] = anim_sheld(140,50)