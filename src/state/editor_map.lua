
local gui_palet
local gui_map
local lcolor={"bleue","vert","rouge","brun","jaune","mauve"}
local palet_max = #lcolor

local curseur = {
  id=0
}
local map = sys.map.new(8,2)

gui_palet = function(x,y)
  local lbtn_palet = sys.btn.simple(x+16,y+16,palet_max*16,32)
  
  sys.color.set("blanc")
  love.graphics.rectangle("line",x,y+2,200,500)
  -- palette update
  if(lbtn_palet.ifpressed()==true)then
    curseur.id = math.floor((sys.mouse.x-x)/16)
  end
  -- palette
  for i=1,palet_max do
    sys.color.set(lcolor[i])
    love.graphics.rectangle("fill",x+i*16,y+16,16,16)
  end
end


gui_map=function(x,y,pmap)
  local lbtn_map = sys.btn.simple(x,y,(pmap.w+1)*16,pmap.h*16)
  -- map update
  if(lbtn_map.ifpressed()==true)then
    pmap.setid(math.floor((sys.mouse.x-x)/16),math.floor((sys.mouse.y-y)/16)+1,curseur.id)
  end
  -- map draw
  for i=1,pmap.h do
    for j=1,pmap.w do
    if(pmap.getid(j,i) > 0)then
      sys.color.set(lcolor[pmap.getid(j,i)])
      love.graphics.rectangle("fill",x+j*16,y+(i-1)*16,16,16)
    end
    sys.color.set("blanc")
    love.graphics.rectangle("line",x+j*16,y+(i-1)*16,16,16)
    end
  end
end
local timer = sys.Timer()
return {
  load=function()

  end,
  init=function()
  end,
  update=function(dt)
    if(timer.test() and love.keyboard.isDown("a"))then
      map.save("./map/map.txt")
      timer.start(20)
    end
    if(timer.test() and --love.keyboard.isDown("z"))then
      --if(
        sys.filesystem.filedropped()~= nil)then
        map.readsave(sys.filesystem.filedropped():getFilename())
      --end
      timer.start(20)
    end
  end,
  draw=function()
    gui_palet(600,20)
    gui_map(0,0,map)
  end
}