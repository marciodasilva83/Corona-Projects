-- criando grupos de exibição
local backGroup = display.newGroup () -- Back usado para plano de fundo, decorações que não terão interação com o jogo.
local mainGroup = display.newGroup () -- Usado para os objetos que terão interação dentro do jogo, grupo principal.
local uiGroup = display.newGroup () -- Utilizado para placar, vidas, texto, que ficarão na frente do jogo porém sem interaçao.

-- Método embutido:
-- Inclui o objeto no grupo ja na sua criação.
local bg = display.newImageRect (backGroup, "imagens/bg.jpg",509*2, 339*2)
bg.x = display.contentCenterX
bg.y = display.contentCenterY

local sun = display.newImageRect (backGroup, "imagens/sun.png", 256/2, 256/2)
sun.x = 150
sun.y = 50

local cloud = display.newImageRect (backGroup, "imagens/cloud.png", 2360/13, 984/13)
cloud.x = 70
cloud.y = 30
backGroup:insert (cloud)

-- Método direto:
-- Inclui o objeto depois da criação.
local chao = display.newImageRect ("imagens/chao.png", 4503/5, 613/5)
chao.x = display.contentCenterX
chao.y = 430
mainGroup:insert (chao)

local tree = display.newImageRect ("imagens/tree.png", 1024/6, 1024/6)
tree.x = 50
tree.y = 350
local tree2 = display.newImageRect ("imagens/tree.png", 1024/9, 1024/9)
tree2.x = 250
tree2.y = 350
mainGroup:insert (tree2)
