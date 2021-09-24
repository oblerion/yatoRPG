function converTiled(pfile) --tiled file --> liste de block
  local list = {}
  local f = require(pfile)
  local w = f.width
  local h = f.height
  local tile = f.tilewidth
  local X = ((ecranW - (w*tile))/2)-- 2*tile
  local Y = ((ecranH - (h*tile))/2)-tile
  for n,v in pairs(f.layers[1].data)do
    if(v > 0)then
      local x=n,y
      if(y == nil)then y = 1 end
      while(x > w)do
        x = x - w
        y = y + 1
      end
      if(x <= w)then 
        local myblock = {}
        myblock.x = X+(x*tile)
        myblock.y = Y+(y*tile)
        myblock.w = tile
        myblock.h = tile
        myblock.id = v
        myblock.nb = n
        table.insert(list,myblock) 
        y = 1
      end
    end
  end
  return list
end
