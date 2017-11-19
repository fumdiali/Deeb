local composer = require( "composer" )

local scene = composer.newScene()

local function stageOne()
   composer.gotoScene( "stage1", { time=800, effect="crossFade" } )
end

local function aboutGame()
   composer.gotoScene( "about" )
end

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

   local sceneGroup = self.view
   -- Code here runs when the scene is first created but has not yet appeared on screen
   local background = display.newImageRect( sceneGroup, "image/spaceblack.png", 400, 600 )
   background.x = display.contentCenterX
   background.y = display.contentCenterY

   local gameImage = display.newImageRect(sceneGroup,"image/girl-chibi.png",270,270)
   gameImage.x = display.contentCenterX
   gameImage.y = 220
   

   local gameTitle = display.newText( sceneGroup,"Deeb Chibi", 100, 200, native.systemFont, 46 )
   gameTitle:setFillColor( 1, 0, 0 )
   gameTitle.x = display.contentCenterX
   gameTitle.y = 50


   local playButton = display.newText( sceneGroup, "Play", display.contentCenterX, 390, native.systemFont, 26 )
   playButton:setFillColor( 0.77,1.5,0.3 )

   local aboutButton = display.newText( sceneGroup, "About", display.contentCenterX, 420, native.systemFont, 26 )
   aboutButton:setFillColor( 0.77,1.5,0.3 )

   local gigabyt = display.newText( sceneGroup,"Built by gigabyt 2017", 100, 200, native.systemFont, 15 )
   gigabyt:setFillColor( 1, 0, 0 )
   gigabyt.x = display.contentCenterX
   gigabyt.y = 470


   playButton:addEventListener( "tap", stageOne )
   aboutButton:addEventListener( "tap", aboutGame )

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