--[[
Display class

Author	: Abyasa Widiarta, Ikhsan Fanani

]]--

Display = gideros.class(Sprite)

local font = TTFont.new("font/consola.ttf", 48, true)

local bgColor = 0x3e3e3e
local textColor = 0xFFFFFF

function Display:init(x, y, width, height)
	self.charLimit = 10
	self.current = ""
	
	self.x = x
	self.y = y
	self.width = width
	self.height = height
	
	local shape = Shape.new()
	
	shape:setFillStyle(Shape.SOLID, bgColor, 1)
	shape:beginPath()
	shape:moveTo(0, 0)
	shape:lineTo(self.width, 0)
	shape:lineTo(self.width, self.height)
	shape:lineTo(0, self.height)
	shape:closePath()
	shape:endPath()
	
	shape:setX(self.x)
	shape:setY(self.y)
	
	self.monitor = shape;
	self:addChild(self.monitor)
	
	self.text = TextField.new(font, "0")
	
	self:updateVisualState()
end

function Display:process(char)
	if isNumber(char) then
		print("number")
		self:add(char)
	end
	if isOperator(char) then
		print("operator")
		
		if (self.current == nil or self.current == "") then
			Calculator:setOperator("0", char)
		else
			Calculator:setOperator(self.current, char)
		end
		
		self.current = ""
	end
	if isFunction(char) then
		if char == "C" then
			self:delete()
		elseif char == "H" then
			--print(char)
			sceneManager:changeScene("HistoryScene", 0.75, sceneManager.crossfade)
		end
	end
end

function Display:add(num)
	if (self.current == nil or self.current == "") then
		if num ~= "0" then
			self.current = tostring(num)
			self:updateVisualState()
		end
	elseif string.len(self.current) < self.charLimit then
		self.current = self.current .. tostring(num)
		self:updateVisualState()
	end
end

function Display:delete()
	if string.len(self.current) > 0 then
		print("delete")
		self.current = string.sub(self.current, 1, string.len(self.current)-1)
		self:updateVisualState()
	end
end

function Display:setText(txt)
	self.current = tostring(txt)
	self:updateVisualState()
end

function Display:setResult(txt)
	self.current = tostring(txt)
	self:updateVisualState()
	self.current = ""
end

function Display:updateVisualState()
	local text = "0"
	if self.current ~= "" and self.current ~= nil then
		text = self.current
	end
	
	if self:contains(self.text) then
		self:removeChild(self.text)
	end
	
	self.text = TextField.new(font, text)
	self.text:setTextColor(textColor)
	self.text:setPosition(self.width - 5 - self.text:getWidth(), self.y + self.height - 10)
	
	self:addChild(self.text)
end