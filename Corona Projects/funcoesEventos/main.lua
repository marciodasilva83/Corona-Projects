-- -- Incluindo funções: -- -- Comando para iniciar a função local function nome da função seguido de parênteses -- local function detectarTap (event) -- determina que a função é de evento. -- -- Código que é executado quando o botão for tocado. -- -- tostring: para sequenciar -- -- event.target: nomear o objeto do evento, ou objeto tocado. -- print ("Objeto tocado: " .. tostring (event.target) ) -- return true -- "zera" todos os dados depois da função executada. -- end -- Fecha a function -- local botaoTap = display.newRect (200, 200, 200, 50) -- botaoTap:addEventListener ("tap", detectarTap) -- Adiciona um ouvinte "tap" ao objeto. -- local function tapDuplo (event) -- -- se (número de taps do event for igual a 2) então -- if (event.numTaps == 2 ) then -- print ("Objeto tocado duas vezes: " ..tostring (event.target) ) -- else -- se não -- return true -- end -- fecha o if/else -- end -- fecha a function
system.activate ("multitouch")

local retangulo = display.newRect (display.contentCenter X, display.contentY, 280, 440)
retangulo:setFillColor (1, 0, 0.3)

local function eventoTouch (event)
    print ("fase de toque: " .. event.phase )
    print ("localização x" .. tostring(event.x) .. ", localização y:" ..tostring(event.y) ) 
    print ("ID de toque exclusivo: " .. tostring(event.id) )
    print ("-----------")
    return true
end  

retangulo:addEventListener ("touch", evento)