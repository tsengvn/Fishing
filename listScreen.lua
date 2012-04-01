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
	local myList = tableView.newList{
		data=dataList,
		default="images/listItemBg.png",
		over="images/listItemBg_over.png",
		backgroundColor={255,2552,255},
		callback = function( row )
			local g = display.newGroup()
			
			local img = sprites:grabSprite(row.picture,true)
			g:insert(img)
			img.xScale = .8
			img.yScale = .8
			img.x = math.floor(img.width*0.5+5)
			img.y = math.floor(img.height*0.5+5)
			
			local title =  display.newText( row.name, 0, 0, native.systemFontBold, 14 )
			title:setTextColor(0,0,0)
			g:insert(title)
			title.x = title.width*0.5 + img.width + 20
			title.y = 25

			local subtitle =  display.newText( row.comment, 0, 0, 200, 50, native.systemFont, 12 )
			subtitle:setTextColor(80,80,80)
			g:insert(subtitle)
			subtitle.x = subtitle.width*0.5 + img.width + 20
			subtitle.y = title.y + title.height + 20
			
			return g
		end
	}
	myList:addScrollBar()
	
	
	localGroup:insert(myList)
	local navBar = display.newImage("images/navBar.png", true)
	
	navBar.x = display.contentWidth*.5
	navBar.y = math.floor(display.screenOriginY + navBar.height*0.5)
	myList.y = navBar.height
	localGroup:insert(navBar)
	
	local backBtn = ui.newButton{ 
		default = "images/backButton.png", 
		over = "images/backButton_over.png", 
		onRelease = gotoShopScreen
	}
	backBtn.x = math.floor(backBtn.width/2) + 5
	backBtn.y = navBar.height/2

	localGroup:insert(backBtn)
	
	local title = display.newText ( "Rod", 0, 0, native.systemFont, 16)
	title.x = xcenter
	title.y = navBar.height/2
	
	return localGroup
	
end
