module(..., package.seeall)

--====================================================================--
-- SCENE: LIST SCREEN - USED FOR DISPLAYING ITEM IN SHOP
--====================================================================--

--[[

 - Version: [1.0]
 - Made by: tsengvn
 - Mail: nmhien88@gmail.com

******************
 - INFORMATION
******************


--]]
local screenOffsetW, screenOffsetH = display.contentWidth -  display.viewableContentWidth, display.contentHeight - display.viewableContentHeight

new = function ()
	
	------------------
	-- Groups
	------------------
	
	local localGroup = display.newGroup()
	
	--local rodData = sourceData.getRodData()
	local background = display.newImage("images/background/BackGround_forAll.png", true)
	
	shopDataList = sourceData.getRodData()
	shopDataType = "hook"
	local myList = widget.newTableView{
		width = 320,
		height = 280,
		maskFile = "mask-320x280.png"
	}
	myList.y = 150
	
	for i=1, #shopDataList do
		local function onRowTouch( event )
			local row = event.row
			local text = row.textObj
			
			if event.phase == "press" or event.phase == "tap" then     
				row.rowColor={ 70, 70, 130, 255 }

			elseif event.phase == "swipeLeft" then
				

			elseif event.phase == "swipeRight" then
				

			elseif event.phase == "release" then
			
				-- force row re-render on next TableView update
				row.reRender = true
			end

			-- reposition text
			
		end
	
		local function onRowRender( event )
			local g = event.view
			local row = event.target
			local index = event.index
			local id = event.id
			
			local img = sprites:grabSprite(shopDataList[index].picture,true)
			g:insert(img)
			local scale = (row.height / img.height) - .3
			img.xScale = scale
			img.yScale = scale
			img:setReferencePoint( display.CenterLeftReferencePoint )
			img.x = 10
			img.y = row.height * 0.5
			local actionBt
			if settings:retrieve(shopDataType) == index then 
				actionBt = ui.newButton{
					default = "images/blue_btn.png",
					text = "Equip",
					x = row.width - 50,
					y = row.height/2,
				}
			else
				actionBt = ui.newButton{
					default = "images/yellow_btn.png",
					text = "Buy",
					x = row.width - 50,
					y = row.height/2,
				}
			end
			g:insert(actionBt)
			
			local title =  display.newText( shopDataList[index].name, 0, 0, native.systemFontBold, 14 )
			title:setTextColor(0,0,0)
			title:setReferencePoint( display.CenterLeftReferencePoint )
			title.x = img.width + 20
			title.y = 15
			g:insert(title)
			
			local goldSmallIcon = display.newImage("images/gold_icon.png", 0, 0)
			goldSmallIcon:setReferencePoint( display.CenterLeftReferencePoint )
			goldSmallIcon.xScale , goldSmallIcon.yScale = .5, .5
			goldSmallIcon.x = title.x
			goldSmallIcon.y = title.y + title.height
			g:insert(goldSmallIcon)
			
			local goldCost =  display.newText( shopDataList[index].gold, 0, 0, native.systemFontBold, 14 )
			goldCost:setTextColor(0,0,0)
			goldCost:setReferencePoint( display.CenterLeftReferencePoint )
			goldCost.x, goldCost.y = goldSmallIcon.x + 20, goldSmallIcon.y
			g:insert(goldCost)
			
			local pointSmallIcon = display.newImage("images/point_icon.png", 0, 0)
			pointSmallIcon:setReferencePoint( display.CenterLeftReferencePoint )
			pointSmallIcon.xScale , pointSmallIcon.yScale = .5, .5
			pointSmallIcon.x = goldCost.x + 30
			pointSmallIcon.y = goldSmallIcon.y
			g:insert(pointSmallIcon)
			
			local pointCost =  display.newText( shopDataList[index].point, 0, 0, native.systemFontBold, 14 )
			pointCost:setTextColor(0,0,0)
			pointCost:setReferencePoint( display.CenterLeftReferencePoint )
			pointCost.x, pointCost.y = pointSmallIcon.x + 20, pointSmallIcon.y
			g:insert(pointCost)
			
			local subtitle =  display.newText( shopDataList[index].comment, 0, 0, 130, 60, native.systemFont, 12 )
			subtitle:setReferencePoint( display.TopLeftReferencePoint )
			subtitle:setTextColor(80,80,80)
			subtitle.x, subtitle.y = goldSmallIcon.x , goldSmallIcon.y + 10

			g:insert(subtitle)
			
		end

		-- insert row into the TableView widget
		myList:insertRow{
			id = "unique-row-" .. i,
			onRender = onRowRender,
			listener = onRowTouch,
			height = 100
		}
	end
	
	
	local navBar = display.newImage("images/nav_bar_bg.png", true)
	
	navBar.x = display.contentWidth*.5
	--navBar.y = math.floor(display.screenOriginY + navBar.height*0.5)
	

	local backBtn = ui.newButton{ 
		default = "images/back_button.png", 
		--over = "images/backButton_over.png", 
		onRelease = gotoShopScreen
	}
	backBtn.x = math.floor(backBtn.width/2) + 5
	backBtn.y = navBar.height/2

	local title = display.newText ( "Shop", 0, 0, native.systemFont, 16)
	title.x = xcenter
	title.y = navBar.height/2
	
	local hookShopBt = ui.newButton{ 
		default = "images/button_2.png", 
		text = "Hook",
		x = xcenter,
		y = navBar.height + 20,
		--over = "images/backButton_over.png", 
		--onRelease = gotoShopScreen
	}
	
	local rodShopBt = ui.newButton{ 
		default = "images/button_1.png", 
		text = "Rod",
		x = hookShopBt.x - hookShopBt.width,
		y = navBar.height + 20,
		--over = "images/backButton_over.png", 
		--onRelease = gotoShopScreen
	}
	
	local baitShopBt = ui.newButton{ 
		default = "images/button_3.png", 
		text = "Bait",
		x = hookShopBt.x + hookShopBt.width,
		y = navBar.height + 20,
		--over = "images/backButton_over.png", 
		--onRelease = gotoShopScreen
	}
	
	local goldIcon = display.newImage("images/gold_icon.png", 0, hookShopBt.y + hookShopBt.height)
	goldIcon.x = xcenter - 50
	local goldCount = display.newText(settings:retrieve("gold"), 0, 0, native.systemFontBold, 20) 	 	
	goldCount.y = goldIcon.y
	goldCount.x = goldIcon.x + goldIcon.width+ 5
	goldCount:setTextColor(255,185,15)
	
	local pointIcon = display.newImage("images/point_icon.png", 0, hookShopBt.y + hookShopBt.height)
	pointIcon.x = xcenter + 10
	local poitntCount = display.newText(settings:retrieve("point"), 0, 0, native.systemFontBold, 20)
	poitntCount.y = pointIcon.y
	poitntCount.x = pointIcon.x + pointIcon.width+ 5
	poitntCount:setTextColor(0,0,255)
	
	
	localGroup:insert(background)
	localGroup:insert(myList.view)
	localGroup:insert(navBar)
	localGroup:insert(backBtn)
	--localGroup:insert(buttons)
	return localGroup
	
end
