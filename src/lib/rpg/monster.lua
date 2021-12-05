Monsters={}
function Monsters.new(class,px,py)
  local en = class
  en.x = px
  en.y = py
  en.w = 32
  en.h = 32
  en.draw=function()
    --Text("E",en.x,en.y,12)
    sys.color.set("blanc")
    love.graphics.rectangle("fill",en.x,en.y,32,32)
  end
  en.update_stat()
  table.insert(Monsters,en)
end
function Monsters.draw()
  for n,v in ipairs(Monsters)do
    if(v.vie<=0)then 
      table.remove(Monsters,n)
    else
      v.draw()
      GUI.mini(v,v.x,v.y)
    end
  end
end
local timer = sys.Timer()
local ltime=0
local idA=-1
function Monsters.update(j1) 
  -- fire on player
  if(timer.test() and idA>-1 and Monsters[idA]~=nil)then
      if(ltime==0)then
        ltime=love.timer.getTime()
      -- offset time before fire
      elseif(love.timer.getTime()-ltime>0.8)then
        bullets.fire(Monsters[idA],j1.x+16,j1.y+16,10)
        ltime=0
        timer.start(25)
      end
  else
    idA=Monsters.getAround(j1,60)
  end
--  for n,v in ipairs(Monsters) do
    
--  end
end
function Monsters.getAround(class,radius)
  local tmpMid= 0-1
  local tilew = 16
  for n,v in ipairs(Monsters) do
    if(math.abs((v.x+tilew)-(class.x+tilew))<=radius and 
      math.abs((v.y+tilew)-(class.y+tilew))<=radius)then
      if(#Monsters==1)then
        return n
      elseif(tmpMid==-1)then
        tmpMid=n
      elseif((math.abs((v.x+tilew)-(class.x+tilew))+math.abs((v.y+tilew)-(class.y+tilew)))<
          (math.abs((Monsters[tmpMid].x+tilew)-(class.x+tilew))+math.abs((Monsters[tmpMid].y+tilew)-(class.y+tilew))))then
          tmpMid=n
      end
    end
  end
  return tmpMid
end
