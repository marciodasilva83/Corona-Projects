-- Carregando audio de fundo (tream indicado paraaudios longos)
                              -- ("pasta/arquivo.formato")
local bgAudio = audio.loadStream ("Audio/audio_bg.mp3")
-- reservando um canal de audio para o som de fundo
audio.reserveChannels (1)
-- Especificar o volume
audio.setVolume (0.6, {channel=1})
-- Reproduzir o audio
-- (audio a reproduzir, {canal, loopins (-1 infinito)})
audio.play (bgAudio, {channel=1, loops=-1})


local audioTiro = audio.loadSound ("Audio/tiro.wav")
-- informações de como o audio deve ser reproduzido.
local parametros = {time = 2000, fadein = 200}

local botaoTiro = display.newCircle (60, 300, 32)
botaoTiro:setFillColor (1, 0, 0)

local function tocarTiro ()
    audio.play (audioTiro, parametros)
end

botaoTiro:addEventListener ("tap", tocarTiro)

local audioMoeda = audio.loadSound ("Audio/moeda.wav")

local botaoMoeda = display.newCircle (60, 400, 32)
botaoMoeda:setFillColor (1, 0, 1)

local function tocarMoeda ()
    audio.play (audioMoeda, parametros)
end

botaoMoeda:addEventListener ("tap", tocarMoeda)
