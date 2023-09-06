-- menu.lua

local composer = require("composer")
local widget = require("widget")
local scene = composer.newScene()

local function startGame()
    composer.gotoScene("game")
end

local function showObjectives()
    composer.gotoScene("objectives")
end

local function showDevelopers()
    composer.gotoScene("developers")
end

function scene:create(event)
    local sceneGroup = self.view

    -- Fundo do menu
    local background = display.newImageRect(sceneGroup, "imagens/menu_bg.jpeg", display.actualContentWidth, display.actualContentHeight)
    background.x = display.contentCenterX
    background.y = display.contentCenterY

    -- Título "Descobrindo as ODS"
    local titleText = display.newText({
        parent = sceneGroup,
        text = "Descobrindo as ODS!",
        x = display.contentCenterX,
        y = 50,
        font = native.systemFontBold,
        fontSize = 36
    })
    titleText:setFillColor(1, 0.3, 0.7)  -- Cor rosa

    -- Botão de Iniciar Jogo no centro da tela
    local startButton = widget.newButton({
        x = display.contentCenterX,
        y = display.contentCenterY,
        width = 200,
        height = 40,
        label = "Iniciar Jogo",
        fontSize = 18,
        font = native.systemFontBold,  -- Fonte em negrito
        shape = "roundedRect",
        cornerRadius = 12,
        labelColor = { default={1, 1, 1}, over={1, 1, 1} },  -- Letras brancas
        fillColor = { default={1, 0.3, 0.7}, over={0.8, 0.5, 0.7} },
        onRelease = startGame
    })
    sceneGroup:insert(startButton)

    -- Botão de Objetivos centralizado abaixo do botão Iniciar Jogo
    local objectivesButton = widget.newButton({
        x = display.contentCenterX,
        y = startButton.y + 60,
        width = 200,
        height = 40,
        label = "Objetivos",
        fontSize = 16,
        font = native.systemFontBold,  -- Fonte em negrito
        shape = "roundedRect",
        cornerRadius = 12,
        labelColor = { default={1, 1, 1}, over={1, 1, 1} },  -- Letras brancas
        fillColor = { default={1, 0.3, 0.7}, over={0.8, 0.5, 0.7} },
        onRelease = showObjectives
    })
    sceneGroup:insert(objectivesButton)

    -- Botão de Desenvolvedores centralizado abaixo do botão Objetivos
    local developersButton = widget.newButton({
        x = display.contentCenterX,
        y = objectivesButton.y + 60,
        width = 200,
        height = 40,
        label = "Desenvolvedores",
        fontSize = 16,
        font = native.systemFontBold,  -- Fonte em negrito
        shape = "roundedRect",
        cornerRadius = 12,
        labelColor = { default={1, 1, 1}, over={1, 1, 1} },  -- Letras brancas
        fillColor = { default={1, 0.3, 0.7}, over={0.8, 0.5, 0.7} },
        onRelease = showDevelopers
    })
    sceneGroup:insert(developersButton)
end

scene:addEventListener("create", scene)

return scene
