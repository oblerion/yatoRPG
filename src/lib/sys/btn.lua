Btn=function(px,py,pw,ph)
 local btn = {
	x=px,
	y=py,
	w=pw,
	h=ph
	}
	btn.ifselect=function()
		if(collide(btn,Mouse))then
			return true
		end
		return false
	end
	btn.ifpressed=function()
		if(btn.ifselect() and Mouse.btng)then
			return true
		end
		return false
	end
	btn.draw=function()
		if(btn.ifselect())then
			love.graphics.rectangle("fill",btn.x,btn.y,btn.w,btn.h)
		else
			love.graphics.rectangle("line",btn.x,btn.y,btn.w,btn.h)
		end
	end
 return btn
end

Btn_img=function(px,py,asset1,asset2)
  local btn = Btn(px,py,0,0)
  if(asset1~=nil)then
    btn.img1 = asset1
    if(asset2~=nil)then 
      btn.img2 = asset2
      btn.nbasset=2
    else 
      btn.img2 = asset1
      btn.nbasset=1
    end
    btn.w = btn.img1:getWidth()
    btn.h = btn.img1:getHeight()
    btn.draw=function()
      if(btn.ifselect())then
        if(btn.nbasset==1)then Alpha(0.7) end
        love.graphics.draw(btn.img1,btn.x,btn.y)
        if(btn.nbasset==1)then Alpha(1) end
      else
        love.graphics.draw(btn.img2,btn.x,btn.y)
      end
    end
  end
  return btn
end

Btn_text=function()
  
end
