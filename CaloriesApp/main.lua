local widget = require("widget")

weightMin = 40
weightMax = 140
weight = 60

display.setStatusBar(display.HiddenStatusBar)
display.setDefault("background", 37/255, 39/255, 46/255)
display.setDefault("fillColor", 76 / 255)

w = display.contentWidth - 20

local weightGroup = display.newGroup()

display.newCircle(weightGroup, display.contentCenterX, 74, 60):setFillColor(244/255)

display.newRoundedRect(weightGroup, display.contentCenterX, 110, w, 100, 15):setFillColor(244/255)

display.newText(weightGroup, "Укажите вес в кг", display.contentCenterX, 90, "Obelix", 22)

local myWeight = display.newText({
	parent = weightGroup,
	fontSize = 50,
	text = weight,
	x = display.contentCenterX,
	y = 43,
	font = "SuezOne",
})

myWeight:setFillColor(186 / 255, 98 / 255, 98 / 255)

local optionSlider = {
	frames = {
		{ x = 0, y = 0, width = 15, height = 45 },
		{ x = 16, y = 0, width = 130, height = 45 },
		{ x = 332, y = 0, width = 15, height = 45 },
		{ x = 153, y = 0, width = 15, height = 45 },
		{ x = 353, y = 0, width = 47, height = 47 },
	},
	sheetContentWidth = 400,
	sheetContentHeight = 45
}

weightSlider = widget.newSlider {
	sheet = graphics.newImageSheet("slider.png", optionSlider),
	leftFrame = 1,
	middleFrame = 2,
	rightFrame = 3,
	fillFrame = 4,
	handleFrame = 5,
	frameWidth = 15,
	frameHeight = 45,
	handleWidht = 45,
	handleHeight = 45,
	top = 110,
	left = 91,
	width = 360,
	height = 47,
	orientation = "horizontal",
	value = 100 * (weight - weightMin) / (weightMax - weightMin),
	listener = function(event)
		weight = math.round(weightMin + (weightMax - weightMin) *
			event.value / 100)
		myWeight.text = weight
	end
}

weightGroup:insert(weightSlider)

weightMinusButton = widget.newButton {
	shape = 'roundedRect',
	radius = 5,
	width = 50, height = 50,
	left = 19, top = 100,
	fontSize = 40,
	fillColor = { default={ 76 / 255 }, over={ 150 / 255 } },
	labelColor = { default={ 1 }, over={ 0 } },
	label = "-",

	onPress = function(event)
		if (weight > weightMin) then
			weight = weight - 1
			myWeight.text = weight
			weightSlider:setValue(100 * (weight - weightMin) / (weightMax - weightMin))
		end
	end
}

weightPlusButton = widget.newButton {
	shape = 'roundedRect',
	radius = 5,
	width = 50, height = 50,
	left = 462, top = 100,
	fontSize = 40,
	fillColor = { default={ 76 / 255 }, over={ 150 / 255 } },
	labelColor = { default={ 1 }, over={ 0 } },
	label = "+",

	onPress = function(event)
		if (weight < weightMax) then
			weight = weight + 1
			myWeight.text = weight
			weightSlider:setValue(100 * (weight - weightMin) / (weightMax - weightMin))
		end
	end
}

weightGroup:insert(weightMinusButton)
weightGroup:insert(weightPlusButton)


-------------------------------------

sex = "мужской"

local sexGroup = display.newGroup()

display.newRoundedRect(sexGroup, display.contentCenterX, 680, w, 120, 10):setFillColor(244 / 255)
display.newText(sexGroup, "Укажите пол", 115, 660, "Obelix", 24)

sexSelect = display.newText(sexGroup, sex, 105, 700, "Obelix", 18)
sexSelect:setFillColor(100 / 255)

maleOn = display.newImage(sexGroup, "male_active.png", 300, 680)
maleOff = display.newImage(sexGroup, "male.png", 300, 680)

femaleOn = display.newImage(sexGroup, "female_active.png", 440, 680)
femaleOff = display.newImage(sexGroup, "female.png", 440, 680)

if(sex == "мужской") then
	maleOff.isVisible = false
	femaleOn.isVisible = false
else
	maleOn.isVisible = false
	femaleOff.isVisible = false
end

function selectMale(event)
	if(event.phase == "began") then
		sex = "мужской"
		sexSelect.text = sex
		maleOn.isVisible = true
		maleOff.isVisible = false
		femaleOn.isVisible = false
		femaleOff.isVisible = true
	end
	return true
end

function selectFemale(event)
	if(event.phase == "began") then
		sex = "женский"
		sexSelect.text = sex
		maleOn.isVisible = false
		maleOff.isVisible = true
		femaleOn.isVisible = true
		femaleOff.isVisible = false
	end
	return true
end

maleOff:addEventListener("touch", selectMale)
femaleOff:addEventListener("touch", selectFemale)










