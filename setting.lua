-- Kiểm tra môi trường trước
if not (isfolder and isfile and writefile and readfile and makefolder) then
    getgenv().readdata = function() return false end
    getgenv().save = function() print("❌ Save functions not available") end
    getgenv().loadsetting = function() print("❌ Load functions not available") end
    return
end

getgenv().readdata = function(foldername, filename, tabs)
    local filepath = foldername.."/"..filename..".json"
    
    if not isfolder(foldername) then
        return false
    end
    
    if not isfile(filepath) then
        return false
    end
    
    local success, data = pcall(function()
        return game:GetService("HttpService"):JSONDecode(readfile(filepath))
    end)
    
    if success then
        return data
    else
        warn("❌ Failed to decode JSON:", data)
        return false
    end
end

getgenv().save = function(foldername, filename, filecontent)
    local filepath = foldername.."/"..filename..".json"
    
    -- Đảm bảo nội dung có thể encode
    local success, encoded = pcall(function()
        return game:GetService("HttpService"):JSONEncode(filecontent)
    end)
    
    if not success then
        warn("❌ Failed to encode JSON:", encoded)
        return false
    end
    
    -- Tạo folder nếu chưa có
    if not isfolder(foldername) then
        makefolder(foldername)
    end
    
    -- Ghi file
    writefile(filepath, encoded)
    print("✅ Saved config to:", filepath)
    return true
end

getgenv().loadsetting = function(foldername, filename, tabs)
    local UIConfig = readdata(foldername, filename, tabs)
    
    if not UIConfig then
        print("📁 Creating new config file...")
        save(foldername, filename, tabs)
        return
    end
    
    -- Load từng tab
    for NameTab, TabFunc in pairs(tabs) do
        if UIConfig[NameTab] then
            for NameItem, Item in pairs(TabFunc) do
                if type(Item) == "table" and Item.Type and UIConfig[NameTab][NameItem] then
                    
                    -- Xử lý Dropdown
                    if Item.Type == "Dropdown" then
                        if UIConfig[NameTab][NameItem].Options and UIConfig[NameTab][NameItem].Value then
                            pcall(function()
                                Item:Refresh(
                                    UIConfig[NameTab][NameItem].Options,
                                    UIConfig[NameTab][NameItem].Value
                                )
                            end)
                        end
                    
                    -- Xử lý các loại khác (Toggle, Slider, TextInput)
                    elseif Item.Type ~= "Button" and Item.Type ~= "Label" and Item.Type ~= "Seperator" then
                        if UIConfig[NameTab][NameItem].Value ~= nil then
                            pcall(function()
                                Item:Set(UIConfig[NameTab][NameItem].Value)
                            end)
                        end
                    end
                    
                    -- Load settings cho item
                    if Item["Setting Item"] then
                        for SettingName, Setting in pairs(Item["Setting Item"]) do
                            if UIConfig[NameTab][NameItem]["Setting Item"] and 
                               UIConfig[NameTab][NameItem]["Setting Item"][SettingName] then
                                pcall(function()
                                    Setting:Set(UIConfig[NameTab][NameItem]["Setting Item"][SettingName].Value)
                                end)
                            end
                        end
                    end
                end
            end
        end
    end
    
    print("✅ Loaded config from:", foldername.."/"..filename..".json")
end
