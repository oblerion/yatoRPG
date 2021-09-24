Text=function(string,x,y,pfont,scale)
  if(pfont==nil and scale ==nil)then
    love.graphics.print(string,x,y,0)
  elseif(type(pfont)=="number" and scale==nil)then
    love.graphics.print(string,asset.font[tostring(pfont)],x,y,0)
  elseif(type(pfont)=="string" and type(scale)=="number" and
    not asset.font[pfont..tostring(scale)]==nil)then
    love.graphics.print(string,asset.font[pfont..tostring(scale)],x,y)
  else 
    print("error to Text()")
  end
  love.graphics.setColor(1,1,1,1)
end
