local composer = require("composer")
local scene = composer.newScene();

function scene:show(event)
	local sceneGroup = self.view

	local widget = require("widget")

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

-- Возраст
------------------------------------------------------------------
local ageGroup = display.newGroup()

display.newCircle(ageGroup, display.contentCenterX, 374, 60):setFillColor(244/255)

display.newRoundedRect(ageGroup, display.contentCenterX, 410, w, 100, 15):setFillColor(244/255)

display.newText(ageGroup, "Укажите возраст", display.contentCenterX, 390, "Obelix", 22)

local myAge = display.newText({
  parent = ageGroup,
  fontSize = 50,
  text = age,
  x = display.contentCenterX,
  y = 343,
  font = "SuezOne",
})

myAge:setFillColor(186 / 255, 98 / 255, 98 / 255)

ageSlider = widget.newSlider {
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
  top = 405,
  left = 91,
  width = 360,
  height = 47,
  orientation = "horizontal",
  value = 100 * (age - ageMin) / (ageMax - ageMin),
  listener = function(event)
      age = math.round(ageMin + (ageMax - ageMin) * event.value / 100)
      myAge.text = age
  end
}

ageGroup:insert(ageSlider)

ageMinusButton = widget.newButton {
  shape = 'roundedRect',
  radius = 5,
  width = 50, height = 50,
  left = 19, top = 390,
  fontSize = 40,
  fillColor = { default={ 76 / 255 }, over={ 150 / 255 } },
  labelColor = { default={ 1 }, over={ 0 } },
  label = "-",

  onPress = function(event)
      if (age > ageMin) then
          age = age - 1
          myAge.text = age
          ageSlider:setValue(100 * (age - ageMin) / (ageMax - ageMin))
      end
  end
}

agePlusButton = widget.newButton {
  shape = 'roundedRect',
  radius = 5,
  width = 50, height = 50,
  left = 462, top = 390,
  fontSize = 40,
  fillColor = { default={ 76 / 255 }, over={ 150 / 255 } },
  labelColor = { default={ 1 }, over={ 0 } },
  label = "+",

  onPress = function(event)
      if (age < ageMax) then
          age = age + 1
          myAge.text = age
          ageSlider:setValue(100 * (age - ageMin) / (ageMax - ageMin))
      end
  end
}

	ageGroup:insert(ageMinusButton)
	ageGroup:insert(agePlusButton)

-- Рост
------------------------------------------------------------------
local heightGroup = display.newGroup()

display.newCircle(heightGroup, display.contentCenterX, 224, 60):setFillColor(244/255)

display.newRoundedRect(heightGroup, display.contentCenterX, 260, w, 100, 15):setFillColor(244/255)

display.newText(heightGroup, "Укажите рост в см", display.contentCenterX, 240, "Obelix", 22)

local myHeight = display.newText({
  parent = heightGroup,
  fontSize = 50,
  text = height,
  x = display.contentCenterX,
  y = 193,
  font = "SuezOne",
})

myHeight:setFillColor(186 / 255, 98 / 255, 98 / 255)

heightSlider = widget.newSlider {
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
  top = 250,
  left = 91,
  width = 360,
  height = 47,
  orientation = "horizontal",
  value = 100 * (height - heightMin) / (heightMax - heightMin),
  listener = function(event)
      height = math.round(heightMin + (heightMax - heightMin) * event.value / 100)
      myHeight.text = height
  end
}

heightGroup:insert(heightSlider)

heightMinusButton = widget.newButton {
  shape = 'roundedRect',
  radius = 5,
  width = 50, height = 50,
  left = 19, top = 240,
  fontSize = 40,
  fillColor = { default={ 76 / 255 }, over={ 150 / 255 } },
  labelColor = { default={ 1 }, over={ 0 } },
  label = "-",

  onPress = function(event)
      if (height > heightMin) then
          height = height - 1
          myHeight.text = height
          heightSlider:setValue(100 * (height - heightMin) / (heightMax - heightMin))
      end
  end
}

