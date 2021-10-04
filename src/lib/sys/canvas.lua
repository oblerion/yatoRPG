function Canvas(width,height) 
  if(width==nil)then width=ecran.width end
  if(height==nil)then height=ecran.height end 
  local canvas = {} 
  canvas.ca = love.graphics.newCanvas( width, height )
  canvas.set = function(func)
    canvas.ca:renderTo(func)
  end
  canvas.draw = function()
    love.graphics.draw(canvas.ca,0,0)
  end
  canvas.getImage=function()
    -- make image with canvas
    canvas.ca:newImageData():encode("png","test.png")
    --imagedata:getPixel(mx, my)
    --imagedata:setPixel(mx, my)
  end
  return canvas
end
