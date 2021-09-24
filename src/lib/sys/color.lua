--couleur
blanc = {1,1,1,1}
rouge = {244/255,33/255,33/255,1}
brun = {220/255,134/255,48/255,1}
noir = {70/255,59/255,48/255,1}
bleue = {108/255,185/255,205/255,1}
vert = {10/255,195/255,78/255,1}
jaune = {222/255,242/255,43/255,1}
mauve = {91/255,17/255,165/255,1}
gris = {183/255,181/255,168/255,1}
orange = {233/255,199/255,26/255,1}

Color=function(r,g,b,a)
  if not(a==nil)then 
    love.graphics.setColor(r,g,b,a) 
  else
    love.graphics.setColor(r,g,b) 
  end
end

Alpha=function(alpha)
  local r,g,b,_= love.graphics.getColor()
  love.graphics.setColor(r,g,b,alpha)
end

Fill=function(r,g,b,a)
  if not(a==nil)then 
    love.graphics.setColor(r,g,b,a) 
    love.graphics.rectangle("fill",0,0,ecran.w,ecran.h)
    love.graphics.setColor(blanc) 
  else
    love.graphics.setColor(r,g,b) 
    love.graphics.rectangle("fill",0,0,ecran.w,ecran.h)
    love.graphics.setColor(blanc) 
  end
end
