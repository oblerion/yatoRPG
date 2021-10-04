function player(class)
  local player=class
  player.x=0
  player.y=0
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
  return player
end

