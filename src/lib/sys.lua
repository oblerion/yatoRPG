local add=function(c)
  local path = "lib/sys/"
  for _,v in pairs(c) do
    require(path..v)
  end
end
add({"asset","btn","color","screen","state","text","mouse","canvas"})
--require("lib/sys/tiled")

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

----------------------MAIN------------------
function love.run()
	--if love.load then love.load(love.arg.parseGameArguments(arg), arg) end
  for _,v in pairs(state.list)do
    if not(v.load ==nil)then v.load() end
	end
	-- We don't want the first frame's dt to include time taken by love.load.
	if love.timer then love.timer.step() end

	local dt = 0
  local running=1
	-- Main loop time.
	--return function()
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
    Mouse.update()
    if(state.get().update)then 
      state.get().update(dt) 
    end
    
		if love.graphics and love.graphics.isActive() then
			love.graphics.origin()
      love.graphics.clear(love.graphics.getBackgroundColor())
      if(state.get().draw)then state.get().draw() end
      love.graphics.present()
		end

		if love.timer then love.timer.sleep(0,0167) end
	end
end
