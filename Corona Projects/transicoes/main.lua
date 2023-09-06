local circulo = display.newCircle (80, 50, 30)

-- Transições
-- Comando: transition.to (variável, (variavel, (parametros))
transition.to (circulo, {time=3000, y=400})
circulo: setFillColor (1, 0, 0)

local circulo1 = display.newCircle (150, 50, 30)
transition.to (circulo1, {time=3000, y=400, delta=true})
circulo1: setFillColor (0, 0, 1)

local circulo2 = display.newCircle (220, 50, 30)
transition.to (circulo2, {time=3000, y=400, iterations=4, transition=easing.outElastic} )
circulo2: setFillColor (255, 255, 0)


local retangulo = display.newRect (220, 250, 50, 70)
transition.to (retangulo, {time=3000, rotation=90, yScale=2, alpha=0.5, interations=-1})
transition.to (retangulo, {time=3000, rotation=180, yScale=5, alpha=0.5, interations=-5})


