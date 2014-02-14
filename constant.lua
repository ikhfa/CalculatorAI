numbers = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"}
operators = {"+", "-", "*", "/", "="}
functions = {"C", "D", "H"}

function isNumber(char)
	for key, value in pairs(numbers) do
        if value == char then return true end
    end
    return false
end

function isOperator(char)
	for key, value in pairs(operators) do
        if value == char then return true end
    end
    return false
end

function isFunction(char)
	for key, value in pairs(functions) do
        if value == char then return true end
    end
    return false
end