function player(class)
  local spd = 150
  local player=class
  player.x=0
  player.y=0
  player.textureid=1
  player.time_atk= sys.Timer()
  player.move=function(dt)
    if(love.keyboard.isDown("up"))then
      player.y=player.y-math.floor(dt*spd)
      player.textureid=3
    end
    
    if(love.keyboard.isDown("down"))then
      player.y=player.y+math.floor(dt*spd)
      player.textureid=1
    end
    
    if(love.keyboard.isDown("left"))then
      player.x=player.x-math.floor(dt*spd)
      player.textureid=2.5
    end
    
    if(love.keyboard.isDown("right"))then
      player.x=player.x+math.floor(dt*spd)
      player.textureid=2
    end
  end

  player.draw=function()
    if(player.textureid~=2.5)then
      sys.asset["persos.png"].draw(player.textureid,player.x,player.y,0,1,1)
    else
      sys.asset["persos.png"].draw(2,player.x+32,player.y,0,-1,1)
    end
    --love.graphics.rectangle("fill",player.x,player.y,12,12)
  end
  player.update_attack=function()
    if(player.time_atk.test() and sys.mouse.btng)then
      if(player.getEquip(1)~=0)then
        -- epee
        if(player.getEquip(1).name=="sword")then
          bullets.new(player.x+16,player.y+16,sys.mouse.x-2,sys.mouse.y-2,10,player.getEquip(1).effet.portee,player)
          bullets[#bullets].degat=player.getPta(1)
        end
      end
      player.time_atk.start(30)
    elseif(player.time_atk.test() and sys.mouse.btnd)then
      if(player.getEquip(2)~=0)then
        if(player.getEquip(1).name=="sword")then
          bullets.new(player.x+16,player.y+16,sys.mouse.x-2,sys.mouse.y-2,10,player.getEquip(2).effet.portee,player)
          bullets[#bullets].degat=player.getPta(2)
        end
      end
      player.time_atk.start(30)
    end
  end
  player.draw_attack=function()
    local titem
    if(sys.mouse.btng)then
      titem = player.getEquip(1)
      if(shooseAnim(titem)~=0)then
        --shooseAnim(titem).drawAnim(sys.mouse.btng,player.x+16,player.y+16)
      end
    end
    if(sys.mouse.btnd)then
      titem = player.getEquip(2)
      if(shooseAnim(titem)~=0)then
        --shooseAnim(titem).drawAnim(sys.mouse.btnd,player.x,player.y)
      end
    end
    --sheld.drawAnim(Mouse.btng,player.x,player.y)
  end
  return player
end


