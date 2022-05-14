local composer = require("composer")

weightMin = 30
weightMax = 140
weight = 60

ageMin = 12
ageMax = 98
age = ageMin

timeMin = 1
timeMax = 120
time = timeMin

heightMin = 100
heightMax = 200
height = heightMin

display.setStatusBar(display.HiddenStatusBar)
display.setDefault("background", 37/255, 39/255, 46/255)
display.setDefault("fillColor", 76 / 255)

w = display.contentWidth - 20

activity_name = "Ходьба 4 км/ч"
activity_factor = 3
activity_index = 147

composer.gotoScene("calc")