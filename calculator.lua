--[[
Calculator class

Author	: Abyasa Widiarta, Ikhsan Fanani

]]--

Calculator = gideros.class(Sprite)

function Calculator:init()
	self.operator = "+"
	self.left = 0
end

function Calculator:setOperator(num, operator)
	
	local result = 0;
	
	if operator == "=" then
		if self.operator == "+" then
			result = self.left + tonumber(num)
		elseif self.operator == "-" then
			result = self.left - tonumber(num)
		elseif self.operator == "*" then
			result = self.left * tonumber(num) 
		elseif self.operator == "/" then
			result = self.left / tonumber(num)
		end
		
		Monitor:setResult(result)
		self.left = 0
		self.operator = "+"
	else
		if self.operator == "+" then
			result = self.left + tonumber(num)
		elseif self.operator == "-" then
			result = self.left - tonumber(num)
		elseif self.operator == "*" then
			result = self.left * tonumber(num)
		elseif self.operator == "/" then
			result = self.left / tonumber(num)
		end
		
		Monitor:setText(result)
		self.left = result
		self.operator = operator
	end
end