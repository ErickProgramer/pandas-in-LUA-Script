local tables = {}

function tables.GetKeys(x)
  local keys = {}
  for k in pairs(x) do
    table.insert(keys, k)
  end
  return keys
end

function tables.GetValues(x)
  local values = {}
  for _, v in pairs(x) do
    table.insert(values, v)
  end
  return values
end

function uteis.sorted(tab, reverse)
    reverse = reverse or false
	local ordened = tab
	for detecter = 1, #ordened do
		for compare = detecter+1, #ordened do
			if ordened[detecter] > ordened[compare] then
				ordened[detecter], ordened[compare] = ordened[compare], ordened[detecter]
			end
		end
	end
    if reverse then
        local reversed ={}
        for e = #ordened, 1, -1 do
            table.insert(reversed, ordened[e])
        end
        return reversed
    end
	return ordened
end


return tables
