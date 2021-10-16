  local st 
  local en
function player(class)
  local player=class
  player.x=0
  player.y=0
  player.mi=0
  player.anim_attack=0
  player.move=function()
    if(love.keyboard.isDown("up"))then
      player.y=player.y-1
    end
    
    if(love.keyboard.isDown("down"))then
      player.y=player.y+1
    end
    
    if(love.keyboard.isDown("left"))then
      player.x=player.x-1
    end
    
    if(love.keyboard.isDown("right"))then
      player.x=player.x+1
    end
  end
  player.draw=function()
    Text("P",player.x,player.y,12)
    --love.graphics.rectangle("fill",player.x,player.y,12,12)
  end
  player.attack=function()
    -- sword anim
    if(Mouse.btng and player.anim_attack==0)then
      st = math.deg(math.atan2(Mouse.y-player.y,Mouse.x-player.x))-90
      en = st+180
      player.anim_attack=1
      player.mi=st
    end
    if(player.anim_attack==1)then
      Color(blanc)
      if(player.mi<en)then
        player.mi=player.mi+8
      else
        player.anim_attack=0
      end
      love.graphics.arc("fill",player.x+10,player.y+10,30,math.rad(player.mi),math.rad(player.mi+3),10)
    end
     --  love.graphics.arc( "fill", 200, 200, 100, 0, math.pi )
    
  end
  return player
end

