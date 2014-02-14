--[[
A generic button class
modified by Ikhsan Fanani

This code is MIT licensed, see http://www.opensource.org/licenses/mit-license.php
(C) 2010 - 2011 Gideros Mobile 
]]

Button = gideros.class(Sprite)

local font = TTFont.new("font/segoeui.ttf", 30, true)

function Button:init(x, y, value, type)
	
	self.width = 70
	self.height = 60
	self.x = x
	self.y = y
	self.label = value
	self.type = type
	
	self.textColorUp = 0xFFFFFF
	self.textColorDown = 0x8c8c8c
	
	self.upColor = 0x636363
	self.downColor = 0xFFFFFF
	
	self.upState = Shape.new()
	self.downState = Shape.new()
	
	self:initShape()
	
	-- register to all mouse and touch events
	self:addEventListener(Event.MOUSE_DOWN, self.onMouseDown, self)
	self:addEventListener(Event.MOUSE_MOVE, self.onMouseMove, self)
	self:addEventListener(Event.MOUSE_UP, self.onMouseUp, self)

	self:addEventListener(Event.TOUCHES_BEGIN, self.onTouchesBegin, self)
	self:addEventListener(Event.TOUCHES_MOVE, self.onTouchesMove, self)
	self:addEventListener(Event.TOUCHES_END, self.onTouchesEnd, self)
	self:addEventListener(Event.TOUCHES_CANCEL, self.onTouchesCancel, self)
end

function Button:initShape()
	if self:contains(self.upState) then
		self:removeChild(self.upState)
	end
	
	if self:contains(self.downState) then
		self:removeChild(self.downState)
	end
	
	self.upState = self:createShape(self.upColor)
	self.downState = self:createShape(self.downColor)
	
	if self.label then
		self.value = TextField.new(font, self.label)
		self.value:setTextColor(self.textColorUp)
		self.value:setPosition(self.x + self.width/2 - 7, self.y + self.height - 20)
	end
	self.focus = false
	
	-- set the visual state as up
	self:updateVisualState(false)
	if self.value and (not self:contains(self.value)) then
		self:addChild(self.value)
	end
end

function Button:createShape(color)
	local shape = Shape.new()
	
	shape:setFillStyle(Shape.SOLID, color, 1)
	shape:beginPath()
	shape:moveTo(0, 0)
	shape:lineTo(self.width, 0)
	shape:lineTo(self.width, self.height)
	shape:lineTo(0, self.height)
	shape:closePath()
	shape:endPath()
	
	shape:setX(self.x)
	shape:setY(self.y)
	
	return shape
end

function Button:setSize(w, h)
	self.width = w
	self.height = h
	
	self:initShape()
end

function Button:setUpTextColor(color)
	self.textColorUp = color
	self:initShape()
end

function Button:setUpButtonColor(color)
	self.upColor = color
	self:initShape()
end

function Button:getLabel()
	return self.label
end

function Button:onMouseDown(event)
	if self:hitTestPoint(event.x, event.y) then
		self.focus = true
		self:updateVisualState(true)
		event:stopPropagation()
	end
end

function Button:onMouseMove(event)
	if self.focus then
		if not self:hitTestPoint(event.x, event.y) then
			self.focus = false;
			self:updateVisualState(false)
		end
		event:stopPropagation()
	end
end

function Button:onMouseUp(event)
	if self.focus then
		self.focus = false;
		self:updateVisualState(false)
		self:dispatchEvent(Event.new("click"))
		
		Monitor:process(self.label)
		--Calculator:process(self.label)
		
		event:stopPropagation()
	end
end

-- if button is on focus, stop propagation of touch events
function Button:onTouchesBegin(event)
	if self.focus then
		event:stopPropagation()
	end
end

-- if button is on focus, stop propagation of touch events
function Button:onTouchesMove(event)
	if self.focus then
		event:stopPropagation()
	end
end

-- if button is on focus, stop propagation of touch events
function Button:onTouchesEnd(event)
	if self.focus then
		event:stopPropagation()
	end
end

-- if touches are cancelled, reset the state of the button
function Button:onTouchesCancel(event)
	if self.focus then
		self.focus = false;
		self:updateVisualState(false)
		event:stopPropagation()
	end
end

-- if state is true show downState else show upState
function Button:updateVisualState(state)
	if state then
		if self:contains(self.upState) then
			self:removeChild(self.upState)
			if self.value and (self:contains(self.value)) then
				self:removeChild(self.value)
			end
		end

		if not self:contains(self.downState) then
			self:addChild(self.downState)
			if self.value and (not self:contains(self.value)) then
				self:addChild(self.value)
				self.value:setTextColor(self.textColorDown)
			end
		end
	else
		if self:contains(self.downState) then
			self:removeChild(self.downState)
			if self.value and (self:contains(self.value)) then
				self:removeChild(self.value)
			end
		end

		if not self:contains(self.upState) then
			self:addChild(self.upState)
			if self.value and (not self:contains(self.value)) then
				self:addChild(self.value)
				self.value:setTextColor(self.textColorUp)
			end
		end
	end
end