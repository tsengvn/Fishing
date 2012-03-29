require "ui"
local grabber = require("SpriteGrabber")

-- hidden status bar
display.setStatusBar (display.HiddenStatusBar)
--Constants
xcenter, ycenter = display.contentWidth*0.5,display.contentHeight*0.5
Rad2Deg = 180.0 / math.pi;


function splash()
	splashGroup = display.newGroup()
	
	local whiteBG = display.newRect( 0 , 0 , display.contentWidth, display.contentHeight)
	--whiteBG:setFillColor(255,255,255)
	local splashBG = display.newImage("images/logo.png")
	
	--splashBG.xScale, splashBG.yScale = .8, .8
	
	--splashBG:setReferencePoint(display.BottomCenterReferencePoint)
	splashBG.x = xcenter
	
	local playBt = ui.newButton{
		default = "images/smallButton.png",
		over = "images/smallButtonOver.png",
		onRelease = gameStage,
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
		--onPress = drawNormal,
		text = "Shop",
		textColor = {255,255,255},
		size = 16,
		emboss = true,
		x = xcenter,
		y = ycenter + 120
	}
	splashGroup:insert(whiteBG)
	splashGroup:insert(playBt)
	splashGroup:insert(shopBt)
	splashGroup:insert(splashBG)
	
	--timer.performWithDelay(2000, gameStage )
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

function runFish()
		if (isStop) then
			return
		end
		luckyNo = math.random(1,20)
		
		if (luckyNo % 11 == 0) then
			rX, rY = math.random(-30, 30), math.random(-30, 30)
		elseif (luckyNo % 6 == 0) then
			rX, rY = math.random(-80, 80), math.random(-80, 80)
		elseif (luckyNo % 5 == 0) then
			rX, rY = math.random(-130, 130), math.random(-130, 130)
		else 
			rX, rY = math.random(-xcenter, xcenter), math.random(-ycenter, ycenter)
		end
		
		xpos = rX + xcenter;
        ypos = rY + ycenter;
		--print (xpos)
		--xpos = xpos + ( 2.2 * xdirection );
        -- ypos = ypos + ( 2.2 * ydirection );
		
        
		--[[
        if (xpos > display.contentWidth - 20 or xpos < 20) then
                xdirection = xdirection * -1;
        end
        if (ypos > display.contentHeight - 20 or ypos < 20) then
                ydirection = ydirection * -1;
        end
		--]]
		local angle = math.atan2(ypos - fish.y, xpos - fish.x) * Rad2Deg
		print(angle);
		
		
		if (xpos - fish.x < 0 and isRight) then
			fish:scale(1, -1)
			isRight = false
		elseif (xpos - fish.x > 0 and not(isRight)) then
			fish:scale(1, -1)
			isRight = true
		end
		
		fish.rotation = angle
		transition.to( fish, { time=500, xOrigin=xpos, yOrigin=ypos, onComplete=runFish})

        --fish:translate( xpos - fish.x, ypos - fish.y)

        -- myText.text = tostring(fish.x) .. ", " .. tostring(fish.y)
end

function score()
	if (fishScore.x < 5) then
		native.showAlert( "Congratz", "You got the fish")
		stop()
		return
	end
	nextScore = fishScore.x + 0.5
	if (nextScore > display.contentWidth ) then
		native.showAlert( "Oops", "The fish run away", {"Try again"}, gameStage)
		stop()
	else
		fishScore:translate(1,0)
		--transition.to( fishScore, { time=500, xOrigin=nextScore, yOrigin=fishScore.y, onComplete=score})
	end
end

function stop()
	isStop = true
	Runtime:removeEventListener( "enterFrame" , score)
	Runtime:removeEventListener( "touch" , onTouch)
end

function start()
	runFish()
	--score()
	Runtime:addEventListener( "touch" , onTouch)
	Runtime:addEventListener( "enterFrame" , score)
end

function onTouch( event )
	if ( event.phase == "ended" ) then
		distance = math.sqrt(math.pow(fish.x - xcenter,2) + math.pow(fish.y - ycenter, 2))
		-- myText.text = tostring(distance)
		
	    showResult(distance)
	end
end

function showResult(x)
	hitArea = display.newImage("images/bad_circle_v1.png")
	hitArea.x, hitArea.y = fish.x, fish.y
	hitArea.xScale, hitArea.yScale = .5 , .5
	
	if (x < perfectRange) then
		imageResult = display.newImage("images/perfect_without_circle_v1.png")
		setScore(80)
	elseif (x < greatRange) then
		imageResult = display.newImage("images/great_without_cricle_v1.png")
		setScore(40)
	elseif (x < goodRange) then
		imageResult = display.newImage("images/good_without_circle_v1.png")
		setScore(20)
	else 
		imageResult = display.newImage("images/bad_without_circle_v1.png")
		setScore(-30)
	end
	
	imageResult.x, imageResult.y = fish.x, fish.y
	imageResult.xScale, imageResult.yScale = .5, .5

	transition.to( hitArea, { time=500, alpha=0})
	transition.to( imageResult, { time=500, alpha=0})
end

function setScore(number)
	-- convert to coordinate, minus score
	number = -number
	fishScore:translate(number, 0)
end

function gameStage()
	
	display.remove(splashGroup)

	
	isStop = false
	isRight = true
	-- water background
	background = display.newImage("images/background.jpg", true)
	
	-- center screen
	xpos,ypos = xcenter, ycenter
	
	-- fish sprite
	--fish = display.newImage("fish.gif", xcenter, ycenter)
	--fish.myName = "fish"

	fishSprite = grabber.grabSheet("fishSprite")
	fish = fishSprite:grabSprite("very-touch",true,{swim={1,15,1000,0}})
	fish:playClip("swim")
	
	-- fish bar
	fishBar = display.newImage("images/fishing_bar_v1.png", true)
	fishBar.x, fishBar.y = display.contentWidth*0.5,15
	fishBar.xScale, fishBar.yScale = .3, .5
	
	-- fishScore
	fishScore = display.newImage("images/fish_ani_0.png", xcenter , 0)
	fishScore:scale(-1, 1)
	--fishScore.xScale, fishScore.yScale = .2, .2
	
	perfectRange, greatRange, goodRange = 30, 80, 130
	-- circle pole perfect
	circleA = display.newCircle(xcenter, ycenter, perfectRange)
	circleA:setFillColor(24,24,24)
	circleA.alpha = 0.2
	circleA.myName = "circle"

	-- circle pole great
	circleB = display.newCircle(xcenter, ycenter, greatRange)
	circleB:setFillColor(24,24,24)
	circleB.alpha = 0.2
	circleB.myName = "circle"

	-- circle pole good
	circleC = display.newCircle(xcenter, ycenter, goodRange)
	circleC.alpha = 0.2
	circleC.myName = "circle"
	
	-- score text
	-- myText = display.newText("0", 100, 10, native.systemFont, 12)
	
	isInCircle = false
	point = 0

	xdirection,ydirection = 1,1
	
	start()
end

splash()



