local currTime = 0
eventLoop = function()
  currTime = currTime + .5

if currTime % 8 == 0 then

math.randomseed(os.time())

random = 11

if random == 1 then

ui.addPopup(1,0,"vampiro",nil,50,50)
for name,player in pairs(tfm.get.room.playerList) do
    tfm.exec.setVampirePlayer(name)
end
end

if random == 2 then

ui.addPopup(1,0,"meep!",nil,50,50)
for name,player in pairs(tfm.get.room.playerList) do
    tfm.exec.giveMeep(name)
end
end

if random == 3 then

ui.addPopup(1,0,"volar con espacio",nil,50,50)
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

ui.addPopup(1,0,"nombres coloridos",nil,50,50)
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

ui.addPopup(1,0,"todos son chaman",nil,50,50)
for name,player in pairs(tfm.get.room.playerList) do
    tfm.exec.setShaman(name)
end
end

if random == 6 then

ui.addPopup(1,0,"genocidio",nil,50,50)
for name,player in pairs(tfm.get.room.playerList) do
tfm.exec.killPlayer(name)
end
end

if random == 7 then

ui.addPopup(1,0,"queso para todos",nil,50,50)
for name,player in pairs(tfm.get.room.playerList) do
tfm.exec.giveCheese(name)
end
end

if random == 8 then

ui.addPopup(1,0,"NIEVEE",nil,50,50)
tfm.exec.snow()
end

if random == 9 then

ui.addPopup(1,0,"todos ganan!",nil,50,50)
for name,player in pairs(tfm.get.room.playerList) do
tfm.exec.giveCheese(name)
tfm.exec.playerVictory(name)
end
end

if random == 10 then

ui.addPopup(1,0,"666 puntos",nil,50,50)
for name,player in pairs(tfm.get.room.playerList) do
tfm.exec.setPlayerScore(name, 666)
end
end

if random == 11 then

ui.addPopup(1,0,"congelar a todos",nil,50,50)
for name,player in pairs(tfm.get.room.playerList) do
tfm.exec.freezePlayer(name)
end
end

if random == 12 then

ui.addPopup(1,0,"mini ratones",nil,50,50)
for name,player in pairs(tfm.get.room.playerList) do
tfm.exec.changePlayerSize(name, .1)
end
end


if random == 13 then

ui.addPopup(1,0,"ratones enomrmes",nil,50,50)
for name,player in pairs(tfm.get.room.playerList) do
tfm.exec.changePlayerSize(name, 5)
end
end


if random == 14 then

ui.addPopup(1,0,"tamaños al azar",nil,50,50)
number = math.random(5)
for name,player in pairs(tfm.get.room.playerList) do
tfm.exec.changePlayerSize(name, number)
end
end

if random == 15 then

ui.addPopup(1,0,"tamaño normal",nil,50,50)
for name,player in pairs(tfm.get.room.playerList) do
tfm.exec.changePlayerSize(name, 1)
end
end

if random == 16 then

ui.addPopup(1,0,"transformaciones",nil,50,50)
for name,player in pairs(tfm.get.room.playerList) do
tfm.exec.giveTransformations(name)
end
end

if random == 17 then

ui.addPopup(1,0,"quitar queso",nil,50,50)
for name,player in pairs(tfm.get.room.playerList) do
tfm.exec.removeCheese(name)
end
end

if random == 18 then

ui.addPopup(1,0,"resurreccion",nil,50,50)
for name,player in pairs(tfm.get.room.playerList) do
tfm.exec.respawnPlayer(name)
end
end

if random == 19 then

ui.addPopup(1,0,"modo racing",nil,50,50)
for name,player in pairs(tfm.get.room.playerList) do
tfm.exec.setGameTime(20, true)
end
end

end
end
