-- result.lua

local composer = require("composer")
local scene = composer.newScene()

function scene:create(event)
    local sceneGroup = self.view

    local params = event.params
    local score = params and params.score or 0
    local totalQuestions = params and params.totalQuestions or 0

    -- Adicionar uma imagem de fundo
    local background = display.newImageRect(sceneGroup, "imagens/resultad.jpeg", display.actualContentWidth, display.actualContentHeight)
    background.x = display.contentCenterX
    background.y = display.contentCenterY

    local resultText = display.newText({
        parent = sceneGroup,
        text = "Fim do jogo! Sua pontuação é " .. score .. "/" .. totalQuestions,
        x = 165,
        y = display.contentCenterY,
        width = display.contentWidth - 50,
        height = 0,
        font = native.systemFontBold,
        fontSize = 30,
        align = "center"
    })
    resultText:setFillColor(1, 0.3, 0.5)
end

scene:addEventListener("create", scene)

return scene


