module(..., package.seeall)

--====================================================================--
-- SCENE: SHOP SCREEN
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
	localGroup:insert(whiteBG)
	
	local rodBtn = ui.newButton{
		default = "images/smallButton.png",
		over = "images/smallButtonOver.png",
		onRelease = openRodList,
		text = "Rod",
		textColor = {255,255,255},
		size = 16,
		emboss = true,
		x = xcenter ,
		y = ycenter - 80
	}
	
	local hookBtn = ui.newButton{
		default = "images/smallButton.png",
		over = "images/smallButtonOver.png",
		onRelease = openHookList,
		text = "Hook",
		textColor = {255,255,255},
		size = 16,
		emboss = true,
		x = xcenter ,
		y = ycenter 
	}
	
	local baitBtn = ui.newButton{
		default = "images/smallButton.png",
		over = "images/smallButtonOver.png",
		--onRelease = openBaitList,
		text = "Bait",
		textColor = {255,255,255},
		size = 16,
		emboss = true,
		x = xcenter ,
		y = ycenter + 80
	}
	
	localGroup:insert(rodBtn)
	localGroup:insert(hookBtn)
	localGroup:insert(baitBtn)
	-- end create screen
	
	return localGroup
	
end

function openRodList()
	--dataList = sourceData.getRodData()
	gotoListScreen(sourceData.getRodData())
end

function openHookList()
	--dataList = sourceData.getHookData()
	gotoListScreen(sourceData.getHookData())
end

function openBaitList()
	--dataList = sourceData.getRodData()
	gotoListScreen(sourceData.getRodData())
end