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
	tabs = widget.newTabBar{
		top=430,	
		buttons=tabButtons
	}
	localGroup:insert(tabs.view)
	-- end create screen
	
	return localGroup
end

local function onBtnPress( event )
        print( "You pressed tab button: " .. event.target.id )
end

tabButtons = {
    {
        up = "images/tab_fishing.png",
        down = "images/tab_fishing_selected.png",
        width = 50,
        height = 50	,
        onPress = onBtnPress,
        selected = true
    },
    {
        up = "images/tab_shop.png",
        down = "images/tab_shop_selected.png",
        width = 32,
        height = 32,
        onPress = onBtnPress,
    },
    {
        up = "images/tab_champions.png", 
        down = "images/tab_champions_selected.png", 
        width = 32,
        height = 32,
        onPress = onBtnPress,
    },
    {
        up = "images/tab_treasure.png",
        down = "images/tab_treasure_selected.png",
        width = 32,
        height = 32,
        onPress = onBtnPress,
    },
	{
        up = "images/tab_diary.png",
        down = "images/tab_diary_selected.png",
        width = 32,
        height = 32,
        onPress = onBtnPress,
    }
}