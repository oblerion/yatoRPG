local classe = newClass()
stat_gene(classe)
local timer = Timer()
local env=""
--os.getenv(env)
--os.execute("echo "..love.system.getOS())
return {
  load=function()
  
  end,
  init=function()
	
  end,
  update=function(dt)
    if(timer.test() and love.keyboard.isDown("up"))then
      classe = newClass()
      stat_gene(classe)
      timer.start(10)
    end
  end,
  draw=function()
    print_stat(classe)
  end
}