heightPlusButton = widget.newButton {
  shape = 'roundedRect',
  radius = 5,
  width = 50, height = 50,
  left = 462, top = 240,
  fontSize = 40,
  fillColor = { default={ 76 / 255 }, over={ 150 / 255 } },
  labelColor = { default={ 1 }, over={ 0 } },
  label = "+",

  onPress = function(event)
      if (height < heightMax) then
          height = height + 1
          myHeight.text = height
          heightSlider:setValue(100 * (height - heightMin) / (heightMax - heightMin))
      end
  end
}

	heightGroup:insert(heightMinusButton)
	heightGroup:insert(heightPlusButton)

-- Время
------------------------------------------------------------------
local timeGroup = display.newGroup()

display.newCircle(timeGroup, display.contentCenterX, 524, 60):setFillColor(244/255)

display.newRoundedRect(timeGroup, display.contentCenterX, 560, w, 100, 15):setFillColor(244/255)

display.newText(timeGroup, "Укажите время в минутах", display.contentCenterX, 540, "Obelix", 22)

local myTime = display.newText({
  parent = timeGroup,
  fontSize = 50,
  text = time,
  x = display.contentCenterX,
  y = 493,
  font = "SuezOne",
})

myTime:setFillColor(186 / 255, 98 / 255, 98 / 255)

timeSlider = widget.newSlider {
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
  top = 550,
  left = 91,
  width = 360,
  height = 47,
  orientation = "horizontal",
  value = 100 * (time - timeMin) / (timeMax - timeMin),
  listener = function(event)
      time = math.round(timeMin + (timeMax - timeMin) * event.value / 100)
      myTime.text = time
  end
}

timeGroup:insert(timeSlider)

timeMinusButton = widget.newButton {
  shape = 'roundedRect',
  radius = 5,
  width = 50, height = 50,
  left = 19, top = 540,
  fontSize = 40,
  fillColor = { default={ 76 / 255 }, over={ 150 / 255 } },
  labelColor = { default={ 1 }, over={ 0 } },
  label = "-",

  onPress = function(event)
      if (time > timeMin) then
          time = time - 1
          myTime.text = time
          timeSlider:setValue(100 * (time - timeMin) / (timeMax - timeMin))
      end
  end
}

timePlusButton = widget.newButton {
  shape = 'roundedRect',
  radius = 5,
  width = 50, height = 50,
  left = 462, top = 540,
  fontSize = 40,
  fillColor = { default={ 76 / 255 }, over={ 150 / 255 } },
  labelColor = { default={ 1 }, over={ 0 } },
  label = "+",

  onPress = function(event)
      if (time < timeMax) then
          time = time + 1
          myTime.text = time
          timeSlider:setValue(100 * (time - timeMin) / (timeMax - timeMin))
      end
  end
}

	timeGroup:insert(timeMinusButton)
	timeGroup:insert(timePlusButton)

	local activityGroup = display.newGroup()

	display.newRoundedRect(activityGroup, display.contentCenterX, 790, w, 60, 15):setFillColor(244/255)

	display.newPolygon(activityGroup, 500, 790, {500, 452, 520, 452, 510, 466}):setFillColor(76 / 255)

	activityText = display.newText(activityGroup, activity_name, display.contentCenterX, 790, native.system, 26)
	activityText:setFillColor(76 / 255)

	activityGroup:addEventListener("touch",
		function(event)
			composer.showOverlay("activity", {
				isModal = true,
				effect = "fade",
				time = 400,
			})
		end
		)

	local buttonCalc = widget.newButton {
		shape = 'roundedRect',
		radius = 5,
		width = w,
		height = 70,
		left = 10,
		top = 870,
		fillColor = { default={ 245 / 255, 77 / 255, 128 / 255 },
		over={ 0, 149 / 255, 59 / 255 } },
		labelColor = { default={ 1 }, over={ 1 } },
		label = "Считать калории",
		fontSize = 32,

		 onPress = function(event)
		 	composer.showOverlay("result", {
		 		isModal = true,
		 		effect = "fade",
		 		time = 400,
		 	})
		  end
		}

	--Вставка в sceneGroup
	sceneGroup:insert(weightGroup)
	sceneGroup:insert(sexGroup)
	sceneGroup:insert(ageGroup)
	sceneGroup:insert(timeGroup)
	sceneGroup:insert(heightGroup)
	sceneGroup:insert(activityGroup)
	sceneGroup:insert(buttonCalc)

end

scene:addEventListener("show", scene);
return scene;