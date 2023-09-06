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
local bodies = {} -- string/tabela para armazenamentodos corpos
local bodiesGroup= display.newGroup ()
local joints = {} -- string /tabela para armazenamento das juntas
local staticBox = display.newRect (0, 0, 60, 60)
staticBox:setFillColor (0.2, 0.2, 1)
physics.addBody (staticBox, "static", {isSensor=true})
staticBox.x, staticBox.y = display.contentCenterX, 120

local shape = display.newRect (0, 0, 40, 100)
shape:setFillColor (1, 0.2, 0.4)
physics.addBody (shape, "dynamic")
shape.x, shape.y, shape.rotation = 100, staticBox.y-40, 0
-- Criar os grupos de exibição 
local grupoBg = display.newGroup() -- Objetos decorativos, cenario (nao tem interação)
local grupoMain = display.newGroup() -- bloco principal ( tudo que precisar interagir com o player fica nesse grupo)
local grupoUI = display.newGroup() -- Interface do usuário (placares, botões)
-- -- Criação da junta de pivô ("tipo de junta", objA, objB, ancoraX, ancoraY)
local jointPivot = physics.newJoint ("pivot", staticBox, shape, staticBox.x, staticBox.y)
jointPivot.isMotorEnabled = true -- ativa o motor de junta do pivô.
jointPivot.motorSpeed = 40 -- define a velocidade do torque do motor.
jointPivot.maxMotorTorque = 1000 -- define o valor maximo na velocidade do torque do motor, utilizado para melhor visualização do efeito.
jointPivot.isLimitEnabled = true -- Determina como ativado os limites de rotação.
jointPivot:setRotationLimits (-60, 125)
-- Criar variaveis de pontos e vidas para atribuição de valor.
local pontos = 0
local vidas = 5
-- Junta de distãncia
local staticBox = display.newRect (0, 0, 60, 60)
staticBox:setFillColor (0.2, 0.2, 1)
physics.addBody (staticBox, "static", {isSensor=true})
staticBox.x, staticBox.y = 200, 180

local shape = display.newRect (0, 0, 40, 100)
shape:setFillColor (1, 0.2, 0.4)
physics.addBody (shape, "dynamic", {bounce=1})
shape.x, shape.y = 200, 80

-- (tipo de junta, objA, objB, ancora objA.x, ancoraObj.y, ancoraObjB.x, ancoraObjB.y)
local jointDistance = physics.newJoint ("distance" , staticBox, shape, staticBox.x, staticBox.y-10, shape.x, shape.y)
jointDistance.frequency = 0.8 -- Definir os ciclos do amortecimento em hertz, quanto maior o valor mais macio
jointDistance.dampingRatio = 0.8 -- nivel de amortecimento, onde 1 é amortecimento crítico
jointDistance.lenght = staticBox.y - shape.y -- define a distãncia entre os pontos de ancoragem.

shape:applyLinearImpulse (0.3, 0, shape.x, shape.y-5)


local staticBox = display.newRect (0, 0, 60, 60)
staticBox:setFillColor (0.2,0.2, 1)
physics.addBody (staticBox, "static", {isSensor=true})
staticBox.x, staticBox.y = display.contentCenterX, 360
-- Adicionar Background
-- (grupo que a imagem vai pertenser "pasta/nome do arquivo.formato", largura, altura)
local bg = display.newImageRect (grupoBg, "imagens/sideral.png" ,728*1.6, 300*1.6)
bg.x = display.contentCenterX  -- localização horizontal
bg.y = display.contentCenterY  -- localização na vertical

-- adicionar placar na tela.
-- (grupo de exibição, "escreve o que ira aperecer na tela" localizaçãox , localizaçaoy, fonte, tamanho da fonte)
local pontosText = display.newText (grupoUI, "pontos: " .. pontos, 100, 30, native.systemFont, 20)
-- altera a cor da variável
pontosText:setFillColor (255, 251, 0)

local vidasText = display.newText (grupoUI, "vidas: " .. vidas, 200, 30, native.systemFont, 20)
vidasText:setFillColor (1, 1, 1)

-- Adicionar nave na tela
local player = display.newImageRect (grupoMain, "imagens/nave.png", 324*0.2, 324*0.3)
player.x = 160
player.y = 355
player.myName = "nave"

physics.addBody (player, "kinematic") -- colide apenas com dinamico e naõ tem interferencia da gravidade.

-- criar botões:
local botaoDireita = display.newImageRect (grupoMain,"imagens/button.png", 1280/25, 1279/25)
botaoDireita.x = 240
botaoDireita.y = 450
botaoDireita.rotation = 360 -- faz a rotação da imagem em x graus.

local botaoEsquerda = display.newImageRect (grupoMain,"imagens/button.png", 1280/25, 1279/25)
botaoEsquerda.x = 80
botaoEsquerda.y = 450
botaoEsquerda.rotation = -180

-- Adicionar funções de movimentação
local function direita ()
    player.x = player.x + 10
end

local function esquerda ()
    player.x = player.x - 10
end   

-- Adicionar um ouvinte a fução de botão.
botaoDireita:addEventListener ("tap", direita)
botaoEsquerda:addEventListener ("tap", esquerda)

-- Adicionar botão de tiro.
local botaoTiro = display.newImageRect (grupoMain, "imagens/buttonTiro.png", 360/6, 360/6)
botaoTiro.x = display.contentCenterX
botaoTiro.y = 450

