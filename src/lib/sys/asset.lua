asset={font={}}
asset.new=function(table)
	function load_ext(name)
		local dir = "asset/"..name
		if(love.filesystem.getInfo(dir)~=nil)then
			if(name:find(".png") or 
			  name:find(".jpn"))then
			  asset[name] = love.graphics.newImage(dir)
			elseif(name:find(".wav"))then
			  asset[name] = love.audio.newSource(dir,"static")
			elseif(name:find(".mp3"))then
			  asset[name] = love.audio.newSource(dir,"stream")
			elseif(name:find(".ogg"))then
			  asset[name] = love.graphics.newVideo(dir)
			elseif(name:find(".ttf"))then
				local s=""
				for i=5,100,1 do
					s= name:sub(1,#dir-4)..tostring(i)
					asset.font[s]= love.graphics.newFont(dir,i)
				end
			end
        else
          print("asset.new({.."..name.."..}) -> "..dir.." not exist")
          love.event.quit()
        end
	end
	if(type(table)=="table")then
		for n,v in pairs(table)do
		  if(type(v)=="string")then
			load_ext(v)
		  elseif (type(v)=="table")then
			-- spritesheet loader {asset,tile}
			if(#v == 2 and
			  type(v[1])=="string" and 
			  type(v[2])=="number")then
			  local dir ="asset/"..v[1]
			  asset[v[1]] = {
				Quad = {},
				img = love.graphics.newImage(dir),
				w = 0,
				h = 0,
				tile = v[2]
			  }
			  asset[v[1]].w = asset[v[1]].img:getWidth()
			  asset[v[1]].h = asset[v[1]].img:getHeight()
			  for y=0,asset[v[1]].h,asset[v[1]].tile do
				for x=0,asset[v[1]].w,asset[v[1]].tile do
				  local Quad
				  Quad = love.graphics.newQuad(x,y,asset[v[1]].tile,asset[v[1]].tile,asset[v[1]].w,asset[v[1]].h)
				  asset[v[1]].Quad[#asset[v[1]].Quad+1]=Quad
				end
			  end
			  asset[v[1]].draw = function(id,px,py,rotation,scale)
				love.graphics.draw(asset[v[1]].img,asset[v[1]].Quad[id],px,py,rotation,scale,scale)
			  end
			  asset[v[1]].drawMap = function(map,px,py,rotation,scale)
				if(rotation==nil)then rotation=0 end
				if(scale==nil)then scale=1 end
				for i=1,#map do
				  for j=1,#map[i] do
					asset[v[1]].draw(map[i][j],rotation+px+j*asset[v[1]].tile,rotation+py+i*asset[v[1]].tile,rotation,scale)
				  end
				end
			  end
			end
		  else
			print("asset "..n.." "..v.." unknow")
		  end
		end
	end
end
for i=5,100 do 
	asset.font[tostring(i)]= love.graphics.newFont(i) 
end
