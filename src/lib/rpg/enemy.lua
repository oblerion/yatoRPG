
function Enemy(class)
  local en = class
  en.x = 100
  en.y = 50
  en.draw=function()
    Text("E",en.x,en.y,12)
  end
  return en
end