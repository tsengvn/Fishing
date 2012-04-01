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
	
	local pointText = display.newText("Point: ", 0, 10, native.systemFont, 16)
	pointText.text = "Point: " .. settings:retrieve("gold")
	pointText:setTextColor(0,0,0)
	pointText.x = xcenter
	localGroup:insert(pointText)
	
	local rodText = display.newText("Point: ", 0, 30, native.systemFont, 14)
	rodText.text = "Rod: " .. sourceData.getRodData()[settings:retrieve("rod")].name
	rodText:setTextColor(0,0,0)
	rodText.x = xcenter
	localGroup:insert(rodText)
	
	local hookText = display.newText("Hook: ", 0, 50, native.systemFont, 14)
	hookText.text = "Hook: " .. sourceData.getHookData()[settings:retrieve("hook")].name
	hookText:setTextColor(0,0,0)
	hookText.x = xcenter
	localGroup:insert(hookText)
	
	local baitText = display.newText("Point: ", 0, 70, native.systemFont, 14)
	baitText.text = "Bait: " .. sourceData.getBaitData()[settings:retrieve("bait")].name
	baitText:setTextColor(0,0,0)
	baitText.x = xcenter
	localGroup:insert(baitText)
	
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