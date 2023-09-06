-- variavel global. (Deve ser evitado)
vidas = 2
vidas = 8
print (vidas)
print ("o valor de vidas: " .. vidas)
-----------------
-- variaveis locais (só é lida dentro do script)
-- (local) é utilizado somente na criação da variável.
local pontos = 10 
print (pontos)
print ("O valor de pontos: " .. pontos)

---- operacoes aritmeticas ----
--- soma
--- (local significa que a variável é local) laranjas (nome da variável) = (atribuir valor) 10 (valor atribuido a variável)

local laranjas = 10

laranjas = laranjas + 5
print (laranjas)
print ( "O valor da soma das laranjas é: " .. laranjas)
local bananas = 5

---soma entre variaveis
local cesta = 0
cesta = laranjas + bananas
print ("a soma entre as variaveis laranjas e bananas é: " .. cesta)

print (" Na sua cesta possuem ".. cesta .. " frutas")

----subtracao----
cesta = laranjas - bananas
bananas = bananas -1

-----multiplicacão----

local carro = 8
carro = carro * 2
print ("quantidade de carros: " .. carro)

---- Dividinto pela multiplicaçao
carro = carro * 0,5
print ("divisao pela multiplicacao: " .. carro)

-- Divisão
local gato = 6
gato = gato / 2
print (" A divisão final é: " .. gato)

local arvore = 97.5
arvore = arvore / 4
print ("divisao com virgula: " .. arvore)


