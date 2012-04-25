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
	
	dataList = sourceData.getRodData()
	-- local myList = tableView.newList{
		-- data=dataList,
		-- top=150,
		-- bottom=50,
		-- default="images/listItemBg.png",
		-- over="images/listItemBg_over.png",
		-- backgroundColor={255,2552,255},
		-- callback = function( row )
			-- local g = display.newGroup()
			
			-- local img = sprites:grabSprite(row.picture,true)
			-- g:insert(img)
			-- img.xScale = .8
			-- img.yScale = .8
			-- img.x = math.floor(img.width*0.5+5)
			-- img.y = math.floor(img.height*0.5+5)
			
			-- local title =  display.newText( row.name, 0, 0, native.systemFontBold, 14 )
			-- title:setTextColor(0,0,0)
			-- g:insert(title)
			-- title.x = title.width*0.5 + img.width + 20
			-- title.y = 25

			-- local subtitle =  display.newText( row.comment, 0, 0, 200, 50, native.systemFont, 12 )
			-- subtitle:setTextColor(80,80,80)
			-- g:insert(subtitle)
			-- subtitle.x = subtitle.width*0.5 + img.width + 20
			-- subtitle.y = title.y + title.height + 20
			
			-- return g
		-- end
	-- }
	-- myList:addScrollBar()
	local myList = widget.newTableView{
		width = 320,
		height = 280,
		maskFile = "mask-320x280.png"
	}
	myList.y = 150
	
	for i=1, #dataList do
		local function onRowTouch( event )
			local row = event.row
			local text = row.textObj
			
			if event.phase == "press" or event.phase == "tap" then     
				row.rowColor={ 70, 70, 130, 255 }

			elseif event.phase == "swipeLeft" then
				if text then
					text.text = "Swiped row " .. event.index .. " LEFT."
				end

			elseif event.phase == "swipeRight" then
				if text then
					text.text = "Swiped row " .. event.index .. " RIGHT."
				end

			elseif event.phase == "release" then
			
				-- force row re-render on next TableView update
				row.reRender = true
			end

			-- reposition text
			if text then
				text:setReferencePoint( display.CenterLeftReferencePoint )
				text.x = 25
				text.y = row.height * 0.5
			end
		end
	
		local function onRowRender( event )
			local g = event.view
			local row = event.target
			local index = event.index
			local id = event.id
			
			local img = sprites:grabSprite(dataList[index].picture,true)
			g:insert(img)
			local scale = (row.height / img.height) - .3
			img.xScale = scale
			img.yScale = scale
			img:setReferencePoint( display.CenterLeftReferencePoint )
			img.x = 10
			img.y = row.height * 0.5
			
			local title =  display.newText( dataList[index].name, 0, 0, native.systemFontBold, 14 )
			title:setTextColor(0,0,0)
			g:insert(title)
			title.x = title.width*0.5 + img.width + 20
			title.y = 25

			local subtitle =  display.newText( dataList[index].comment, 0, 0, 200, 50, native.systemFont, 12 )
			subtitle:setTextColor(80,80,80)
			g:insert(subtitle)
			subtitle.x = subtitle.width*0.5 + img.width + 20
			subtitle.y = title.y + title.height + 20

		end

		-- insert row into the TableView widget
		myList:insertRow{
			id = "unique-row-" .. i,
			onRender = onRowRender,
			listener = onRowTouch,
			height = 100
		}
	end
	
	
	local navBar = display.newImage("images/navBar.png", true)
	
	navBar.x = display.contentWidth*.5
	--navBar.y = math.floor(display.screenOriginY + navBar.height*0.5)
	

	local backBtn = ui.newButton{ 
		default = "images/backButton.png", 
		over = "images/backButton_over.png", 
		onRelease = gotoShopScreen
	}
	backBtn.x = math.floor(backBtn.width/2) + 5
	backBtn.y = navBar.height/2

	local title = display.newText ( "Shop", 0, 0, native.systemFont, 16)
	title.x = xcenter
	title.y = navBar.height/2
	
	local buttons = display.newImage("images/Button_G1_RodHookBait_Rod_Selected.png", 0, 50)
	buttons.x = xcenter
	
	local goldIcon = display.newImage("images/icon_gold.png", 0, 90)
	goldIcon.x = xcenter
	local goldCount = display.newText(settings:retrieve("gold"), 0, 0, native.systemFontBold, 20)
	goldCount.y = goldIcon.y
	goldCount.x = goldIcon.x + goldIcon.width+ 5
	goldCount:setTextColor(255,185,15)
	
	
	localGroup:insert(background)
	localGroup:insert(myList.view)
	localGroup:insert(navBar)
	localGroup:insert(backBtn)
	localGroup:insert(buttons)
	return localGroup
	
end
