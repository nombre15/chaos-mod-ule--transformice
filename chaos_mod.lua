--MAPAS--
local maps = {1,2,3,4,5,6,8,9,100,3098930,7808352,2083343,5082028,7810564,1810386,1864223,7890259,7812680,1263900,1729924,2372033,1700658,2706423,7838502,7860080,4818369,7722607,7800030,405075,2455250,282434,313091,230741,7801166,7800029,1738989,3295997,7800027,7800026,7726397,7438134,7800025,7840446,348801,6476975,410565,3680221,6571336,976721,335507,3603802,5488573,4972785,7650904}
local bootcamps = {167333,170007,176615,174065,156510,357837,159145,177652,212322,215933,408577,158053,159131,257715,447805,422981,435812,176729,258160,159298,410040,176619,220352,151655,168204,208653,272689,277427,155628}
local defilante = {4123226,6913844,4032861,3761727,7816905,3594982,7205111,7828977,7530218,7868694}
local survivor = {7516401,391738,7682811,6737359,310529,728382,392616,3107377,1659906,7317000,3579303,280159}  
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
tfm.exec.setUIMapName("ChaosMod")
	
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

random = math.random(86)

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
    Ycoord = 1
    tfm.exec.movePlayer (name, Xcoord, Ycoord)				
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

 ui.addTextArea(1,"Niebla",nil,50,50,0,0,0x383838, 0x8c8c8c,1,true)
	tfm.exec.addPhysicObject ( 8, 400, 100, {type = 8,
    miceCollision = false,
    groundCollision = false,
    width = 1300,
    height = 1300,
    contactListener = true,
	   foreground = true
})
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
	coordenada = 0  

	while coordenada ~= 800 do
		randomObj = math.random(#objetos)
		tfm.exec.addShamanObject (randomObj, coordenada, 0, 0, 0, 0)
		coordenada = coordenada + 100
	end 
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

  ui.addTextArea(1,"Malvaviscos",nil,50,50,0,0,0x453003,0xfffcf5,1,true)
  for name,player in pairs(tfm.get.room.playerList) do
    tfm.exec.playEmote (name, 11)
  end
end

if random == 54 then

  ui.addTextArea(1,"Karaoke",nil,50,50,0,0,0x0a0a0a,0x00330b,1,true)
  for name,player in pairs(tfm.get.room.playerList) do
    tfm.exec.playEmote (name, 20)
  end
end

if random == 55 then

  ui.addTextArea(1,"Fiesta",nil,50,50,0,0,0x35014d,0xa900f7,1,true)
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

	ui.addTextArea(1,"CAÑONES",nil,50,50,0,0,0x000000,0x292828,1,true)
	coord = 0
	
	while coord ~= 400 do
		tfm.exec.addShamanObject (1701, 50, coord, 90, 6, 0)
		coord = coord + 50
	end
	coord = 0

	while coord ~= 400 do
		tfm.exec.addShamanObject (1701, 750, coord, 270, 6, 0)
		coord = coord + 50
	end
end	

if random == 57 then

	ui.addTextArea(1,"Empujar",nil,50,50,0,0,0x625757,0xbcbab8,1,true)
	for name,player in pairs(tfm.get.room.playerList) do
		Xcoord = tfm.get.room.playerList[name].x
    	Ycoord = tfm.get.room.playerList[name].y
		tfm.exec.movePlayer ( name, 0, 0,true,-60,0)
	end
end

if random == 58 then

	ui.addTextArea(1,"Turbo",nil,50,50,0,0,0x5e4500,0xffbb00,1,true)
	for name,player in pairs(tfm.get.room.playerList) do
		Xcoord = tfm.get.room.playerList[name].x
    	Ycoord = tfm.get.room.playerList[name].y
		tfm.exec.movePlayer ( name, 0, 0,true,60,0)
	end
end

if random == 59 then

	ui.addTextArea(1,"Salto",nil,50,50,0,0,0x026305,0xaaf20f,1,true)
	for name,player in pairs(tfm.get.room.playerList) do
		Xcoord = tfm.get.room.playerList[name].x
    	Ycoord = tfm.get.room.playerList[name].y
		tfm.exec.movePlayer ( name, 0, 0,true,0,-50)
	end
end

if random == 60 then

	ui.addTextArea(1,"Lanzar a todos al espacio",nil,50,50,0,0,0x01094a,0x394399,1,true)	
	for name,player in pairs(tfm.get.room.playerList) do
		Xcoord = tfm.get.room.playerList[name].x
    	Ycoord = tfm.get.room.playerList[name].y
		tfm.exec.movePlayer ( name, 0, 0,true,0,-800)
	end
end

if random == 61 then

	ui.addTextArea(1,"0 puntos",nil,50,50,0,0,0x191b33,0x230236,1,true)
	for name,player in pairs(tfm.get.room.playerList) do

    tfm.exec.setPlayerScore(name, 0)
 end
end

if random == 62 then

	ui.addTextArea(1,"Daño de caida",nil,50,50,0,0,0x02306b,0x36ffc,1,true)	
		tfm.exec.setAieMode (true, 1)
end

if random == 63 then
	
	ui.addTextArea(1,"Ratones de cristal",nil,50,50,0,0,0x7a90c4,0xa4ecfc,1,true)
	tfm.exec.setAieMode (true, 0.7)
end

if random == 64 then

 ui.addTextArea(1,"Inundacion",nil,50,50,0,0,0x649ca5,0x8cb4bc,1,true)
	tfm.exec.addPhysicObject (9, 400, 100, {type = 9,
    miceCollision = false,
    width = 1300,
    height = 1300,
    contactListener = true,
	   foreground = true
})
end   

if random == 65 then

	ui.addTextArea(1,"Defilante?",nil,50,50,0,0,0xb4732c,0xcb9847,1,true)

 temp = 0
	while temp ~= 9 do
		randomTipo = math.random(6)
		Xcoord = math.random(800)
		Ycoord = math.random(400)
		tfm.exec.addBonus (randomTipo, Xcoord, Ycoord, 0, 0, true, nil)
		temp = temp + 1
	end
end

if random == 66 then

 ui.addTextArea(1,"El suelo es acido",nil,50,50,0,0,0x839D50,0x8FFE09,1,true)	
	tfm.exec.addPhysicObject (19, 450, 400, {type = 19,
    miceCollision = true,
    width = 1300,
    height = 20,
    contactListener = true,
	  foreground = true
})
end 

if random == 67 then

 ui.addTextArea(1,"El suelo es lava",nil,50,50,0,0,0xff2500,0xea5c0f,1,true)	
	tfm.exec.addPhysicObject (10, 450, 400, {type = 3,
    miceCollision = true,
    width = 1300,
    height = 20,
    contactListener = true,
	   foreground = true,
	   friction = 0.2,
    restitution = 20
	})
end 

if random == 68 then

 ui.addTextArea(1,"El suelo es trampolin",nil,50,50,0,0,0xff2500,0xea5c0f,1,true)	
	tfm.exec.addPhysicObject (10, 450, 400, {type = 2,
    miceCollision = true,
    width = 1300,
    height = 20,
    contactListener = true,
	   foreground = true,
	   friction = 0,
    restitution = 1.2
	})
end 

if random == 69 then

 ui.addTextArea(1,"Caja trampolin",nil,50,50,0,0,0xff2500,0xea5c0f,1,true)	
	tfm.exec.addPhysicObject (1, 450, 400, {type = 2,
    miceCollision = true,
    width = 1300,
    height = 13,
    contactListener = true,
	   friction = 0,
	   restitution = 1.2
})

	tfm.exec.addPhysicObject (2, 450, 20, {type = 2,
    miceCollision = true,
    width = 1300,
    height = 13,
    contactListener = true,
	   friction = 0,
	   restitution = 1.2
}) 

	tfm.exec.addPhysicObject (3, 0, 0, {type = 2,
    miceCollision = true,
    width = 13,
    height = 1000,
    contactListener = true,
	   friction = 0,
	   restitution = 1.2
})

	tfm.exec.addPhysicObject (4, 800, 0, {type = 2,
    miceCollision = true,
    width = 13,
    height = 1000,
    contactListener = true,
	   friction = 0,
	   restitution = 1.2
})
end

if random == 70 then

 ui.addTextArea(1,"Caja de lava",nil,50,50,0,0,0xff2500,0xea5c0f,1,true)	
	tfm.exec.addPhysicObject (1, 450, 400, {type = 3,
    miceCollision = true,
    width = 1300,
    height = 13,
    contactListener = true,
	   friction = 0.2,
	   restitution = 20
})

	tfm.exec.addPhysicObject (2, 450, 20, {type = 3,
    miceCollision = true,
    width = 1300,
    height = 13,
    contactListener = true,
	   friction = 0.2,
	   restitution = 20
})

	tfm.exec.addPhysicObject (3, 0, 0, {type = 3,
    miceCollision = true,
    width = 13,
    height = 1000,
    contactListener = true,
	   friction = 0.2,
	   restitution = 20
})

	tfm.exec.addPhysicObject (4, 800, 0, {type = 3,
    miceCollision = true,
    width = 13,
    height = 1000,
    contactListener = true,
	   friction = 0.2,
	   restitution = 20
})
end

if random == 71 then

 ui.addTextArea(1,"Niebla extrema",nil,50,50,0,0,0x92d9f2, 0xe3f6fd,1,true)
	
	numero = 0
	while numero ~= 13 do
	tfm.exec.addPhysicObject (numero, 400, 100, {type = 8,
    miceCollision = false,
	   groundCollision = false,
    width = 1300,
    height = 1300,
    contactListener = true,
	   foreground = true
})
	numero = numero + 1
	end
end   

if random == 72 then
	
	ui.addTextArea(1,"Velocidad",nil,50,50,0,0,0xf03118, 0xffb805,1,true)

	Xcoord = 0
	Ycoord = 0
	while Ycoord ~= 400 do
		tfm.exec.addBonus (5, Xcoord, Ycoord, 0, 0, true, nil)
		Xcoord = Xcoord + 50
		
		if Xcoord == 800 then
			Ycoord = Ycoord + 50
			Xcoord = 0
		end
	end
end

if random == 73 then

 ui.addTextArea(1,"Caja de acido",nil,50,50,0,0,0x839D50,0x8FFE09,1,true)	
	tfm.exec.addPhysicObject (1, 450, 400, {type = 19,
    miceCollision = true,
    width = 1300,
    height = 13,
    contactListener = true,
})

	tfm.exec.addPhysicObject (2, 450, 20, {type = 19,
    miceCollision = true,
    width = 1300,
    height = 13,
    contactListener = true,
}) 

	tfm.exec.addPhysicObject (3, 0, 0, {type = 19,
    miceCollision = true,
    width = 13,
    height = 1000,
    contactListener = true,
})

	tfm.exec.addPhysicObject (4, 800, 0, {type = 19,
    miceCollision = true,
    width = 13,
    height = 1000,
    contactListener = true,
})
end

if random == 74 then

	ui.addTextArea(1,"Modo divino",nil,50,50,0,0,0x420480, 0xb245ed,1,true)
	for name,player in pairs(tfm.get.room.playerList) do 
		 tfm.exec.setShamanMode (name, 2)
	end
end

if random == 75 then

	ui.addTextArea(1,"Resortes",nil,50,50,0,0,0xa17338, 0xfab700,1,true)

	Xcoord = 0
	Ycoord = 0
	while Ycoord ~= 400 do
		tfm.exec.addBonus (3, Xcoord, Ycoord, 0, 0, true, nil)
		Xcoord = Xcoord + 50
		
		if Xcoord == 800 then
			Ycoord = Ycoord + 50
			Xcoord = 0
		end
	end
end

if random == 76 then

	ui.addTextArea(1,"Suelo extra",nil,50,50,0,0,0x5b2e85, 0xffffff,1,true)

	Xcoord = 0
	while Xcoord ~= 850 do
		tfm.exec.addBonus (6, Xcoord, 1, 0, 0, true, nil)
		Xcoord = Xcoord + 25
	end
end

if random == 77 then

	ui.addTextArea(1,"Esquiva la muerte",nil,50,50,0,0,0xa17338, 0xe3e1e1,1,true)

	Xcoord = 0
	Ycoord = 0
	while Ycoord ~= 450 do
		tfm.exec.addBonus (2, Xcoord, Ycoord, 0, 0, true, nil)
		Xcoord = Xcoord + 50
		
		if Xcoord == 850 then
			Ycoord = Ycoord + 50
			Xcoord = 0
		end
	end
end

if random == 78 then

	ui.addTextArea(1,"Lluvia de pollos",nil,50,50,0,0,0x5b2e85, 0xffffff,1,true)
	coordenada = 0
	while coordenada ~= 800 do
		tfm.exec.addShamanObject (33, coordenada, 0, 0, 0, 0)
		coordenada = coordenada + 25
	end 
end
		
if random == 79 then

	ui.addTextArea(1,"Enciendan la luz",nil,50,50,0,0,0x00,0xffffff,1,true)
	
	for name,player in pairs(tfm.get.room.playerList) do
		tfm.exec.setPlayerNightMode(name)
	end
end

if random == 80 then

	ui.addTextArea(1,"Ratones pesados",nil,50,50,0,0,0x3b1a00,0x855e40,1,true)

	for name,player in pairs(tfm.get.room.playerList) do
		tfm.exec.setPlayerGravityScale(name,1.5)
	end
end
	
if random == 81 then

	ui.addTextArea(1,"Ratones livianos",nil,50,50,0,0,0x402713,0x947156,1,true)

	for name,player in pairs(tfm.get.room.playerList) do
		tfm.exec.setPlayerGravityScale(name,0.2)
	end
end


if random == 82 then

	ui.addTextArea(1,"Obesidad morbida",nil,50,50,0,0,0x1c0c00,0x402c1d,1,true)

	for name,player in pairs(tfm.get.room.playerList) do
		tfm.exec.setPlayerGravityScale(name,10)
	end
end

if random == 83 then

	ui.addTextArea(1,"Super salto",nil,50,50,0,0,0x664822,0xd48117,1,true)

	for name,player in pairs(tfm.get.room.playerList) do
		tfm.exec.setPlayerGravityScale(name,0.4)
	end
end

if random == 84 then

 	ui.addTextArea(1,"Bootcamp",nil,50,50,0,0,0x172b01,0x402a0a,1,true)
			
	newMap = math.random(#bootcamps)
	tfm.exec.newGame(bootcamps[newMap])
	tfm.exec.setGameTime(300, true)
end

if random == 85 then

 	ui.addTextArea(1,"Defilante",nil,50,50,0,0,0x022366,0xc2a804,1,true)
			
	newMap = math.random(#defilante)
	tfm.exec.newGame(defilante[newMap])
end

if random == 86 then

 	ui.addTextArea(1,"Survivor",nil,50,50,0,0,0x1a1919,0x696868,1,true)
			
	newMap = math.random(#survivor)
	tfm.exec.newGame(survivor[newMap])
end		

		
end
end
