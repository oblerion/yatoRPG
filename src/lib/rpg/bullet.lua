bullets={}
function bullets.new(px,py,pdx,pdy,pspd,pportee,psource)
  local b
  b = {
    source=psource,
    x=px,
    y=py,
    w=5,
    h=5,
    dx=pdx,--destination x
    dy=pdy,-- destination y
    bx=px,--begin x
    by=py,--begin y
    spd=pspd,
    angle=0,
    portee=pportee,
    degat=0,
    getAngle=function()
      b.angle = math.atan2(b.dy-b.y,b.dx-b.x)
    end,
    getSpeed=function()
      b.spdx= math.cos(b.angle)
      b.spdy= math.sin(b.angle)
    end,
    getDistance=function()
      return math.abs(b.x-b.bx)+ math.abs(b.y-b.by)
    end
  }
  b.getAngle()
  b.getSpeed()
  table.insert(bullets,b)
end
function bullets.fire(class,pdx,pdy,pspd)
  bullets.new(class.x+16,class.y+16,pdx,pdy,pspd,13,class)
end
function bullets.move(dt)
  for n,v in ipairs(bullets)do 
    if(sys.gamezone.ongame(v)==true and
      v.getDistance()<v.portee*32)then
      v.x = v.x + (v.spdx*v.spd)
      v.y = v.y + (v.spdy*v.spd)
    else
      table.remove(bullets,n)
    end
  end
end
function bullets.collide(c_source,t_dist)
  for n,v in ipairs(bullets)do
    if(v.source==c_source)then
      for i,j in ipairs(t_dist)do
        if(sys.collide(j,v))then
          return n,i
        end
      end
    end
  end
  return false
end
function bullets.draw()
  sys.color.set("blanc")
  for n,v in ipairs(bullets)do
    love.graphics.rectangle("fill",v.x,v.y,v.w,v.h)
  end
end