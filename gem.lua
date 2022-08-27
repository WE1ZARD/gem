--[[
============================
制作/使用 法力宝石

1. 制作宝石的宏命令/代码命令 "/conjuregem" or /run ConjureGem() 
2. 使用宝石的宏命令/代码命令 "/usegem" or /run UseGem()
============================
]]

local conjure = {"魔法红宝石","魔法黄水晶","魔法翡翠","魔法玛瑙"}
local gem = {"法力红宝石","法力黄水晶","法力翡翠","法力玛瑙"}
local function checkGem(gem) 
    local f,v
    for i = 0,4 do 
        for k = 1,GetContainerNumSlots(i) do 
            v = GetContainerItemLink(i,k) or ""
            if strfind(v,gem) then f = 1 end
        end
    end
    if not f then CastSpellByName("制造"..gem) end
end

function ConjureGem()
    for _,v in ipairs (conjure) do
        checkGem(v)
    end
end

SLASH_CONJUREGEM1 = "/conjuregem"
SlashCmdList["CONJUREGEM"] = function(arg)ConjureGem()end

local function FindGem(gem)
    for b = 0,4 do 
        for s = 1,GetContainerNumSlots(b,s)do 
            local n = GetContainerItemLink(b,s)
            if n and strfind(n,gem) then 
                UseContainerItem(b,s)
            end 
        end
    end
end

function UseGem()
    for _,v in ipairs(gem) do
        FindGem(v)
    end
end

SLASH_USEGEM1 = "/usegem"
SlashCmdList["USEGEM"] = function(arg)UseGem()end
