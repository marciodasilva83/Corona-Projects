-- Chamar a biblioteca de física
local physics = require ("physics")
-- Iniciar o motor de física
physics.start ()
-- Definir a gravidade
physics.setGravity (0, 0)
-- definir o modo de renderização
physics.setDrawMode ("hybrid") -- Normal, hybrid, debug. 

-- Remover a barra de notificações.
display.setStatusBar (display.HiddenStatusBar)

-- Criar os grupos de exibição 
local grupoBg = display.newGroup() -- Objetos decorativos, cenario (nao tem interação)
local grupoMain = display.newGroup() -- bloco principal ( tudo que precisar interagir com o player fica nesse grupo)
local grupoUI = display.newGroup() -- Interface do usuário (placares, botões)

--Criar variaveis de pontos e vidas para atribuição de valor.
local pontos = 0
local vidas = 5

-- Adicionar Background
-- (grupo que a imagem vai pertenser "pasta/nome do arquivo.formato", largura, altura)
local bg = display.newImageRect (grupoBg, "imagens/cidade.jpg" ,728*1.6, 300*1.6)
bg.x = display.contentCenterX  -- localização horizontal
bg.y = display.contentCenterY  -- localização na vertical

-- adicionar placar na tela.
-- (grupo de exibição, "escreve o que ira aperecer na tela" localizaçãox , localizaçaoy, fonte, tamanho da fonte)
local pontosText = display.newText (grupoUI, "pontos: " .. pontos, 100, 30, native.systemFont, 20)
-- altera a cor da variável
pontosText:setFillColor (255, 251, 0)

local vidasText = display.newText (grupoUI, "vidas: " .. vidas, 200, 30, native.systemFont, 20)
vidasText:setFillColor (1, 1, 1)

-- Adicionar heroi na tela
local player = display.newImageRect (grupoMain, "imagens/cowboy.png", 324*0.3, 324*0.4)
player.x = 45
player.y = 355
player.myName = "cowboy"
local direcaoPlayer = "cima"
physics.addBody (player, "kinematic") -- colide apenas com dinamico e naõ tem interferencia da gravidade.
-- Movimentação do player:
local function movimentarPlayer()
    -- se a localização x for igual a nulo então
        if not (player.x == nil ) then
    -- quando a direção do inimigo for cima
            if (direcaoPlayer == "cima") then
                player.y = player.y - 1
    -- se a localização y do inimigo for menor ou igual a 50 entao
                if (player.y <= 50 ) then
                -- altera a variavel para "baixo"   
                    direcaoPlayer = "baixo"
                end -- (if (inimigo.y.....))
        --- se a direção do inimigo for igual a baixo então
            elseif (direcaoPlayer == "baixo" ) then
                player.y = player.y + 1
        -- Se a localização y do inimigo for maior ou igual a 400 então
                if (player.y>= 400 ) then
                    direcaoPlayer = "cima"
                end -- if (inimigo.y...) 
            end -- if (direcaoInimigo...)
        -- se não    
        else    
        print ("inimigo morreu")
        
            Runtime:removeEventListener ("enterFrame", movimentarPlayer)   
            end
        end
    
    Runtime:addEventListener ("enterFrame", movimentarPlayer)
-- criar botões:
local botaoCima = display.newImageRect (grupoMain,"imagens/button.png", 1280/25, 1279/25)
botaoCima.x = 240
botaoCima.y = 450
botaoCima.rotation = -90 -- faz a rotação da imagem em x graus.

local botaoBaixo = display.newImageRect (grupoMain,"imagens/button.png", 1280/25, 1279/25)
botaoBaixo.x = 80
botaoBaixo.y = 450
botaoBaixo.rotation = 90

-- Adicionar funções de movimentação
local function cima ()
    player.y = player.y - 10
end

local function baixo ()
    player.y = player.y + 10
end   

-- Adicionar um ouvinte a fução de botão.
botaoCima:addEventListener ("tap", cima)
botaoBaixo:addEventListener ("tap", baixo)

local audioTiro = audio.loadSound ("Audio/feitico.mp3")
-- informações de como o audio deve ser reproduzido.
local parametros = {time = 2000, fadein = 200}

-- Adicionar botão de tiro.
local botaoTiro = display.newImageRect (grupoMain, "imagens/metranca.png", 360/5, 360/5)
botaoTiro.x = display.contentCenterX
botaoTiro.y = 450

local function tocarTiro ()
    audio.play (audioTiro, parametros)
end

botaoTiro:addEventListener ("tap", tocarTiro)

-- Função para atirar:
local function atirar ()
    local tiroPlayer = display.newImageRect (grupoMain, "imagens/tiro.png", 100*0.5, 200*0.5)
    tiroPlayer.x = player.x 
    tiroPlayer.y = player.y - 35
    physics.addBody (tiroPlayer, "dynamic", {isSensor=true}) -- determinamos que o projétil é um sensor, o que ativa a detecção continua de colisão
    transition.to (tiroPlayer, {x=500, time=900, -- quando a transição for completa
                    onComplete = function () display.remove (tiroPlayer) -- removemos o projétil do display.         
                     end})
    tiroPlayer.myName = "tiro"
    tiroPlayer:toBack () -- Joga o elemento pra traz dentro do grupo de exibição dele.
end                        

botaoTiro:addEventListener ("tap", atirar)

