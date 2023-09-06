-- Adicionar nova imagem a tela:
-- Comandos: disply.newImageRect ("pasta/arquivo.formato", largura, altura)
local bg = display.newImageRect ("imagens/bg.jpg" , 1280*1.30, 720*1.20)
-- Definir localização do objeto.
-- Comando: variavel.linha que vou definir = localização na linha.
bg.x = display.contentCenterX -- Comando que centraliza a variavel em qualquer resolução.
bg.y = display.contentCenterY 

local pikachu = display.newImageRect ("imagens/pikachu.png", 1191/5, 1254/5)
pikachu.x = display.contentCenterX
pikachu.y = display.contentCenterY

local charmander = display.newImageRect ("imagens/charmander.png"  , 507/2, 492/2)
charmander.x = 300
charmander.y = 190
-----------------------------------------------

-- Criando um retângulo:
-- Comandos: display newImageRect (locakização x, localização y, largura, altura)
local retangulo = display.newRect (750, 380, 100, 70)

-- Criando um circulo:
-- Comandos: display.newCircle (x, y, radius (raio (metade do circulo))
local circulo = display.newCircle (150, 80, 50)

local mystery = display.newImageRect ("imagens/mystery.png", 500/7, 490/7)
mystery.x = 750
mystery.y = 380

local Pokeball = display.newImageRect ("imagens/Pokeball.png", 260/3, 280/3)
Pokeball.x = 150
Pokeball.y = 90