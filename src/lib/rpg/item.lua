items={}

function Effet(table)
  local ef = {}
  for n,v in pairs(table)do
    if(v=="a")then
      ef.attaque=table[n+1]
    elseif(v=="d")then
      ef.defence=table[n+1]
    elseif(v=="m")then
      ef.mana=table[n+1]
    elseif(v=="v")then
      ef.vitesse=table[n+1]
    end
  end
  return ef
end
function Item(pname,plvl,ptable_effet,pdescription,ptype)
  local i={
    name=pname,
    lvl=plvl,
    effet={},
    description=pdescription,
    type=ptype -- 1 arme 2 armure 3 botte
  }
  i.effet=ptable_effet
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
item.get=function(pname,plvl)
  for j=1,#items do
    if(items[j].name==pname and items[j].lvl==plvl)then
      return items[j]
    end
  end
  print("not find item")
  return 0
end
Item("sword",2,Effet({"a",2,"v",1}),"a sword",1)
--item.print()