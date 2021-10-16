items={}

function Effet(table)
  local ef = {}
  for n,v in pairs(table)do
    if(v=="a-")then
      ef.attaque_min=table[n+1]
    elseif(v=="a+")then
      ef.attaque_max=table[n+1]
    elseif(v=="d")then
      ef.defence=table[n+1]
    elseif(v=="m")then
      ef.mana=table[n+1]
    elseif(v=="v")then
      ef.vitesse=table[n+1]
    elseif(v=="r")then
      ef.portee=table[n+1]
    end
  end
  return ef
end
function Item(pname,plvl,ptable_effet,pdescription,ptype)
  local i={
    name=pname,
    lvl=plvl,
    effet=ptable_effet,
    description=pdescription,
    type=ptype -- 1 arme 2 sort 3 armure 4 botte
  }
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
--item.print=function()
--  for j=1,#item do
--    print("name",item[j].name)
--    for n,v in pairs(item[j]) do
--      if(n=="effet")then
--        for g,h in pairs(v) do
--          print(n,g,h)
--        end
--      elseif(n~="name")then
--        print(n,v)
--      end
--    end
--  end
--end
items.get=function(pname,plvl)
  for j=1,#items do
    if(items[j].name==pname and items[j].lvl==plvl)then
      return items[j]
    end
  end
  print("not find item")
  return 0
end
Item("sword",1,Effet({"a-",1,"a+",2,"r",1}),"a sword",1)
Item("bow",1,Effet({"ap",2}),"a bow",1)
Item("sword",2,Effet({"a-",2,"a+",3,"r",1}),"a sword",1)
Item("cure",1,Effet({"a-",-1,"a+",-2,"r",1}),"a cure",2)
--item.print()