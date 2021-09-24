require("lib/sys/asset")
require("lib/sys/btn")
require("lib/sys/color")
require("lib/sys/screen")
require("lib/sys/state")
require("lib/sys/text")
require("lib/sys/mouse")
--require("lib/sys/tiled")

function addLib(lib)
  require("lib/"..lib)
end
function Timer()
  local t={t=0}
  t.test=function()
    if(t.t==0)then 
      return true
    else
      t.t=t.t-1
    end
    return false
  end
  t.start=function(n)
    t.t=n
  end
  return t
end
function collide(a,b)
  if(a.x + a.w > b.x and
    a.x < b.x + b.w and 
    a.y + a.h > b.y and
    a.y < b.y + b.h )then 
    return true 
  else return false
  end
end
