local currTime = 0
local cronometro = 20
eventLoop = function()
  currTime = currTime + .5
  cronometro = cronometro - 1

ui.addTextArea(2,cronometro,nil,700,50,30,0,0x272343,0xd72323)

if currTime == 10 then

cronometro = 20
currTime = 0

math.randomseed(os.time())

random = math.random(34)

if random == 1 then

ui.addTextArea(1,"Vampiro",nil,50,50,0,0,0x480f04,0x864e2b)
for name,player in pairs(tfm.get.room.playerList) do
    tfm.exec.setVampirePlayer(name)
end
end

if random == 2 then

ui.addTextArea(1,"Meep!",nil,50,50,0,0,0x2940d3,0x39a9cb)
for name,player in pairs(tfm.get.room.playerList) do
    tfm.exec.giveMeep(name)
end
end

if random == 3 then

ui.addTextArea(1,"Volar con espacio",nil,50,50,0,0,0x3490de,0xfdfdfd)
function eventNewPlayer(name)
tfm.exec.bindKeyboard(name,32,true,true)
end

for name,player in pairs(tfm.get.room.playerList) do
eventNewPlayer(name)
end

function eventKeyboard(name,key,down,x,y)
if key==32 then
tfm.exec.movePlayer(name,0,0,true,0,-50,false)
end
end
end

if random == 4 then

ui.addTextArea(1,"Nombres coloridos",nil,50,50,0,0,0x522546,0xe23e57)
function randomColor()
return "0x" .. string.format("%X", math.random(0x000000, 0xFFFFFF))
end

function eventLoop (currentTime, timeRemaining)
for i=1,100 do
for p,_ in pairs(tfm.get.room.playerList) do
tfm.exec.setNameColor(p, randomColor());
end
end
end
end

if random == 5 then

ui.addTextArea(1,"Todos son chamán",nil,50,50,0,0,0x553c27,0x08d9d6)
for name,player in pairs(tfm.get.room.playerList) do
    tfm.exec.setShaman(name)
end
end

if random == 6 then

ui.addTextArea(1,"Genocidio",nil,50,50,0,0,0x000000,0xd72323)
for name,player in pairs(tfm.get.room.playerList) do
tfm.exec.killPlayer(name)
end
end

if random == 7 then

ui.addTextArea(1,"Queso para todos",nil,50,50,0,0,0x77583b,0xffbd39)
for name,player in pairs(tfm.get.room.playerList) do
tfm.exec.giveCheese(name)
end
end

if random == 8 then

ui.addTextArea(1,"NIEVEE",nil,50,50,0,0,0x056676,0xdff5f2)
tfm.exec.snow()
end

if random == 9 then

ui.addTextArea(1,"Todos ganan",nil,50,50,0,0,0x14274e,0xe43a19)
for name,player in pairs(tfm.get.room.playerList) do
tfm.exec.giveCheese(name)
tfm.exec.playerVictory(name)
end
end

if random == 10 then

ui.addTextArea(1,"666 puntos",nil,50,50,0,0,0x000000,0xd72323)
for name,player in pairs(tfm.get.room.playerList) do
tfm.exec.setPlayerScore(name, 666)
end
end

if random == 11 then

ui.addTextArea(1,"Congelar a todos",nil,50,50,0,0,0x1d566e,0x21aba5)
for name,player in pairs(tfm.get.room.playerList) do
tfm.exec.freezePlayer(name)
end
end

if random == 12 then

ui.addTextArea(1,"Mini ratones",nil,50,50,0,0,0x00043c,0xff9a76)
for name,player in pairs(tfm.get.room.playerList) do
tfm.exec.changePlayerSize(name, .1)
end
end


if random == 13 then

ui.addTextArea(1,"Ratones enormes",nil,50,50,0,0,0x000000,0xf2910a)
for name,player in pairs(tfm.get.room.playerList) do
tfm.exec.changePlayerSize(name, 5)
end
end


if random == 14 then

ui.addTextArea(1,"Tamaños al azar",nil,50,50,0,0,0x232020,0xff7315)
number = math.random(.1,5)
for name,player in pairs(tfm.get.room.playerList) do
tfm.exec.changePlayerSize(name, number)
end
end

if random == 15 then

ui.addTextArea(1,"Tamaño normal",nil,50,50,0,0,0x3e432e,0xa7d129)
for name,player in pairs(tfm.get.room.playerList) do
tfm.exec.changePlayerSize(name, 1)
end
end

if random == 16 then

