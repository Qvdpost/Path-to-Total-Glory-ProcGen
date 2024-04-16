--     ["example_item"] = { uniqueness = 5, category = "enchanted_item", faction_set= "all" },
local items = {
}

-- see if the file exists
function file_exists(file)
    local f = io.open(file, "rb")
    if f then f:close() end
    return f ~= nil
end

-- get all lines from a file, returns an empty 
-- list/table if the file does not exist
function lines_from(file)
    if not file_exists(file) then return {} end
    local lines = {}
    for line in io.lines(file) do 
        lines[#lines + 1] = line
    end
    return lines
end

function mysplit (inputstr, sep)
    if sep == nil then
            sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            table.insert(t, str)
    end
    return t
end


-- tests the functions above
local file = 'items.txt'
local lines = lines_from(file)

-- print all line numbers and their contents
for k,v in pairs(lines) do
    local line_info = mysplit(v)
    items["pttg_ritual_"..line_info[1]] = { uniqueness = tonumber(line_info[2]), category = line_info[3], faction_set= line_info[4] }
end

function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '}\n '
    else
        if type(o) ~= 'number' then return '"'..o..'"' end
       return tostring(o)
    end
 end

-- file = io.open("item_table.txt", "w")
-- io.output(file)

-- io.write(dump(items))


-- file = io.open("item_rituals.txt", "w")
-- io.output(file)

-- for item, item_info in pairs(items) do
--     io.write("pttg_ritual_"..item.."\t"..item.."\n")
-- end

-- file = io.open("item_categories.txt", "w")
-- io.output(file)

-- for item, item_info in pairs(items) do
--     io.write("pttg_crafting_"..item_info.category.."s\t".."pttg_ritual_"..item.."\n")
-- end

file = io.open("item_prices.txt", "w")
io.output(file)
for item, item_info in pairs(items) do
    io.write(item.."\t-"..item_info.uniqueness.."\n")
end