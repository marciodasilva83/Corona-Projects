local physics = require ("physics")
physics.start()
physics.setDrawMode ("normal")

display.setStatusBar (display.HiddenStatusBar)

local chao = display.newRect (display.contentCenterX, 470, 500, 50)
physics.addBody (chao, "static")

local paredeEsq = display.newRect (-30, display.contentCenterY, 50, 500)
physics.addBody (chao)

local testParticula = physics.newParticleSystem (
    {
        -- Nome do arquivo de particula
        filename ="imagens/liquidParticle.png",
        -- radius físico da particula
        radius = 2,
        -- radius da imagem (usar sempre valor maior que o radius da párticula para que elas se sebreponham e tragam um efeito visual mais satisfatório.)
        imageRadius = 4
    }
)

local function onTimer (event)
    testeParticula:createParticle (
    { 
        x= 0,
        y=0,
        velocityX= 256,
        velocityY= 480,
        color= {1, 0.2, 0.4, 1},
        lifetime= 32.0,
        flags= {"water", "colorMixing"}
    })
end
timer.performWithDelay (20, onTimer, 0)

    testeParticula:createGroup (
    {
        x=50,
        y=0,
        color={0, 0.3, 1, 1},
        halfWidth= 64,
        halfHeight = 32,
        flags ={"water", "colorMixing"}
    }
)
testeParticula:applyForce (0, -9.8*testeParticula.particleMass)

local parede2 = display.newRect (320, display.contentCenterY, 50, 500)
physic.addBody (parede2, "statis")