-- Adicionando inimigo:
local inimigo = display.newImageRect (grupoMain, "imagens/enemy.png", 500/6, 700/6)
inimigo.x = 270
inimigo.y = 370
inimigo.myName = "enemy"
physics.addBody(inimigo, "kinematic")
local direcaoInimigo = "cima"

-- Movimentação do inimigo:
local function movimentarInimigo ()
    -- se a localização x for igual a nulo então
        if not (inimigo.x == nil ) then
    -- quando a direção do inimigo for cima
            if (direcaoInimigo == "cima") then
                inimigo.y = inimigo.y - 1
    -- se a localização y do inimigo for menor ou igual a 50 entao
                if (inimigo.y <= 50 ) then
                -- altera a variavel para "baixo"   
                    direcaoInimigo = "baixo"
                end -- (if (inimigo.y.....))
        --- se a direção do inimigo for igual a baixo então
            elseif (direcaoInimigo == "baixo" ) then
                inimigo.y = inimigo.y + 1
        -- Se a localização y do inimigo for maior ou igual a 400 então
                if (inimigo.y>= 400 ) then
                    direcaoInimigo = "cima"
                end -- if (inimigo.y...) 
            end -- if (direcaoInimigo...)
        -- se não    
        else    
        print ("inimigo morreu")
        -- Runtime : representa todo o jogo (event é executado para todos), enterframe: está ligado ao valor de FPS do jogo ( frames por segundo), no caso, a função vai ser executada 60 vezes por segundo.
            Runtime:removeEventListener ("enterFrame" , movimentarInimigo)   
            end
        end
    
    Runtime:addEventListener ("enterFrame", movimentarInimigo)
    
       
-- Função para o inimigo atirar:
local function inimigoAtirar ()
    local tiroInimigo = display.newImageRect (grupoMain, "imagens/tiro2.png", 100*0.5, 200*0.5)
    tiroInimigo.x = inimigo.x 
    tiroInimigo.y = inimigo.y 
    tiroInimigo.rotation = 180
    physics.addBody (tiroInimigo, "dynamic", {isSensor=true})  
    transition.to (tiroInimigo, {x=-200, time=900,
                    onComplete = function ()
                        display.remove (tiroInimigo)
                    end})  
    tiroInimigo.myName = "tiro2"                  
end    
local audioTiro = audio.loadSound ("Audio/feitico.mp3")
    -- informações de como o audio deve ser reproduzido.
    local parametros = {time = 2000, fadein = 200}
    local function tocarTiro ()
        audio.play (audioTiro, parametros)
    end 
    inimigo:addEventListener ("tap", tocarTiro)    
-- Criando o timer de disparo do inimigo:
-- Comandos timer: (Tempo, repetição, função,  )
inimigo.timer = timer.performWithDelay (math.random (1000, 1500),
inimigoAtirar, 0)

-- Fução de colisão:
    local function onCollision (event)
    -- quando a fase do evento for began entao:      
            if (event.phase == "began" ) then
    --  variaveis criadas para facilitar a escrita do código.
                local obj1 = event.object1
                local obj2 = event.object2
    -- quando o myName do objeto 1 for.. e o nome do objeto for....
                if ((obj1.myName == "tiro" and obj2.myName == "enemy")
            or (obj1.myName == "enemy" and obj2.myName == "tiro")) then
            -- se o objeto 1 for.. .

                    if (obj1.myName == "tiro") then
            -- e o nome do objeto 2 for..    
                        display.remove (obj1)
                    else
                        display.remove (obj2)  
                    end
            -- somar 10 pontos a cada colião 
                    pontos = pontos + 10
                -- atualiza os pontos na tela
                    pontosText.text = "pontos: " .. pontos
            -- se o obj1 for player e o 2 for projetil do inimigo ou vixe versa
                elseif ((obj1.myName == "cowboy" and obj2.myName == "tiro2") or (obj1.myName == "tiro2" and obj2.myName == "cowboy")) then
                    if (obj1.myName == "tiro2") then
                    
                        display.remove (obj1)
                    else
                        display.remove (obj2) 
                    end
            -- reduz uma vida do player a cada colisão    
                vidas = vidas - 1
                vidasText.text = "Vidas:" .. vidas
                    if (vidas <= 0) then
                        Runtime:removeEventListener ("collision", onCollision)
                        Runtime:removeEventListener ("enterFrame", movimentarInimigo)
                        timer.pause (inimigo.timer) --Colocar sempre p nome que foi criado o timewithDelay
                        botaoBaixo:removeEventListener ("tap", baixo)
                        botaoCima:removeEventListener ("tap", cima)
                        botaoTiro:removeEventListener ("tap", atirar)

                        local gameOver = display.newImageRect (grupoUI, "imagens/gameover.png", 1080/5, 1080/5)
                        gameOver.x = display.contentCenterX
                        gameOver.y = display.contentCenterY
                    end -- Fecha o if vidas
                end -- fecha o if myname
            end  -- fecha o if event.phase
        end  -- fecha a fubction  

        Runtime:addEventListener ("collision" , onCollision)
        Runtime:removeEventListener ()
    
            
local bgAudio = audio.loadStream ("Audio/bg.mp3")
-- reservando um canal de audio para o som de fundo
audio.reserveChannels (1)
-- Especificar o volume
audio.setVolume (0.6, {channel=1})
-- Reproduzir o audio
-- (audio a reproduzir, {canal, loopins (-1 infinito)})
audio.play (bgAudio, {channel=1, loops=-1})
 