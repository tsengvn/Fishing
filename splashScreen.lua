module(..., package.seeall)

--====================================================================--
-- SCENE: SPLASH SCREEN
--====================================================================--

--[[

 - Version: [1.0]
 - Made by: tsengvn
 - Mail: nmhien88@gmail.com

******************
 - INFORMATION
******************


--]]

new = function ()
	
	------------------
	-- Groups
	------------------
	
	local localGroup = display.newGroup()
	
	-- begin create screen
	local splashBG = display.newImage("images/background/starting_screen.png")
	
	--splashBG.xScale, splashBG.yScale = .8, .8
	
	--splashBG:setReferencePoint(display.BottomCenterReferencePoint)
	splashBG.x = xcenter
	
	localGroup:insert(splashBG)
	
	-- end create screen
	
	return localGroup
	
end