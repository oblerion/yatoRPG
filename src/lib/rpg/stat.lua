stat={
  print=function(class)
    Text("magie: "..class.stat.magie.."\nforce: "..class.stat.force..
    "\nvie: "..class.stat.vie.."\nchance: "..class.stat.chance,12,24)
  end,
  generator=function(class)
    math.randomseed(love.timer.getTime())
    local rdm = math.random(1,10)
    local maxstat=0
    local medstat=0
    local minstat=0
    local gain=1
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
    maxstat= math.random(1,4)
    minstat= math.random(1,4)
    medstat= math.random(1,4)
    while(maxstat==minstat)do
      minstat= math.random(1,4)
    end
    while(medstat==minstat or medstat==maxstat)do
      medstat= math.random(1,4)
    end
    while(pts>0)do
      rdm = math.random(1,4)
      if(rdm==maxstat)then gain=3
      elseif(rdm==medstat)then gain=2
      elseif(rdm==minstat)then gain=0 --;pts=pts+1
      else gain=1
      end
      
      if(pts>=gain)then
        if(rdm==1)then
          class.stat.magie=class.stat.magie+gain
          pts=pts-gain
        elseif(rdm==2)then
          class.stat.force=class.stat.force+gain
          pts=pts-gain
        elseif(rdm==3)then
            class.stat.vie=class.stat.vie+gain
            pts=pts-gain
        else
            class.stat.chance=class.stat.chance+gain
            pts=pts-gain
        end
      end
    end
  end
}