module(..., package.seeall)

--====================================================================--
-- SCENE: GO FISHING SCREEN
--====================================================================--

--[[

 - Version: [1.0]
 - Made by: tsengvn
 - Mail: nmhien88@gmail.com

******************
 - INFORMATION
******************


--]]

function new()
	
	------------------
	-- Groups
	------------------
	
	local localGroup = display.newGroup()
	
	-- begin create screen
	local background = display.newImage("images/background/BackGround_forAll.png", true)
	
	local header = display.newImage("images/Button_MainMenu_RiverSea_River_Selected.png", true)
	local map = display.newImageRect("images/Map_MainMenu_River.png", display.contentWidth , 250)
	map:setReferencePoint(display.TopLeftReferencePoint);
	map.y = header.height
	map.x = 0
	
	localGroup:insert(background)
	localGroup:insert(header)
	localGroup:insert(map)
	-- end create screen
	
	return localGroup
	
end