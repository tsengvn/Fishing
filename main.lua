-- INITIALIZE MODULES
ui 			= require "ui"
grabber 	= require("SpriteGrabber")
sprites 	= grabber.grabSheet("sprites")
tableView 	= require("tableView")
sourceData 	= require("data")
viewController = require("viewController")

require( "ice" )
settings 	= ice:loadBox( "settings" )
director 	= require("director")
widget 		= require "widget"


-- hidden status bar
display.setStatusBar (display.HiddenStatusBar)
-- CONTANTS

xcenter, ycenter = display.contentWidth*0.5,display.contentHeight*0.5
Rad2Deg = 180.0 / math.pi;
dataList = {}

function gotoShopScreen()
	director:changeScene( "shopScreen", "flip" )
end

function gotoGameScreen()
	director:changeScene( "gameStageScreen", "flip" )
end

function gotoMainScreen()
	--mainView.remove(director.directorView)
	initMainScreen()
	tabView:insert(director.directorView)
	director:changeScene("shopScreen", "flip")
end

function gotoListScreen(data)
	dataList = data
	director:changeScene("listScreen", "fade")
end

function gotoSplashScreen()
	--mainView:insert(director.directorView)
	director:changeScene("splashScreen", "fade")
end

function levelStage()
	splashGroup:removeSelf()
	levelStageGroup = display.newGroup()
	
	local lakeBG = display.newImage("images/lakebg.jpg", true)
	levelStageGroup:insert(lakeBG)
	
	local fishingPoint =  display.newImage("images/buoy_v1.png")
	levelStageGroup:insert(fishingPoint)
	
	local levelText = display.newText("Easy", 0 , 10, "Helvetica", 26 )
	levelText.x = xcenter - levelText.width/2
	levelText:setTextColor(0,125, 255)
	levelStageGroup:insert(levelText)
end


local mainView, tabView, currentScreen, tabBar

--====================================================================--
-- MAIN FUNCTION
--====================================================================--

local main = function ()
	settings:storeIfNew("gold", 0)
	settings:storeIfNew("point", 0)
	settings:storeIfNew("hook", 1)
	settings:storeIfNew("bait", 1)
	settings:storeIfNew("rod", 1)
	
	------------------
	-- Add the group from director class
	------------------
	mainView = display.newGroup()
	gotoSplashScreen()
	timer.performWithDelay(2000, gotoMainScreen )

	--init()
	--tabView:insert(director.directorView)
	
	------------------
	-- First Screen is Splash Screen, appear with Fade Effect
	------------------
	
	--director:changeScene("shopScreen", "fade")
	
	return true
end

--====================================================================--
-- BEGIN
--====================================================================--
function initMainScreen()
	--Create a group that contains the entire screen and tab bar

	--Create a group that contains the screens beneath the tab bar
	tabView = display.newGroup()    
	mainView:insert(tabView)

	tabBar = viewController.newTabBar{
		tabs = {"", "", "", "", ""}, 
		onRelease = showScreen,
		default = {"images/tab_fishing.png", "images/tab_shop.png","images/tab_champions.png","images/tab_treasure.png","images/tab_diary.png"},
		over = {"images/tab_fishing_selected.png","images/tab_shop_selected.png","images/tab_champions_selected.png","images/tab_treasure_selected.png","images/tab_diary_selected.png"}
	}

	mainView:insert(tabBar)

	tabBar.selected()
	director:changeScene("shopScreen", "fade")
	return true
end

function showScreen(event)
        local t = event.target
        local phase = event.phase

        if phase == "ended" then 
			if t.id == 1 then
				director:changeScene("shopScreen", "fade")
			elseif t.id == 2 then
				director:changeScene("shopScreen", "fade")
			elseif t.id == 3 then
				director:changeScene("shopScreen", "fade")
			elseif t.id == 4 then
				director:changeScene("shopScreen", "fade")
			elseif t.id == 5 then
				director:changeScene("shopScreen", "fade")
			end
			tabBar.selected(t)
        end

        return true
end
main()

