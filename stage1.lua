local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
--[[ Remove balloons when touched and free up the memory they once used
function removeRect(obj)
	obj:removeSelf();
	-- Subtract a balloon for each pop
	--balloons = balloons - 1
    playerScore = playerScore + 1
    playerScoreLabel.text = "Score"
    score = playerScore
end    

    -- Allow the user to touch the rect
	function redRect1:touch(e)
		-- If time isn't up then play the game
		--if (timeLeft ~= false) then
			-- If the player is ready to play, then allow the balloons to be popped
			--if (playerReady == true) then
				--if (e.phase == "ended") then
					-- Play pop sound
					--audio.play(popEfx)
					-- Remove the balloons from screen and memory
					removeRect(self);
				--end
			--end
		--end
    end--]]
    
    --main game method
    function game()
        playerScore = 0
        local popSound = audio.loadSound( "sound/pop.mp3" )
        function removeRect1(obj)
            obj:removeSelf()
            playerScore = playerScore + 10
            scoreDisplay.text = playerScore
            --score = playerScore
        end

        function redRect1:touch(e)
            -- Play pop sound
		       audio.play(popSound)
            removeRect1(self)
        end
        ----------------------------
        function removeRect1b(obj)
            obj:removeSelf()
            playerScore = playerScore + 10
            scoreDisplay.text = playerScore
            --score = playerScore
        end

        function redRect1b:touch(e)
            -- Play pop sound
		       audio.play(popSound)
            removeRect1b(self)
        end
        ---------------------------

        function removeRect2(obj)
            obj:removeSelf()
            playerScore = playerScore + 10
            scoreDisplay.text = playerScore
            --score = playerScore
        end

        function redRect2:touch(e)
            -- Play pop sound
		       audio.play(popSound)
            removeRect2(self)
        end
        --------------------------------
        function removeRect3(obj)
            obj:removeSelf()
            playerScore = playerScore + 10
            scoreDisplay.text = playerScore
            --score = playerScore
        end

        function redRect3:touch(e)
            -- Play pop sound
		       audio.play(popSound)
            removeRect3(self)
        end
    end--end of game func



-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

   local sceneGroup = self.view
   -- Code here runs when the scene is first created but has not yet appeared on screen
   --space black background
   bg = display.newImageRect( "image/wallandplate.jpg", 400, 600 )
   bg.x = display.contentCenterX
   bg.y = display.contentCenterY

   --display player score
   scoreDisplay = display.newText("0", 160, 30, native.systemFont, 46 )
   scoreDisplay:setFillColor(1,0,0)

   --stone sprite
   stone = display.newImageRect("image/stone.png", 70, 70)
   stone.x = display.contentCenterX - 10
   stone.y = 390

   --[[egg obj
   obj1 = display.newImageRect("image/diamond-purple.png",40,40)
   obj1.x = 80
   obj1.y = 270

   obj2 = display.newImageRect("image/diamond-purple.png",40,40)
   obj2.x = 220
   obj2.y = 270--]]

   obj1 = display.newRect(80,270,40,40)
   obj1:setFillColor(0,1,0)
   obj1:setStrokeColor( 0, 0, 1 )
   obj1.strokeWidth = 3

   obj2 = display.newRect(220,270,40,40)
   obj2:setFillColor(0,1,0)
   obj2:setStrokeColor( 0, 0, 1 )
   obj2.strokeWidth = 3

   --[[obj3 = display.newRect(150,150,40,40)
   obj3:setFillColor(0,1,0)
   obj3:setStrokeColor( 0, 0, 1 )
   obj3.strokeWidth = 3--]]

   obj4 = display.newRect(150,150,30,30)
   obj4:setFillColor(0,1,0)
   obj4:setStrokeColor( 0, 0, 1 )
   obj4.strokeWidth = 3

   --border enclosures
   leftWall = display.newRect(0,420,0,490)
   rightWall = display.newRect(320,420,0,490)
   floor = display.newRect(0,420,660,0)

   --rect blocks
   redRect1 = display.newRect( 150, 240, 30, 150 )
   redRect1.strokeWidth = 3
   redRect1:setFillColor( 1,0,0 )
   redRect1:setStrokeColor( 1, 1, 0 )
   redRect1.rotation = 90

   redRect1b = display.newRect( 150, 180, 30, 150 )
   redRect1b.strokeWidth = 3
   redRect1b:setFillColor( 1,0,0 )
   redRect1b:setStrokeColor( 1, 1, 0 )
   redRect1b.rotation = 90

   redRect2 = display.newRect( 80, 360, 30, 150 )
   redRect2.strokeWidth = 3
   redRect2:setFillColor( 1,0,0 )
   redRect2:setStrokeColor( 1, 1, 0 )

   redRect3 = display.newRect( 220, 360, 30, 150 )
   redRect3.strokeWidth = 3
   redRect3:setFillColor( 1,0,0 )
   redRect3:setStrokeColor( 1, 1, 0 )

   --player sprite
   chibiGirl = display.newImageRect("image/girl-chibi.png", 70, 70)
   chibiGirl.x = display.contentCenterX - 10
   chibiGirl.y = 20

end--end of create


-- show()
function scene:show( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
       -- Code here runs when the scene is still off screen (but is about to come on screen)

   elseif ( phase == "did" ) then
       -- Code here runs when the scene is entirely on screen

        --import physics engine and activate it
       local physics = require( "physics" )
       physics.start()

       physics.addBody( chibiGirl, "dynamic")
       physics.addBody( redRect1, "dynamic" )
       physics.addBody( redRect1b, "dynamic" )
       physics.addBody( redRect2, "dynamic")
       physics.addBody( redRect3, "dynamic")
       physics.addBody( stone, "static")
       physics.addBody( obj1, "dynamic")
       physics.addBody( obj2, "dynamic")
       --physics.addBody( obj3, "dynamic")
       physics.addBody( obj4, "dynamic")
       physics.addBody(leftWall, "static")
       physics.addBody(rightWall, "static")
       physics.addBody(floor,"static")

       game()
       -- Add event listener to rect
    redRect1:addEventListener("touch", redRect1)
    redRect1b:addEventListener("touch", redRect1b)
    redRect2:addEventListener("touch", redRect2)
    redRect3:addEventListener("touch", redRect3)

   end
end--end of show


-- hide()
function scene:hide( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
       -- Code here runs when the scene is on screen (but is about to go off screen)

   elseif ( phase == "did" ) then
       -- Code here runs immediately after the scene goes entirely off screen

   end
end


-- destroy()
function scene:destroy( event )

   local sceneGroup = self.view
   -- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene