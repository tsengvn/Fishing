module(..., package.seeall)

--====================================================================--
-- SCENE: TAB SCREEN
--====================================================================--

--[[

 - Version: [1.0]
 - Made by: tsengvn
 - Mail: nmhien88@gmail.com

******************
 - INFORMATION
******************


--]]
--mainView, tabView, currentScreen, tabBar

new = function ()
	
	------------------
	-- Groups
	------------------
	
	local localGroup = display.newGroup()
	
	-- begin create screen
	-- tabs = widget.newTabBar{
	-- 		top=430,	
	-- 		buttons=tabButtons
	-- 	}
	
	init()
	
	--localGroup:insert(mainView)
	-- end create screen
	
	return mainView
end

function init()
	--Create a group that contains the entire screen and tab bar
	mainView = display.newGroup()   

	--Create a group that contains the screens beneath the tab bar
	tabView = display.newGroup()    
	mainView:insert(tabView)

	loadScreen("shopScreen")

	tabBar = viewController.newTabBar{
		tabs = {"", "", "", "", ""}, 
		onRelease = showScreen,
		default = {"images/tab_fishing.png", "images/tab_shop.png","images/tab_champions.png","images/tab_treasure.png","images/tab_diary.png"},
		over = {"images/tab_fishing_selected.png","images/tab_shop_selected.png","images/tab_champions_selected.png","images/tab_treasure_selected.png","images/tab_diary_selected.png"}
	}

	mainView:insert(tabBar)

	tabBar.selected()

	return true
end

function loadScreen(newScreen)
        if currentScreen then
        	currentScreen:cleanUp()
        end
        currentScreen = require(newScreen).new()
        tabView:insert(currentScreen)

        return true
end

function showScreen(event)
        local t = event.target
        local phase = event.phase
		print ("id " .. t.id)
        if phase == "ended" then 
			if t.id == 1 then
				loadScreen("shopScreen")
			elseif t.id == 2 then
				loadScreen("shopScreen")
			elseif t.id == 3 then
				loadScreen("shopScreen")
			elseif t.id == 4 then
				loadScreen("shopScreen")
			elseif t.id == 5 then
				loadScreen("shopScreen")
			end
			tabBar.selected(t)
        end

        return true
end

-- local function onBtnPress( event )
--         print( "You pressed tab button: " .. event.target.id )
-- end
-- 
-- tabButtons = {
--     {
--         up = "images/tab_fishing.png",
--         down = "images/tab_fishing_selected.png",
--         width = 50,
--         height = 50	,
--         onPress = onBtnPress,
--         selected = true
--     },
--     {
--         up = "images/tab_shop.png",
--         down = "images/tab_shop_selected.png",
--         width = 32,
--         height = 32,
--         onPress = onBtnPress,
--     },
--     {
--         up = "images/tab_champions.png", 
--         down = "images/tab_champions_selected.png", 
--         width = 32,
--         height = 32,
--         onPress = onBtnPress,
--     },
--     {
--         up = "images/tab_treasure.png",
--         down = "images/tab_treasure_selected.png",
--         width = 32,
--         height = 32,
--         onPress = onBtnPress,
--     },
-- 	{
--         up = "images/tab_diary.png",
--         down = "images/tab_diary_selected.png",
--         width = 32,
--         height = 32,
--         onPress = onBtnPress,
--     }
-- }