-- Função para atirar:
local function atirar ()
    local tiroPlayer = display.newImageRect (grupoMain, "imagens/tiro.png", 50*0.5, 100*0.5)
    tiroPlayer.x = player.x 
    tiroPlayer.y = player.y 
    physics.addBody (tiroPlayer, "dynamic", {isSensor=true}) -- determinamos que o projétil é um sensor, o que ativa a detecção continua de colisão
    transition.to (tiroPlayer, {y=-500, time=900, -- quando a transição for completa
                    onComplete = function () display.remove (tiroPlayer) -- removemos o projétil do display.         
                     end})
    tiroPlayer.myName = "tiro"
    tiroPlayer:toBack () -- Joga o elemento pra traz dentro do grupo de exibição dele.
end                        

botaoTiro:addEventListener ("tap", atirar)

-- Adicionando inimigo:
local inimigo = display.newImageRect (grupoMain, "imagens/alien.png", 500/8, 700/15)
inimigo.x = 160
inimigo.y = 80
inimigo.myName = "alien"
physics.addBody(inimigo, "kinematic")
local direcaoInimigo = "direita"

-- Função para o inimigo atirar:
local function inimigoAtirar ()
    local tiroInimigo = display.newImageRect (grupoMain, "imagens/bomba.png", 100*0.3, 200*0.2)
    tiroInimigo.x = inimigo.x 
    tiroInimigo.y = inimigo.y 
    tiroInimigo.rotation = 180
    physics.addBody (tiroInimigo, "dynamic", {isSensor=true})  
    transition.to (tiroInimigo, {y=310, time=900,
                    onComplete = function ()
                        display.remove (tiroInimigo)
                    end})  
    tiroInimigo.myName = "bomba"                  
end 

-- Criando o timer de disparo do inimigo:
-- Comandos timer: (Tempo, repetição, função,  )
inimigo.timer = timer.performWithDelay (math.random (1000, 1500),
inimigoAtirar, 0)

-- Movimentação do inimigo:
local function movimentarInimigo ()
    -- se a localização y for igual a nulo então
        if not (inimigo.y == nil ) then
    -- quando a direção do inimigo for direita
            if (direcaoInimigo == "direita") then
                inimigo.x = inimigo.x - 1
    -- se a localização y do inimigo for menor ou igual a 50 entao
                if (inimigo.x <= 20 ) then
                -- altera a variavel para "esquerda"   
                    direcaoInimigo = "esquerda"
                end -- (if (inimigo.y.....))
        --- se a direção do inimigo for igual a esquerda então
            elseif (direcaoInimigo == "esquerda" ) then
                inimigo.x = inimigo.x + 1
        -- Se a localização y do inimigo for maior ou igual a 400 então
                if (inimigo.x>= 300 ) then
                    direcaoInimigo = "direita"
                end -- if (inimigo.x...) 
            end -- if (direcaoInimigo...)
        -- se não    
        else    
            print ("inimigo morreu")
        -- Runtime : representa todo o jogo (event é executado para todos), enterframe: está ligado ao valor de FPS do jogo ( frames por segundo), no caso, a função vai ser executada 60 vezes por segundo.
            Runtime:removeEventListener ("enterFrame" , movimentarInimigo)   
        end
    end
    
    Runtime:addEventListener ("enterFrame", movimentarInimigo)

    -- Fução de colisão:
    local function onCollision (event)
        -- quando a fase do evento for began entao:      
            if (event.phase == "began" ) then
        --  variaveis criadas para facilitar a escrita do código.
                local obj1 = event.object1
                local obj2 = event.object2
        -- quando o myName do objeto 1 for.. e o nome do objeto for....
                if ((obj1.myName == "tiro" and obj2.myName == "alien")
                or (obj1.myName == "alien" and obj2.myName == "tiro")) then
                -- se o objeto 1 for.. .
    
                    if (obj1.myName == "tiro") then
                -- e o nome do objeto 2 for..    
                        display.remove (obj1)
                    else
                        display.remove (obj2)  
                    end
                -- somar 1 pontos a cada colião 
                    pontos = pontos + 1
                    -- atualiza os pontos na tela
                    pontosText.text = "pontos: " .. pontos
                -- se o obj1 for player e o 2 for projetil do inimigo ou vixe versa
                elseif ((obj1.myName == "nave" and obj2.myName == "bomba") or (obj1.myName == "bomba" and obj2.myName == "nave")) then
                    if (obj1.myName == "bomba") then
                        
                        display.remove (obj1)
                    else
                        display.remove (obj2) 
                    end
                -- reduz uma vidado player a cada colisão    
                vidas = vidas - 1
                vidasText.text = "vidas:" .. vidas
                    if (vidas <= 0) then
                        Runtime:removeEventListener ("collision", onCollision)
                        Runtime:removeEventListener ("enterFrame", movimentarInimigo)
                        timer.pause (inimigo.timer) --Colocar sempre p nome que foi criado o timewithDelay
                        botaoDireita:removeEventListener ("tap", direita)
                        botaoEsquerda:removeEventListener ("tap", esquerda)
                        botaoTiro:removeEventListener ("tap", atirar)

                        local gameOver = display.newImageRect (grupoUI, "imagens/gameover.png", 1080/7, 1080/7)
                        gameOver.x = display.contentCenterX
                        gameOver.y = display.contentCenterY
                    end -- Fecha o if vidas
                end -- fecha o if myname
            end  -- fecha o if event.phase
        end  -- fecha a fubction  

        Runtime:addEventListener ("collision" , onCollision)
        Runtime:removeEventListener ()
                
            
            