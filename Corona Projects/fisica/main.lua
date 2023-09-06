-- Fisica
-- chamar a biblioteca: Atribui a biblioteca interna de física à variável physicas.
local physics = require ("physics")
-- Iniciar a física no projeto:
physics.start ()
-- definir a gravidade do projeto: definimos a gravidade x e y do projeto.
physics.setGravity (0, 9,8)
-- Definir a renderização da visualização da fisica (usando somente durante o desenvolvimento para testes)
-- Modos: Normal: Aparece  apenas as imagens, corpos fisicos invisiveis (padrão do sistema), hybrid: Mostra as images e os corpos fisicos, debug: mostra apenas os corpos fisicos.
physics.setDrawMode ("hybrid")

-- Adicionar objetos fisicos:
local retangulo = display.newRect (150, display.contentCenterY, 300, 240)

physics.addBody (retangulo, "dynamic")

local chao = display.newRect (display.contentCenterX, 400, 450, 30)
-- Corpo estatico: não se movimenta e colide apenas com dinamico.
physics.addBody (chao, "static")

local circulo = display.newCircle (300, 50, 30)
-- Corpo cinematico: Não interage com a gravidade e colide apenas com dinamico
physics.addBody (circulo, "kinematic", {radius=30})

local quadrado = display.newRect (display.contentCenterX, 0, 50, 50)
physics.addBody (quadrado, "dynamic", {bounce=1, friction=0, density=0.5})

quadrado:applyTorque (80)
