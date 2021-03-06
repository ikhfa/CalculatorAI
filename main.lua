--[[
	Nama Aplikasi	: CalculatorAI
	Author(s)		: Abyasa Widiarta (23513020)
					  Ikhsan Fanani (23513065)
]]--

sceneManager = SceneManager.new{
	["MainScene"] = MainScene,
	["HistoryScene"] = HistoryScene
}

stage:addChild(sceneManager)

sceneManager:changeScene("MainScene", 0.75, sceneManager.crossfade)

--[[
application:setBackgroundColor(0x292929)

local screenW = application:getContentWidth()
local screenH = application:getContentHeight()

local marginT = 20
local marginB = 30
local marginL = 10
local marginR = 10

local yspace = 5
local xspace = 5

Monitor = Display.new(marginL, marginT, 4*70+3*xspace, 90)
stage:addChild(Monitor)

Calculator = Calculator.new()
stage:addChild(Calculator)

local btn1 = Button.new(marginL, screenH - marginB - 2*60 - yspace, "1")
stage:addChild(btn1)

local btn2 = Button.new(marginL + xspace + 70, screenH - marginB - 2*60 - yspace, "2")
stage:addChild(btn2)

local btn3 = Button.new(marginL + 2*xspace + 2*70, screenH - marginB - 2*60 - yspace, "3")
stage:addChild(btn3)

local btnplus = Button.new(marginL + 3*xspace + 3*70, screenH - marginB - 2*60 - yspace, "+")
btnplus:setUpTextColor(0xA6A6A6)
stage:addChild(btnplus)

local btn4 = Button.new(marginL, screenH - marginB - 3*60 - 2*yspace, "4")
stage:addChild(btn4)

local btn5 = Button.new(marginL + xspace + 70, screenH - marginB - 3*60 - 2*yspace, "5")
stage:addChild(btn5)

local btn6 = Button.new(marginL + 2*xspace + 2*70, screenH - marginB - 3*60 - 2*yspace, "6")
stage:addChild(btn6)

local btnminus = Button.new(marginL + 3*xspace + 3*70, screenH - marginB - 3*60 - 2*yspace, "-")
btnminus:setUpTextColor(0xA6A6A6)
stage:addChild(btnminus)

local btn7 = Button.new(marginL, screenH - marginB - 4*60 - 3*yspace, "7")
stage:addChild(btn7)

local btn8 = Button.new(marginL + xspace + 70, screenH - marginB - 4*60 - 3*yspace, "8")
stage:addChild(btn8)

local btn9 = Button.new(marginL + 2*xspace + 2*70, screenH - marginB - 4*60 - 3*yspace, "9")
stage:addChild(btn9)

local btncross = Button.new(marginL + 3*xspace + 3*70, screenH - marginB - 4*60 - 3*yspace, "*")
btncross:setUpTextColor(0xA6A6A6)
stage:addChild(btncross)

local btnc = Button.new(marginL, screenH - marginB - 5*60 - 4*yspace, "C")
btnc:setUpTextColor(0xA6A6A6)
stage:addChild(btnc)

local btnce = Button.new(marginL + xspace + 70, screenH - marginB - 5*60 - 4*yspace, "CE")
btnce:setUpTextColor(0xA6A6A6)
stage:addChild(btnce)

local btnd = Button.new(marginL + 2*xspace + 2*70, screenH - marginB - 5*60 - 4*yspace, "D")
btnd:setUpTextColor(0xA6A6A6)
stage:addChild(btnd)

local btndiv = Button.new(marginL + 3*xspace + 3*70, screenH - marginB - 5*60 - 4*yspace, "/")
btndiv:setUpTextColor(0xA6A6A6)
stage:addChild(btndiv)

local btn0 = Button.new(marginL, screenH - marginB - 60, "0")
btn0:setSize(2*70 + xspace, 60)
stage:addChild(btn0)

local btndot = Button.new(marginL + 2*xspace + 2*70, screenH - marginB - 60, ".")
stage:addChild(btndot)

local btneq = Button.new(marginL + 3*xspace + 3*70, screenH - marginB - 60, "=")
btneq:setUpButtonColor(0x458500)
stage:addChild(btneq)
]]--