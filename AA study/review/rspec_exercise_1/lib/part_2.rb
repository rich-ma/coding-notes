def hipsterfy(string)
	string = string.reverse()
	index = string.index(/[aeiou]/)
	if index
		string = string.slice(0...index) + string[(index + 1)..-1]
	end
	string.reverse()
end