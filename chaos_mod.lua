--MAPAS--
local maps = {1,2,3,4,5,6,8,9,100,3098930,7808352,2083343,5082028,7810564,1810386,1864223,7890259,7812680,1263900,1729924,2372033,1700658,2706423,7838502,7860080,4818369,7722607,7800030,405075,2455250,282434,313091,230741,7801166,7800029,1738989,3295997,7800027,7800026,7726397,7438134,7800025,7840446,348801,6476975,410565,3680221,6571336,976721,335507,3603802,5488573,4972785,7650904}
local currentMap
local playersAlive

function main()
  tfm.exec.disableAutoNewGame(false)
  startGame()
end

function startGame()
  local newMap
  repeat
    newMap = math.random(#maps)
  until newMap ~= currentMap
  currentMap = newMap
  tfm.exec.newGame(maps[newMap])
  for name,player in pairs(tfm.get.room.playerList) do
  tfm.exec.changePlayerSize(name, 1)
  end
end

function endGame()
  startGame()
end

function eventNewGame()
  playersAlive = 0
  for _ in pairs(tfm.get.room.playerList) do
    playersAlive = playersAlive + 1
  end
  for name,player in pairs(tfm.get.room.playerList) do
    tfm.exec.giveTransformations(name, false)
    inicioX = tfm.get.room.playerList[name].x
    inicioY = tfm.get.room.playerList[name].y
  end  
end

function eventPlayerRespawn(name)
  playersAlive = playersAlive + 1
end

function eventPlayerDied(name)
  playersAlive = playersAlive - 1
  checkPlayers()
end

function eventPlayerWon(name)
  playersAlive = playersAlive - 1
  checkPlayers()
end

function checkPlayers()
  if playersAlive == 0 then
    endGame()
  end
end

function eventLoop(t, tr)
  if tr <= 0 then
    endGame()
  end
end

--****MOD****-- 

main()

local currTime = 0
local agua = 10
local cronometro = agua*2
eventLoop = function()
  currTime = currTime + .5
  cronometro = cronometro - 1

ui.addTextArea(2,cronometro,nil,700,50,30,0,0x272343,0xd72323,1,true)

if currTime == agua then

cronometro = agua*2
currTime = 0

function eventNewGame ()
  for name,player in pairs(tfm.get.room.playerList) do
  tfm.exec.giveTransformations(name, false)
end

if congelado == 1 then
	for name,player in pairs(tfm.get.room.playerList) do
	tfm.exec.freezePlayer(name, false)
	congelado = 0
	end
end
end

math.randomseed(os.time())

random = math.random(51)

--****EFECTOS****--

if random == 1 then

 ui.addTextArea(1,"Vampiros",nil,50,50,0,0,0x2940d3,0x39a9cb,1,true)
	for name,player in pairs(tfm.get.room.playerList) do
		tfm.exec.setVampirePlayer ( name, true)
	end
end

if random == 2 then

  ui.addTextArea(1,"Meep!",nil,50,50,0,0,0x2940d3,0x39a9cb,1,true)
  for name,player in pairs(tfm.get.room.playerList) do
    tfm.exec.giveMeep(name)
  end
end

if random == 3 then

  ui.addTextArea(1,"Volar con espacio",nil,50,50,0,0,0x3490de,0xfdfdfd,1,true)
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

  ui.addTextArea(1,"Nombres coloridos",nil,50,50,0,0,0x522546,0xe23e57,1,true)
  function randomColor()
    return "0x" .. string.format("%X", math.random(0x000000, 0xFFFFFF))
  end

  for name,player in pairs(tfm.get.room.playerList) do
    tfm.exec.setNameColor(name, randomColor());
  end
end

if random == 5 then

  ui.addTextArea(1,"Todos son chamán",nil,50,50,0,0,0x553c27,0x08d9d6,1,true)
  for name,player in pairs(tfm.get.room.playerList) do
    tfm.exec.setShaman(name)
  end
end

if random == 6 then

  ui.addTextArea(1,"Genocidio",nil,50,50,0,0,0x000000,0xd72323,1,true)
  for name,player in pairs(tfm.get.room.playerList) do
    tfm.exec.killPlayer(name)
  end
end

if random == 7 then

  ui.addTextArea(1,"Queso para todos",nil,50,50,0,0,0x77583b,0xffbd39,1,true)
  for name,player in pairs(tfm.get.room.playerList) do
    tfm.exec.giveCheese(name)
  end
end

if random == 8 then

  ui.addTextArea(1,"NIEVEE",nil,50,50,0,0,0x056676,0xdff5f2,1,true)
  tfm.exec.snow()
end

if random == 9 then

  ui.addTextArea(1,"Todos ganan",nil,50,50,0,0,0x14274e,0xe43a19,1,true)
  for name,player in pairs(tfm.get.room.playerList) do
    tfm.exec.giveCheese(name)
    tfm.exec.playerVictory(name)
  end
end

if random == 10 then

  ui.addTextArea(1,"666 puntos",nil,50,50,0,0,0x000000,0xd72323,1,true)
  for name,player in pairs(tfm.get.room.playerList) do
    tfm.exec.setPlayerScore(name, 666)
  end
end

if random == 11 then

  ui.addTextArea(1,"Congelar a todos",nil,50,50,0,0,0x1d566e,0x21aba5,1,true)
  for name,player in pairs(tfm.get.room.playerList) do
    tfm.exec.freezePlayer(name)
  end
	 local congelado = 1
end

if random == 12 then

  ui.addTextArea(1,"Mini ratones",nil,50,50,0,0,0x00043c,0xff9a76,1,true)
  for name,player in pairs(tfm.get.room.playerList) do
    tfm.exec.changePlayerSize(name, .1)
  end
end


if random == 13 then

  ui.addTextArea(1,"Ratones enormes",nil,50,50,0,0,0x000000,0xf2910a,1,true)
  for name,player in pairs(tfm.get.room.playerList) do
    tfm.exec.changePlayerSize(name, 5)
  end
end


if random == 14 then

  ui.addTextArea(1,"Tamaños al azar",nil,50,50,0,0,0x232020,0xff7315,1,true)
  number = math.random(.1,5)
  for name,player in pairs(tfm.get.room.playerList) do
    tfm.exec.changePlayerSize(name, number)
  end
end

if random == 15 then

  ui.addTextArea(1,"Tamaño normal",nil,50,50,0,0,0x3e432e,0xa7d129,1,true)
  for name,player in pairs(tfm.get.room.playerList) do
    tfm.exec.changePlayerSize(name, 1)
  end
end

if random == 16 then

  ui.addTextArea(1,"Transformaciones",nil,50,50,0,0,0x000000,0x324650,1,true)
  for name,player in pairs(tfm.get.room.playerList) do
    tfm.exec.giveTransformations(name)
  end
end

if random == 17 then

  ui.addTextArea(1,"Quitar queso",nil,50,50,0,0,0x202040,0xf0134d,1,true)
  for name,player in pairs(tfm.get.room.playerList) do
    tfm.exec.removeCheese(name)
  end
end

if random == 18 then

  ui.addTextArea(1,"Resurrección",nil,50,50,0,0,0x202040,0xf9f7cf,1,true)
  for name,player in pairs(tfm.get.room.playerList) do
    tfm.exec.respawnPlayer(name)
  end
end

if random == 19 then

  ui.addTextArea(1,"Time",nil,50,50,0,0,0x000000,0xffffff,1,true)
  for name,player in pairs(tfm.get.room.playerList) do
    tfm.exec.setGameTime(20, true)
  end
end

if random == 20 then

  ui.addTextArea(1,"Gravedad zero",nil,50,50,0,0,0x0a043c,0x03506f,1,true)
  tfm.exec.setWorldGravity (0, 0)
end


if random == 21 then

  ui.addTextArea(1,"Gravedad fuerte",nil,50,50,0,0,0x212121,0xeeeeee,1,true)
  tfm.exec.setWorldGravity (0, 50)
end

if random == 22 then

  ui.addTextArea(1,"Gravedad baja",nil,50,50,0,0,0x335d2d,0x7ea04d,1,true)
  tfm.exec.setWorldGravity (0, 4)
end


if random == 23 then

  randomGrav = math.random(60)
  ui.addTextArea(1,"Gravedad al azar",nil,50,50,0,0,0x9d0b0b,0xda2d2d,1,true)
  tfm.exec.setWorldGravity (0,randomGrav)
end

if random == 24 then

  ui.addTextArea(1,"Viento suave",nil,50,50,0,0,0x0779e4,0x4cbbb9,1,true)
  tfm.exec.setWorldGravity (10, 10)
	 tfm.exec.displayParticle(26, 200, 300)
	 tfm.exec.displayParticle(26, 60, 160)
 	 tfm.exec.displayParticle(27, 700, 230)
	 tfm.exec.displayParticle(27, 146, 90)
end


if random == 25 then

  ui.addTextArea(1,"Viento FUERTE",nil,50,50,0,0,0x1d242b,0x9d0b0b,1,true)
  tfm.exec.setWorldGravity (30, 10)
	 tfm.exec.displayParticle(26, 200, 300)
	 tfm.exec.displayParticle(26, 60, 160)
 	 tfm.exec.displayParticle(26, 700, 230)
	 tfm.exec.displayParticle(26, 146, 90)
 	 tfm.exec.displayParticle(26, 760, 290)
	 tfm.exec.displayParticle(26, 600, 190)
end

if random == 26 then

  randomViento = math.random(-35, 35)
  ui.addTextArea(1,"Viento al azar",nil,50,50,0,0,0x290001,0x87431d,1,true)
  tfm.exec.setWorldGravity (randomViento, 10)
	 Xcoord = math.random(800)
	 Ycoord = math.random(400)
	 tfm.exec.displayParticle(26, Xcoord, Ycoord)
	 Xcoord = math.random(800)
	 Ycoord = math.random(400)
	 tfm.exec.displayParticle(27, Xcoord, Ycoord)
	 Xcoord = math.random(800)
	 Ycoord = math.random(400)
	 tfm.exec.displayParticle(26, Xcoord, Ycoord)
end

if random == 27 then

  ui.addTextArea(1,"Teletransportarse con clicks",nil,50,50,0,0,0x000000,0x000000,1,true)
  for name,player in pairs(tfm.get.room.playerList) do
    system.bindMouse(name)

    function eventMouse(name, x, y)
      tfm.exec.movePlayer(name, x, y, false, 0, 1, false)
    end
  end
end

if random == 28 then

  ui.addTextArea(1,"Todos tienen globos",nil,50,50,0,0,0xd62b70,0x9efcb4,1,true)
  for name,player in pairs(tfm.get.room.playerList) do
    tfm.exec.attachBalloon(name)
  end
end

if random == 29 then

  ui.addTextArea(1,"Harlem shake",nil,50,50,0,0,0x335d2d,0x7ea04d,1,true)
  for name,player in pairs(tfm.get.room.playerList) do
    Xcoord = tfm.get.room.playerList[name].x
    Ycoord = tfm.get.room.playerList[name].y
	   tfm.exec.displayParticle(29, Xcoord, Ycoord)
	   tfm.exec.displayParticle(29, Xcoord, Ycoord, 1, 1)
	   tfm.exec.displayParticle(29, Xcoord, Ycoord, -1, -1)
    tfm.exec.playEmote (name, 0)
  end
end

if random == 30 then

  ui.addTextArea(1,"Zzzzzz",nil,50,50,0,0,0x625757,0xbcbab8,1,true)
  for name,player in pairs(tfm.get.room.playerList) do
    tfm.exec.playEmote (name, 6)
  end
end

if random == 31 then

  ui.addTextArea(1,"Aplausos!",nil,50,50,0,0,0x625757,0xbcbab8,1,true)
  for name,player in pairs(tfm.get.room.playerList) do
    tfm.exec.playEmote (name, 5)
  end
end

if random == 32 then

  ui.addTextArea(1,"Todos lloran",nil,50,50,0,0,0x625757,0xbcbab8,1,true)
  for name,player in pairs(tfm.get.room.playerList) do
    tfm.exec.playEmote (name, 2)
  end
end

if random == 33 then

  ui.addTextArea(1,"Facepalm",nil,50,50,0,0,0x625757,0xbcbab8,1,true)
  for name,player in pairs(tfm.get.room.playerList) do
    tfm.exec.playEmote (name, 7)
  end
end

if random == 34 then

  ui.addTextArea(1,"Acciones al azar",nil,50,50,0,0,0x110133,0xfce38a,1,true)
  for name,player in pairs(tfm.get.room.playerList) do
	   randomAni = math.random(0, 27)
    tfm.exec.playEmote (name, randomAni)
  end
end

if random == 35 then

  ui.addTextArea(1,"Nada",nil,50,50,0,0,0x494ca2,0x8186d5,1,true)
end

if random == 36 then

  ui.addTextArea(1,"Objeto al azar",nil,50,50,0,0,0x000000,0x215b63,1,true)
  objetos = {1,2,3,4,0,5,6,7,10,17,18,19,20,23,28,29,30,31,32,33,34,35,39,40,45,46,54,57,59,60,61,6,67,68,69,85,63,65,80,89,90,91,95,96,97,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,199,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419,420,421,422,423,424,425,426,427,428,429,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,601,602,603,604,605,606,607,608,609,610,611,612,613,614,615,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,701,702,703,704,705,706,707,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1701,1702,1703,1704,1705,1706,1707,1708,1709,1710,1711,1712,1713,1714,1715,1716,1717,1718,1719,1720,1721,1722,1723,1724,1725,1726,1727,1728,1729,1730,1731,1732,1733,1734,1735,1736,2801,2802,2803,2804,2805,2806,2807,2808,2809,2810,2811,2812,2813,2814,2815,2816,2817,2818,2819,2820,2821,2822,2823,2824,2825,2826,2827,2828,2829,2830,2831,2832,2833,2834,2835,2836,2837,2838,2839,2840,2841,2842,2843,2844}

	 randomObj = math.random(#objetos)
  randomX = math.random(800)
  randomY = math.random(400)
  tfm.exec.addShamanObject (randomObj, randomX, randomY, 0, 0, 0)
end

if random == 37 then

  ui.addTextArea(1,"Portales al azar",nil,50,50,0,0,0x1357a6,0xffa500,1,true)
  randomX1 = math.random(800)
  randomY1 = math.random(400)
  randomX2 = math.random(800)
  randomY2 = math.random(400)
  tfm.exec.addShamanObject (26, randomX1,randomY1, 0, 0, 0) 
  tfm.exec.addShamanObject (27, randomX2,randomY2, 0, 0, 0)
end

if random == 38 then

  ui.addTextArea(1,"Viento y gravedad normal",nil,50,50,0,0,0x000000, 0x222831,1,true)
  tfm.exec.setWorldGravity (0, 10)
end

if random == 39 then

  ui.addTextArea(1,"Particulas al azar",nil,50,50,0,0,0x000000, 0x222831,1,true)
  for name,player in pairs(tfm.get.room.playerList) do
    Xcoord = tfm.get.room.playerList[name].x
    Ycoord = tfm.get.room.playerList[name].y
    randomParticula = math.random(44)
    tfm.exec.displayParticle(randomParticula, Xcoord, Ycoord, 1, 1)
	   tfm.exec.displayParticle(randomParticula, Xcoord, Ycoord, -1, -1)
	   tfm.exec.displayParticle(randomParticula, Xcoord, Ycoord, 2, 1)
	   tfm.exec.displayParticle(randomParticula, Xcoord, Ycoord, -2, -1)
  end
end

if random == 40 then

  ui.addTextArea(1,"Lluvia de ratones",nil,50,50,0,0,0x045791, 0x9ac6e6,1,true)
  for name,player in pairs(tfm.get.room.playerList) do
    Xcoord = math.random(800)
    tfm.exec.movePlayer ( name, Xcoord, 1)				
  end
end

if random == 41 then

  ui.addTextArea(1,"Nuevo mapa",nil,50,50,0,0,0xab5902, 0x572e03,1,true)
	 newMap = math.random(#maps)
  tfm.exec.newGame(maps[newMap])
end


if random == 42 then

  ui.addTextArea(1,"CAJA",nil,50,50,0,0,0x3b1e00,0x1c0f01,1,true)
  tfm.exec.addShamanObject (2, 50, 50, 0, 0, 0)
end

if random == 43 then

	ui.addTextArea(1,"Explosion",nil,50,50,0,0,0x850601, 0xffc800,1,true)
	for name,player in pairs(tfm.get.room.playerList) do
    Xcoord = tfm.get.room.playerList[name].x
    Ycoord = tfm.get.room.playerList[name].y
	   tfm.exec.explosion (Xcoord, Ycoord, 10000, 10000, false)
	   tfm.exec.displayParticle(3, Xcoord, Ycoord, 1, 1)
	   tfm.exec.displayParticle(3, Xcoord+1, Ycoord+1, -1, -1)
	   tfm.exec.displayParticle(3, Xcoord-1, Ycoord-1, 2, 2)
	   tfm.exec.displayParticle(3, Xcoord-1, Ycoord-1, -3, -3)
	   tfm.exec.displayParticle(10, Xcoord, Ycoord)

  end
end

if random == 44 then

 ui.addTextArea(1,"Objeto",nil,50,50,0,0,0x1a1a1a, 0x000000,1,true)
	tfm.exec.addPhysicObject ( 2, 50, 50,table)
end             

if random == 45 then

  ui.addTextArea(1,"Tiempo extra",nil,50,50,0,0,0x140042,0xaa8bf0,1,true)
  for name,player in pairs(tfm.get.room.playerList) do
    tfm.exec.setGameTime(300, true)
  end
end

if random == 46 then

	ui.addTextArea(1,"Lag",nil,50,50,0,0,0x3b0000,0x00163b,1,true)
	for name,player in pairs(tfm.get.room.playerList) do
		Xcoord = tfm.get.room.playerList[name].x
    	Ycoord = tfm.get.room.playerList[name].y
		tfm.exec.movePlayer ( name, Xcoord, Ycoord)
	end
end

if random == 47 then

	   ui.addTextArea(1,"Lluvia de objetos",nil,50,50,0,0,0x003b15,0x32fc7a,1,true)
	   objetos = {1,2,3,4,0,5,6,7,10,17,18,19,20,23,28,29,30,31,32,33,34,35,39,40,45,46,54,57,59,60,61,6,67,68,69,85,63,65,80,89,90,91,95,96,97,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,199,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419,420,421,422,423,424,425,426,427,428,429,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,601,602,603,604,605,606,607,608,609,610,611,612,613,614,615,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,701,702,703,704,705,706,707,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1701,1702,1703,1704,1705,1706,1707,1708,1709,1710,1711,1712,1713,1714,1715,1716,1717,1718,1719,1720,1721,1722,1723,1724,1725,1726,1727,1728,1729,1730,1731,1732,1733,1734,1735,1736,2801,2802,2803,2804,2805,2806,2807,2808,2809,2810,2811,2812,2813,2814,2815,2816,2817,2818,2819,2820,2821,2822,2823,2824,2825,2826,2827,2828,2829,2830,2831,2832,2833,2834,2835,2836,2837,2838,2839,2840,2841,2842,2843,2844}
	   randomObj = math.random(#objetos)
	   tfm.exec.addShamanObject (randomObj, 0, 0, 0, 0, 0)
	   randomObj = math.random(#objetos)
	   tfm.exec.addShamanObject (randomObj, 100, 0, 0, 0, 0)
	   randomObj = math.random(#objetos)
	   tfm.exec.addShamanObject (randomObj, 200, 0, 0, 0, 0)
	   randomObj = math.random(#objetos)
	   tfm.exec.addShamanObject (randomObj, 300, 0, 0, 0, 0)
	   randomObj = math.random(#objetos)
	   tfm.exec.addShamanObject (randomObj, 400, 0, 0, 0, 0)
	   randomObj = math.random(#objetos)
	   tfm.exec.addShamanObject (randomObj, 500, 0, 0, 0, 0)
	   randomObj = math.random(#objetos)
	   tfm.exec.addShamanObject (randomObj, 600, 0, 0, 0, 0)
	   randomObj = math.random(#objetos)
	   tfm.exec.addShamanObject (randomObj, 700, 0, 0, 0, 0)
	   randomObj = math.random(#objetos)
	   tfm.exec.addShamanObject (randomObj, 800, 0, 0, 0, 0)
end

if random == 48 then

	ui.addTextArea(1,"Todos besan",nil,50,50,0,0,0xa8009a,0xf3dff5,1,true)
 for name,player in pairs(tfm.get.room.playerList) do
		tfm.exec.playEmote (name, 3)
    	Xcoord = tfm.get.room.playerList[name].x
    	Ycoord = tfm.get.room.playerList[name].y
		tfm.exec.displayParticle(31, Xcoord, Ycoord)
		tfm.exec.displayParticle(31, Xcoord, Ycoord, 1, 1)
		tfm.exec.displayParticle(31, Xcoord, Ycoord, -1, -1)
	end
end

if random == 49 then

	ui.addTextArea(1,"Teletransportacion random",nil,50,50,0,0,0x575e66,0xcadaed,1,true)
 for name,player in pairs(tfm.get.room.playerList) do
    	Xcoord = math.random(800)
		Ycoord = math.random(400)
		tfm.exec.movePlayer ( name, Xcoord, Ycoord)
    	ratonX = tfm.get.room.playerList[name].x
    	ratonY = tfm.get.room.playerList[name].y
		tfm.exec.displayParticle(36, ratonX, ratonY)
		tfm.exec.displayParticle(36, Xcoord, Ycoord)
	end
end

if random == 50 then

	ui.addTextArea(1,"Empieza otra vez",nil,50,50,0,0,0x575e66,0xcadaed,1,true)
	for name,player in pairs(tfm.get.room.playerList) do 
		tfm.exec.movePlayer ( name, inicioX, inicioY)  
	end 
end

if random == 51 then

	ui.addTextArea(1,"Puntos al azar",nil,50,50,0,0,0x575e66,0xcadaed,1,true)
	for name,player in pairs(tfm.get.room.playerList) do
	   puntos = math.random(1000)
   	   tfm.exec.setPlayerScore(name, puntos)
  	end
end
		
if random == 52 then

  ui.addTextArea(1,"Selfie",nil,50,50,0,0,0x625757,0xbcbab8,1,true)
  for name,player in pairs(tfm.get.room.playerList) do
    tfm.exec.playEmote (name, 12)
  end
end

if random == 53 then

  ui.addTextArea(1,"Malvaviscos",nil,50,50,0,0,0x625757,0xbcbab8,1,true)
  for name,player in pairs(tfm.get.room.playerList) do
    tfm.exec.playEmote (name, 11)
  end
end		

if random == 54 then

  ui.addTextArea(1,"Karaoke",nil,50,50,0,0,0x625757,0xbcbab8,1,true)
  for name,player in pairs(tfm.get.room.playerList) do
    tfm.exec.playEmote (name, 20)
  end
end		
		
if random == 55 then

  ui.addTextArea(1,"Fiesta",nil,50,50,0,0,0x625757,0xbcbab8,1,true)
  for name,player in pairs(tfm.get.room.playerList) do
    tfm.exec.playEmote (name, 16)
  end

	 function randomColor()
    return "0x" .. string.format("%X", math.random(0x000000, 0xFFFFFF))
  end

  for name,player in pairs(tfm.get.room.playerList) do
    tfm.exec.setNameColor(name, randomColor());
  end

  for name,player in pairs(tfm.get.room.playerList) do
    Xcoord = tfm.get.room.playerList[name].x
    Ycoord = tfm.get.room.playerList[name].y
    Xrandom = math.random(800)
	   Yrandom = math.random(400)
	   tfm.exec.displayParticle(22, Xcoord, Ycoord)
	   tfm.exec.displayParticle(22, Xcoord, Ycoord, 1, 1)
	   tfm.exec.displayParticle(22, Xcoord, Ycoord, -1, -1)
	   tfm.exec.displayParticle(23, Xcoord, Ycoord)
	   tfm.exec.displayParticle(23, Xcoord, Ycoord, 2, 2)
	   tfm.exec.displayParticle(23, Xcoord, Ycoord, -2, -2)
	   tfm.exec.displayParticle(1, Xrandom, Yrandom)
	   tfm.exec.displayParticle(1, Xrandom, Yrandom, 1, 1)
	   tfm.exec.displayParticle(1, Xrandom, Yrandom, -1, -1)
    tfm.exec.displayParticle(3, Xrandom, Yrandom)
	   tfm.exec.displayParticle(3, Xrandom, Yrandom)
	   tfm.exec.displayParticle(3, Xrandom, Yrandom)
  end
end


if random == 56 then

	ui.addTextArea(1,"CAÑONES",nil,50,50,0,0,0x625757,0xbcbab8,1,true)
	tfm.exec.addShamanObject (1701, 50, 0, 90, 6, 0)
	tfm.exec.addShamanObject (1701, 50, 50, 90, 6, 0)
	tfm.exec.addShamanObject (1701, 50, 100, 90, 6, 0)
	tfm.exec.addShamanObject (1701, 50, 150, 90, 6, 0)
	tfm.exec.addShamanObject (1701, 50, 200, 90, 6, 0)
	tfm.exec.addShamanObject (1701, 50, 250, 90, 6, 0)
	tfm.exec.addShamanObject (1701, 50, 300, 90, 6, 0)
	tfm.exec.addShamanObject (1701, 50, 350, 90, 6, 0)
	tfm.exec.addShamanObject (1701, 50, 400, 90, 6, 0)
	tfm.exec.addShamanObject (1701, 750, 0, 270, 6, 0)
	tfm.exec.addShamanObject (1701, 750, 50, 270, 6, 0)
	tfm.exec.addShamanObject (1701, 750, 100, 270, 6, 0)
	tfm.exec.addShamanObject (1701, 750, 150, 270, 6, 0)
	tfm.exec.addShamanObject (1701, 750, 200, 270, 6, 0)
	tfm.exec.addShamanObject (1701, 750, 250, 270, 6, 0)
	tfm.exec.addShamanObject (1701, 750, 300, 270, 6, 0)
	tfm.exec.addShamanObject (1701, 750, 350, 270, 6, 0)
	tfm.exec.addShamanObject (1701, 750, 400, 270, 6, 0)
end	

if random == 57 then

	ui.addTextArea(1,"Empujar",nil,50,50,0,0,0x625757,0xbcbab8,1,true)
	for name,player in pairs(tfm.get.room.playerList) do
		Xcoord = tfm.get.room.playerList[name].x
    	Ycoord = tfm.get.room.playerList[name].y
		tfm.exec.movePlayer ( name, 0, 0,true,-60,0)
	end
end		

end
end
