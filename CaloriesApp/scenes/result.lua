local composer = require("composer")
local scene = composer.newScene();

local widget = require("widget")

function scene:create(event)
	local sceneGroup = self.view

	display.newRect(sceneGroup, display.contentCenterX, display.contentCenterY, display.contentWidth ,display.contentHeight):setFillColor(37 / 255, 39 / 255, 46 / 255, 0.7)

	display.newRoundedRect(sceneGroup, display.contentCenterX, 490, 460, 620, 15):setFillColor(244 / 255)

	local okButton = widget.newButton {
		shape = 'roundedRect',
		radius = 5,
		width = 440, height = 70,
		left = 50, top = 720,
		fillColor = { default={ 0.2 },
		over={ 0, 149 / 255, 59 / 255 } },
		labelColor = { default={ 1 }, over={ 1 } },
		label = "Готово",
		fontSize = 32,

		 onPress = function(event)
		 	composer.hideOverlay("fade", 400)
		  end
		}

		sceneGroup:insert(okButton)

		function calculator()
			local formula
			if(sex == "мужской") then
				formula = (10 * weight + 6.25 * height - 5 * age + 5)
			elseif(sex == "женский") then
				formula = (10 * weight + 6.25 * height - 5 * age - 161)
			end
			v = formula * activity_factor / 24
			res = math.round(v * time / 60)
			return res
		end

		display.newText(sceneGroup, "Результат",
		display.contentCenterX, 230, "Obelix", 30)

		display.newImage(sceneGroup, "apple_icon.png", 105, 230)

		calc = calculator()
		display.newText({
			parent = sceneGroup,
			text = activity_name,
			x = display.contentCenterX,
			y = 360,
			fontSize = 30,
			width = 420,
			align = "center",
		})

		display.newText(sceneGroup, "Время",
		display.contentCenterX, 430, native.system, 32)
		display.newText(sceneGroup, time.." мин",
		display.contentCenterX, 470, native.system, 32)
		display.newText(sceneGroup, "Сожгли калорий",
		display.contentCenterX, 530, native.system, 32)
		display.newText(sceneGroup, calc,
		display.contentCenterX, 580, native.system, 52):setFillColor(0, 165 / 255, 80 / 255)

end

scene:addEventListener("create", scene);
return scene;