ui.addTextArea(1,"Transformaciones",nil,50,50,0,0,0x000000,0x324650)
for name,player in pairs(tfm.get.room.playerList) do
tfm.exec.giveTransformations(name)
end
end

if random == 17 then

ui.addTextArea(1,"Quitar queso",nil,50,50,0,0,0x202040,0xf0134d)
for name,player in pairs(tfm.get.room.playerList) do
tfm.exec.removeCheese(name)
end
end

if random == 18 then

ui.addTextArea(1,"Resurrección",nil,50,50,0,0,0x202040,0xf9f7cf)
for name,player in pairs(tfm.get.room.playerList) do
tfm.exec.respawnPlayer(name)
end
end

if random == 19 then

ui.addTextArea(1,"Modo racing",nil,50,50,0,0,0x000000,0xffffff)
for name,player in pairs(tfm.get.room.playerList) do
tfm.exec.setGameTime(20, true)
end
end

if random == 20 then

ui.addTextArea(1,"Gravedad zero",nil,50,50,0,0,0x0a043c,0x03506f)
tfm.exec.setWorldGravity (0, 0)
end


if random == 21 then

ui.addTextArea(1,"Gravedad fuerte",nil,50,50,0,0,0x212121,0xeeeeee)
tfm.exec.setWorldGravity (0, 50)
end

if random == 22 then

randomGrav = math.random(60)
ui.addTextArea(1,"Gravedad al azar",nil,50,50,0,0,0x9d0b0b,0xda2d2d)
tfm.exec.setWorldGravity (0,randomGrav)
end

if random == 23 then

ui.addTextArea(1,"Viento suave",nil,50,50,0,0,0x0779e4,0x4cbbb9)
tfm.exec.setWorldGravity (10, 10)
end


if random == 24 then

ui.addTextArea(1,"Viento FUERTE",nil,50,50,0,0,0x1d242b,0x9d0b0b)
tfm.exec.setWorldGravity (30, 10)
end

if random == 25 then

randomViento = math.random(-35, 35)
ui.addTextArea(1,"Viento al azar",nil,50,50,0,0,0x290001,0x87431d)
tfm.exec.setWorldGravity (randomViento, 10)
end

if random == 26 then

ui.addTextArea(1,"Teletransportarse con clicks",nil,50,50,0,0,0x000000,0x000000)
for name,player in pairs(tfm.get.room.playerList) do
system.bindMouse(name)

function eventMouse(name, x, y)
tfm.exec.movePlayer(name, x, y, false, 0, 1, false)
end
end
end

if random == 27 then

ui.addTextArea(1,"Todos tienen globos",nil,50,50,0,0,0xd62b70,0x9efcb4)
for name,player in pairs(tfm.get.room.playerList) do
tfm.exec.attachBalloon(name)
end
end

if random == 28 then

ui.addTextArea(1,"Todos bailan",nil,50,50,0,0,0x335d2d,0x7ea04d)
for name,player in pairs(tfm.get.room.playerList) do
tfm.exec.playEmote (name, 0)
end
end


if random == 29 then

ui.addTextArea(1,"Zzzzzz",nil,50,50,0,0,0x625757,0xbcbab8)
for name,player in pairs(tfm.get.room.playerList) do
tfm.exec.playEmote (name, 6)
end
end

if random == 30 then

randomAni = math.random(0, 9)
ui.addTextArea(1,"Acciones al azar",nil,50,50,0,0,0x110133,0xfce38a)
for name,player in pairs(tfm.get.room.playerList) do
tfm.exec.playEmote (name, randomAni)
end
end

if random == 31 then

ui.addTextArea(1,"Nada",nil,50,50,0,0,0x494ca2,0x8186d5)
end

if random == 32 then

ui.addTextArea(1,"Objeto al azar",nil,50,50,0,0,0x000000,0x215b63)
randomObj = math.random(2837)
randomX = math.random(-100, 700)
randomY = math.random(-20, 60)
tfm.exec.addShamanObject (randomObj, randomX, randomY, 0, 0, 0)
end

if random == 33 then

ui.addTextArea(1,"Portales al azar",nil,50,50,0,0,0x1357a6,0xffa500)
randomX = math.random(-20, 700)
randomY = math.random(-200, 50)
tfm.exec.addShamanObject (26, randomX, randomY, 0, 0, 0)
tfm.exec.addShamanObject (27, randomX, randomY, 0, 0, 0)
end

if random == 34 then

ui.addTextArea(1,"Viento y gravedad normal",nil,50,50,0,0,0x000000, 0x222831)
tfm.exec.setWorldGravity (0, 10)
end

end
end
