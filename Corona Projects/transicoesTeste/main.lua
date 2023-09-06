local caveira = display.newImageRect ("imagens/caveira.png", 180*2, 180*2)
caveira.x = display.contentCenterX
caveira.y = display.contentCenterY
transition.to(caveira, {time=5000, y=300, interations=6, rotation=360, transition=easing.outElastic})

local celta = display.newImageRect ("imagens/celta.png", 40*2, 40*2)
celta.x = 40
celta.y = 50
transition.to(celta, {time=3000, y=400})

local mao = display.newImageRect ("imagens/mao.png", 40*2, 40*2)
mao.x = 300
mao.y = 50
transition.to(mao, {time=8000, y=400, interations=6, rotation=360, transition=easing.outElastic})