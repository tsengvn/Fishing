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
	local pic = display.newImageRect("images/Pic_S1.png", display.contentWidth , 250)
	pic:setReferencePoint(display.TopLeftReferencePoint);
	pic.y = header.height
	pic.x = 0
	
	local buttonRiver = display.newImageRect("images/Button_S1_RiverFishingGears.png", 100 , 50)
	buttonRiver:setReferencePoint(display.TopLeftReferencePoint);
	buttonRiver.x = display.contentWidth - 120
	buttonRiver.y = 83
	buttonRiver.id = 1
	
	local buttonSea = display.newImageRect("images/Button_S1_SeaFishingGears.png", 100 , 50)
	buttonSea:setReferencePoint(display.TopLeftReferencePoint);
	buttonSea.x = display.contentWidth - 120
	buttonSea.y = buttonRiver.y + buttonRiver.height + 15
	buttonSea.id = 2
	
	local buttonTicket = display.newImageRect("images/Button_S1_Tickets.png", 100 , 50)
	buttonTicket:setReferencePoint(display.TopLeftReferencePoint);
	buttonTicket.x = display.contentWidth - 120
	buttonTicket.y = buttonSea.y + buttonSea.height + 15
	buttonTicket.id = 3

	
	local function clickButton(event)
		if ( event.phase == "began" ) then
			
		elseif ( event.phase == "ended") then
			print("clickButton " .. event.target.id)
			gotoShopListEquipmentScreen()
		end
	end
	buttonRiver:addEventListener("touch", clickButton)
	buttonSea:addEventListener("touch", clickButton)
	buttonTicket:addEventListener("touch", clickButton)
	
	localGroup:insert(background)
	localGroup:insert(header)
	localGroup:insert(pic)
	localGroup:insert(buttonRiver)
	localGroup:insert(buttonSea)
	localGroup:insert(buttonTicket)

	-- end create screen
	
	return localGroup
	
end

