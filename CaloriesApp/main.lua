weightMin = 40
weightMax = 140
weight = weightMin

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