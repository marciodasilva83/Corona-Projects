--game.lua

local composer = require("composer")
local widget = require("widget")
local scene = composer.newScene()

local questions = {
    {
        question = "Quantos Objetivos de Desenvolvimento Sustentável existem?",
        choices = { "8", "10", "17" },
        correctAnswer = 3
    },
    {
        question = "Qual dos ODS está incorreto?",
        choices = { "Educação de Qualidade", "Paz e Justiça", "Lucro e Riqueza" },
        correctAnswer = 3
    },
    -- Adicione mais perguntas aqui
}

local currentQuestion = 1
local score = 0
local questionText
local choiceBoxes = {}

local function selectAnswer(event)
    local selectedButton = event.target
    if selectedButton.choice == questions[currentQuestion].correctAnswer then
        score = score + 1
        selectedButton:setFillColor(0.2, 0.8, 0.2)  -- Muda a cor da opção para verde (correta)
    else
        selectedButton:setFillColor(0.8, 0.2, 0.2)  -- Muda a cor da opção para vermelho (incorreta)
    end

    currentQuestion = currentQuestion + 1

    if currentQuestion <= #questions then
        timer.performWithDelay(1000, showQuestion) -- Chama a função showQuestion() após um atraso de 1 segundo
    else
        composer.gotoScene("result", { params = { score = score, totalQuestions = #questions } })
    end
end

local function showQuestion()
    local questionData = questions[currentQuestion]

    if questionText then
        questionText:removeSelf()
        questionText = nil
    end

    for i = 1, #choiceBoxes do
        choiceBoxes[i]:removeSelf()  -- Removemos as caixas
        choiceBoxes[i] = nil
    end
    choiceBoxes = {}

    questionText = display.newText({
        parent = scene.view,
        text = questionData.question,
        x = display.contentCenterX,
        y = display.contentCenterY - 100,
        width = display.contentWidth - 40,
        height = 0,
        font = native.systemFontBold,
        fontSize = 20,
        align = "center"
    })
    questionText:setFillColor(1, 0.3, 0.7)
    scene.view:insert(questionText)

    local yOffset = 15

    for i, choice in ipairs(questionData.choices) do
        local choiceBox = display.newRoundedRect(
            scene.view,
            display.contentCenterX,
            display.contentCenterY + yOffset,
            250,  -- Largura da caixa
            40,   -- Altura da caixa
            12    -- Raio do canto arredondado
        )
        choiceBox:setFillColor(1, 0.3, 0.7)  -- Cor da caixa (rosa escuro)
        choiceBoxes[i] = choiceBox  -- Armazenamos as caixas

        local button = widget.newButton({
            left = choiceBox.x - choiceBox.width / 2,
            top = choiceBox.y - choiceBox.height / 2,
            width = choiceBox.width,
            height = choiceBox.height,
            label = choice,
            fontSize = 18,
            onRelease = selectAnswer,
            font = native.systemFontBold
        })

        button.choice = i

        scene.view:insert(button)
        yOffset = yOffset + 50
    end
end

function scene:create(event)
    local sceneGroup = self.view

    local background = display.newImageRect(sceneGroup, "imagens/background1.png", 320*2.2, 480*2.2)
    background.x = display.contentCenterX
    background.y = 70

    local player = display.newImageRect(sceneGroup, "imagens/YaraLivro.png", 1762/25, 2902/25)
    player.x = 420
    player.y = 250

    local player1 = display.newImageRect(sceneGroup, "imagens/índio2.png", 468/8, 1225/8)
    player1.x = 30
    player1.y = 150 

    -- Chama a função showQuestion() aqui para exibir a primeira pergunta
    showQuestion()
end

function scene:show(event)
    local phase = event.phase

    if phase == "did" then
        if currentQuestion > 1 then
            timer.performWithDelay(1000, showQuestion) -- Chama a função showQuestion() após um atraso de 1 segundo
        end
    end
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)

return scene
