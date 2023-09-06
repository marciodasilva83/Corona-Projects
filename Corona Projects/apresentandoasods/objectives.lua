-- objectives.lua

local composer = require("composer")
local scene = composer.newScene()

function scene:create(event)
    local sceneGroup = self.view

    local background = display.newImageRect(sceneGroup, "imagens/menu_bg.jpeg", display.actualContentWidth, display.actualContentHeight)
    background.x = display.contentCenterX
    background.y = display.contentCenterY

    local objetivoTextOptions = {
        parent = sceneGroup,
        text = "Bem-vindo ao Jogo dos (ODS)! \n         Este é um jogo educativo projetado para ajudá-lo a aprender mais sobre os 17 ODS definidos pela ONU \n para um desenvolvimento sustentável. \n   Explore e divirta-se enquanto aprende sobre questões importantes para o nosso planeta e sociedade.",
        x = display.contentCenterX,
        y = display.contentCenterY,
        width = display.actualContentWidth - 100, -- Ajuste o valor conforme necessário
        font = native.systemFontBold,  -- Fonte em negrito
        fontSize = 19,
        align = "center"
    }

    local objetivoText = display.newText(objetivoTextOptions)
    objetivoText:setFillColor(1, 0.3, 0.7)  -- Cor rosa
    sceneGroup:insert(objetivoText)
end

scene:addEventListener("create", scene)

return scene