-- INITIALIZE MODULES
ui 			= require "ui"
grabber 	= require("SpriteGrabber")
sprites 	= grabber.grabSheet("sprites")
tableView 	= require("tableView")
sourceData 	= require("data")

require( "ice" )
settings 	= ice:loadBox( "settings" )
director 	= require("director")


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
	director:changeScene("splashScreen", "flip")
end

function gotoListScreen(data)
	dataList = data
	director:changeScene("listScreen", "fade")
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



local mainGroup = display.newGroup()

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
	
	mainGroup:insert(director.directorView)
	
	------------------
	-- First Screen is Splash Screen, appear with Fade Effect
	------------------
	
	director:changeScene("splashScreen", "fade")
	
	return true
end

--====================================================================--
-- BEGIN
--====================================================================--

main()

