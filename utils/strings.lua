local floor = math.floor

local str = {}

--align your string to left in `spaces' containing `concat`
--@param s       string
--@param spaces  integer
--@param concat? string
function str.left(s, spaces, concat)
  if #s < spaces then return s end
  concat = concat or ' '
  
  local align = #s - spaces
  if align < 0 then align = align * -1 end

  local st = ''
  for _ = 1, spaces do
    st = st .. concat
  end
  return st..s
end

--align your string to right in `spaces' containing `concat`
--@param s       string
--@param spaces  integer
--@param concat? string
function str.right(s, spaces, concat)
  if #s < spaces then return s end
  concat = concat or ' '
  
  local align = #s - spaces
  if align < 0 then align = align * -1 end

  local st = ''
  for _ = 1, spaces do
    st = st .. concat
  end
  return s..st
end

--align your string to center in `spaces' containing `concat`
--@param s      string
--@param spaces integer
--@param concat string
function str.center(s, spaces, concat)
  if #s < spaces then return s end
  concat = concat or ' '
  local align = #s - spaces
  if align < 0 then align = align * -1 end
  
  local right, left = '', ''
  for concats = 1, align do
    if concats <= align // 2 then
      right = right .. concat
    else
      left = left .. concat
    end
  end
  return left..s..right
end


--splits your string into multiple pieces according to `sep` parameter
--@param s   string
--@param sep string
function str.split(s, sep)
    s = s .. tostring(sep)
    local st = ''
    local get = {}
    for v=1, #s do
        local sub = string.sub(s, v, v+#tostring(sep)-1)
        if sub ~= sep  then
            st = st .. string.sub(s, v, v)
        else
            if string.sub(st, 1, #sep-1) == string.sub(sep, 2, #sep) then
                table.insert(get, string.sub(st, #sep, #st))
            else
                table.insert(get, st)
            end
            st = ''
        end
    end
    return get
end

--concatenates your strings with '\n' dynamically
--@param ... string
--@return    string
function str.dinamic_concat(...)
    local tab = {...}
    ---@diagnostic disable-next-line
    for str = 1, #tab do tab[str] = str.split(tab[str], '\n') end
    local string = ''
    for cont = 1, #tab[1] do
        for init = #tab, 1, -1 do
            string = string .. tostring(tab[init][cont])
        end
        string = string .. '\n'
    end
    return string:gsub('nil', '')
end

--return a copy string concatenated with `sep`
--@param s   string
--@param sep string
function str.seps_with(s, sep)
  local concatenated = ''
  for part = 1, #s do
    concatenated = concatenated .. sep
  end
  return concatenated:sub(1, #concatenated-#sep) --ignore the last unnecessary separator
end


return str
