local physics = require ("physics")
physics.start ()
physics.setGravity (0, 9,8)
physics.setDrawMode ("hybrid")

display.setStatusBar (display.HiddenStatusBar)

local baixo = display.newRect (display.contentCenterX, 460, 50, 50)
physics.addBody (baixo, "static")
baixo.myName = "chao"

local caveira = display.newImageRect ("imagem/caveira.png", 481*0.2, 518*0.2)
caveira.x = display.contentCenterX
caveira.y = display.contentCenterY
physics.addBody (caveira, {bounce=0.8, radius=48})
caveira.myName = "caveira"

local function colisaoLocal (event)
    if (event.phase == "began" ) then
        print ("Algo colidiu!")
    else
        
    end
end        

caveira:addEventListener ("collision", colisaoLocal)