-- desenvolvedores.lua

local composer = require("composer")
local scene = composer.newScene()

function scene:create(event)
    local sceneGroup = self.view

    local background = display.newImageRect(sceneGroup, "imagens/menu_bg.jpeg", display.actualContentWidth, display.actualContentHeight)
    background.x = display.contentCenterX
    background.y = display.contentCenterY

    local titleTextOptions = {
        parent = sceneGroup,
        text = "Desenvolvedores",
        x = display.contentCenterX,
        y = 50,
        font = native.systemFontBold,
        fontSize = 28,
        align = "center"
    }

    local titleText = display.newText(titleTextOptions)
    titleText:setFillColor(1, 0.3, 0.7)  -- Cor rosa

    local developersTextOptions = {
        parent = sceneGroup,
        text = "Equipe de Desenvolvimento:\n\n- Dione de Candia\n- Juliana Machado de Oliveira Mendes \n- Marcio Fernando da Silva\n",
        x = display.contentCenterX,
        y = display.contentCenterY,
        width = display.actualContentWidth - 100,
        font = native.systemFontBold,
        fontSize = 18,
        align = "center"
    }

    local developersText = display.newText(developersTextOptions)
    developersText:setFillColor(0.2, 0.5, 0.8)  -- Cor azul

    sceneGroup:insert(titleText)
    sceneGroup:insert(developersText)
end

scene:addEventListener("create", scene)

return scene