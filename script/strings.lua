local str = {}

--@param s       string
--@param spaces  integer
--@param concat? string
function str.left(s, spaces, concat)
  concat = concat or ' '
  local align = #s - spaces
  if align < 0 then align = align * -1 end
  
  local st = ''
  for _ = 1, spaces do
    st = st .. concat
  end
  return st..s
end

--@param s       string
--@param spaces  integer
--@param concat? string
function str.right(s, spaces, concat)
  concat = concat or ' '
  local align = #s - spaces
  if align < 0 then align = align * -1 end
  
  local st = ''
  for _ = 1, spaces do
    st = st .. concat
  end
  return s..st
end

return str
