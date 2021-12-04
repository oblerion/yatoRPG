
sys={}
sys.filesystem=require("lib/sys/filesystem")
for _,v in pairs(sys.filesystem.getAll("lib/sys")) do
  sys[v:sub(0,v:len()-4)] = require("lib/sys/"..v:sub(0,v:len()-4))
end

---- asset.new({}) -> load asset
--sys.add("asset")
---- string.find(str,atSearch) -> pos or -1
--sys.add("string")
---- btn.simple(x,y,w,h)
---- btn.img(x,y,img1,img2)
---- btn.text() //
---- [btn].ifpressed() -> true/false 
---- [btn].ifselect() -> true/false
--sys.add("btn")
---- color.set() -> set color
---- color["name"] -> color
--sys.add("color")
---- ecran.w / h -> wight / height screen
--sys.add("ecran")
---- state.new(file)
---- state.get()
---- state.set(state)
--sys.add("state")
---- text(string,x,y,pfont,scale)
--sys.add("text")
--sys.add("mouse")
---- canvas(w,h) -> canvas object
---- [canvas object].set(func)
---- [canvas object].draw()
--sys.add("canvas")
--sys.add("map")
--sys.add("filesystem")
--sys.add("gamezone")

sys.Timer=function()
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
sys.collide=function(a,b)
  if(a.x + a.w > b.x and
    a.x < b.x + b.w and 
    a.y + a.h > b.y and
    a.y < b.y + b.h )then 
    return true 
  else return false
  end
end
function table.copy(t)
  local meta
  local target={}
  if type(t)=="table" then
    meta = getmetatable(t)
    for n,v in pairs(t)do
      if type(v)=="table" then
        target[n]=table.copy(v)
      else
        target[n]=v
      end
    end
    setmetatable(target,meta)
    return target
  end
  return -1
end
function table.modify(t,s)
  local meta
  local target={}
  if type(t)=="table" and type(s)=="table" then
    meta = getmetatable(t)
    target = table.copy(t)
    for n,v in pairs(s)do
        target[n]=v
    end
    setmetatable(target,meta)
    return target
  end
  return -1
end
----------------------MAIN------------------
function love.run()
	--if love.load then love.load(love.arg.parseGameArguments(arg), arg) end
	-- We don't want the first frame's dt to include time taken by love.load.
	if love.timer then love.timer.step() end

	local dt = 0
  local running=1
	-- Main loop time.
	while(running==1)do
    -- Process events.
		if love.event then
			love.event.pump()
			for name, a,b,c,d,e,f in love.event.poll() do
				if name == "quit" then
					if not love.quit or not love.quit() then
						--return a or 0
            running=0
					end
				end
				love.handlers[name](a,b,c,d,e,f)
			end
		end

		-- Update dt, as we'll be passing it to update
		if love.timer then dt = love.timer.step() end

		-- Call update and draw
		--if love.update then love.update(dt) end -- will pass 0 if love.timer is disabled
    if(love.keyboard.isDown("f5"))then 
      love.event.quit() 
    end
    sys.mouse.update(dt)
    if(sys.state.get().update)then 
      sys.state.get().update(dt) 
    end
    
		if love.graphics and love.graphics.isActive() then
			love.graphics.origin()
      love.graphics.clear(love.graphics.getBackgroundColor())
      if(sys.state.get().draw)then sys.state.get().draw() end
      love.graphics.present()
		end

		if love.timer then love.timer.sleep(0,0167) end
	end
end