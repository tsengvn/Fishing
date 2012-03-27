require "sprite"

-- hidden status bar
display.setStatusBar (display.HiddenStatusBar)
--Constants
xcenter, ycenter = display.contentWidth*0.5,display.contentHeight*0.5



function splash()
	splashGroup = display.newGroup()
	
	local splashBG = display.newImage("graphics/fishinghero_flashing_v2.png", true)
	splashGroup:insert(splashBG)
	timer.performWithDelay(1000, levelStage )
end

function levelStage()
<<<<<<< HEAD
=======
	local sheet = sprite.newSpriteSheet("graphics/fish_sprite.png", 31, 31)
	local spriteSet = sprite.newSpriteSet(sheet, 1, 9)
	sprite.add( spriteSet, "fish", 1, 9, 200, 0 )
	
	local instance = sprite.newSprite( spriteSet )
	instance.x = xcenter
	instance.y = ycenter

	instance:prepare("fish")
	instance:play()
	
	spriteSheet:play()
	
>>>>>>> 6b36cbb6eb70695511692d454129fe48e9104758
	splashGroup:removeSelf()
	levelStageGroup = display.newGroup()
	
	local lakeBG = display.newImage("graphics/lakebg.jpg", true)
	levelStageGroup:insert(lakeBG)
	
	local fishingPoint =  display.newImage("graphics/buoy_v1.png")
	levelStageGroup:insert(fishingPoint)
	
	local levelText = display.newText("Easy", 0 , 10, "Helvetica", 26 )
	levelText.x = xcenter - levelText.width/2
	levelText:setTextColor(0,125, 255)
	levelStageGroup:insert(levelText)
<<<<<<< HEAD
	
	local sheet = sprite.newSpriteSheet("graphics/fish_sprite.png", 31, 31)
	local spriteSet = sprite.newSpriteSet(sheet, 1, 9)
	sprite.add( spriteSet, "fish", 1, 9, 800, 0 )
	
	local instance = sprite.newSprite( spriteSet )
	instance.x = xcenter
	instance.y = ycenter
	instance:scale( 2, 2 )
	instance:prepare("fish")
	instance:play()
=======
>>>>>>> 6b36cbb6eb70695511692d454129fe48e9104758
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
		print (xpos)
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
		
		if (xpos - fish.x < 0 and isRight) then
			fish:scale(-1, 1)
			isRight = false
		elseif (xpos - fish.x > 0 and not(isRight)) then
			fish:scale(-1, 1)
			isRight = true
		end
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
		native.showAlert( "Oops", "The fish run away", {"Try again"}, init)
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
	hitArea = display.newImage("graphics/bad_circle_v1.png")
	hitArea.x, hitArea.y = fish.x, fish.y
	hitArea.xScale, hitArea.yScale = .5 , .5
	
	if (x < perfectRange) then
		imageResult = display.newImage("graphics/perfect_without_circle_v1.png")
		setScore(80)
	elseif (x < greatRange) then
		imageResult = display.newImage("graphics/great_without_cricle_v1.png")
		setScore(40)
	elseif (x < goodRange) then
		imageResult = display.newImage("graphics/good_without_circle_v1.png")
		setScore(20)
	else 
		imageResult = display.newImage("graphics/bad_without_circle_v1.png")
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
	isStop = false
	isRight = true
	-- water background
	background = display.newImage("graphics/background.jpg", true)
	
	-- center screen
	xpos,ypos = xcenter, ycenter
	
	-- fish sprite
	fish = display.newImage("fish.gif", xcenter, ycenter)
	fish.myName = "fish"

	-- fish bar
	fishBar = display.newImage("graphics/fishing_bar_v1.png", true)
	fishBar.x, fishBar.y = display.contentWidth*0.5,15
	fishBar.xScale, fishBar.yScale = .3, .5
	
	-- fishScore
	fishScore = display.newImage("fish.gif", xcenter , 0)
	fishScore.xScale, fishScore.yScale = .8, .8
	
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



