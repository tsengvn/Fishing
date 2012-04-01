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
	local whiteBG = display.newRect( 0 , 0 , display.contentWidth, display.contentHeight)
	--whiteBG:setFillColor(255,255,255)
	local splashBG = display.newImage("images/logo.png")
	
	--splashBG.xScale, splashBG.yScale = .8, .8
	
	--splashBG:setReferencePoint(display.BottomCenterReferencePoint)
	splashBG.x = xcenter
	
	local playBt = ui.newButton{
		default = "images/smallButton.png",
		over = "images/smallButtonOver.png",
		onRelease = gotoGameScreen,
		text = "Play",
		textColor = {255,255,255},
		size = 16,
		emboss = true,
		x = xcenter,
		y = ycenter + 50
	}
	
	local shopBt = ui.newButton{
		default = "images/smallButton.png",
		over = "images/smallButtonOver.png",
		onRelease = gotoShopScreen,
		text = "Shop",
		textColor = {255,255,255},
		size = 16,
		emboss = true,
		x = xcenter,
		y = ycenter + 120
	}
	localGroup:insert(whiteBG)
	localGroup:insert(playBt)
	localGroup:insert(shopBt)
	localGroup:insert(splashBG)
	
	-- end create screen
	
	return localGroup
	
end