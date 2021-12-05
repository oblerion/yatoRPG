
function Item(pname,pdescription,ptype,passet,pteffet)
  local i={
    name=pname,
    lvl=1,
    effet={
      -- type n normal b blocage s soin
      pta_type="n",
      pta_min=0,
      pta_max=0,
      defence=0,
      mana=0,
      vitesse=0,
      portee=1,
    },
    description=pdescription,
    type=ptype, -- 1 arme 2 sort 3 armure 4 botte
    asset=passet
  }
  i.effet=table.modify(i.effet,pteffet)
  i.print=function()
    print("name",i.name)
    for n,v in pairs(i) do
      if(type(v)~="function")then
        if(n=="effet")then
          for g,h in pairs(v) do
            print(n,g,h)
          end
        elseif(n~="name")then
          print(n,v)
        end
      end
    end
  end
  table.insert(items,i)
end

createItem=function(pname,plvl)
  local i
  for j=1,#items do
    if(items[j].name==pname)then
      i=table.copy(items[j])
      i.lvl = plvl
      break
    end
  end
  if(i~={})then 
    for n,v in pairs(i.effet)do
      if(n~="pta_type" and n~="portee" and v>0)then
        if(n~="pta_max")then
          i.effet[n]=v +math.floor((v*plvl)*0.5)
        else
          i.effet[n]=v +math.floor((v*plvl)*0.8)
        end
      end
    end
    return i 
  end
  print("not find item")
  return 0
end
-- add item type
require("data/item")