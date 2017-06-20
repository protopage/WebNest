# Sketch
sketch = Framer.Importer.load("imported/PrototypeOld@4x", scale: 1)


{old, masker, settingsOld, analyticsZoneOld, seoZoneOld, analyticsOld, seoSettingsOld, addNewOld, headlineZoneOld, topBarOld, addNewZone, settingsZone, settingsBack, addNewBack, seoBack, analyticsBack, tagZone, facebookZone, gaZone, urlZone, metaZone, keywordsZone, pageTitleZone, pointerAddNew, pointerSettings, pointerTop, content} = sketch
# Document Setup
document.body.style.cursor = "auto"
Framer.Extras.Hints.disable()
Framer.Extras.Preloader.enable()
InputModule = require "input"
old.bringToFront()
old.x = Align.center
# Click Events
hide = [settingsOld, seoSettingsOld, analyticsOld, addNewOld]

for layer in hide
	layer.visible = false
initial = content.y
zones = [addNewZone, settingsZone, analyticsZoneOld, seoZoneOld]
responders = [[addNewOld, 152-48], [settingsOld, 151-48], [analyticsOld, 149-48], [seoSettingsOld, 195-48]]
one = [addNewBack, settingsBack]
two = [seoBack, analyticsBack]

createIn = (i) ->
	zones[i].onClick ->
		for layer in responders
			layer[0].visible = false
		responders[i][0].visible = true
		content.y = initial + responders[i][1]
		topBarOld.visible = false

createOut = (i) ->
	one[i].onClick ->
		topBarOld.visible = true
		content.y = initial
		for index in [0...2]
			responders[index][0].visible = false
	two[i].onClick ->
		topBarOld.visible = true
		content.y = initial
		for index in [2...4]
			responders[index][0].visible = false
		

for layer, i in zones
	createIn(i)

for i in [0...2]
	createOut(i)

headlineZoneOld.onClick ->
	masker.visible = false
	addNewOld.visible = false
	topBarOld.visible = true
	content.y = initial
# Text Inputs

pageTitle = new InputModule.Input
# 	setup: true
	parent: seoSettingsOld
	width: pageTitleZone.width
	height: pageTitleZone.height
	x: pageTitleZone.x+2
	y: pageTitleZone.y-6
	fontSize: 13
	lineHeight: 16
	padding: 0
	virtualKeyboard: false

pageTitle.style =
	color: "white"
	font: "Arial"

keywords = new InputModule.Input
# 	setup: true
	parent: seoSettingsOld
	width: keywordsZone.width
	height: keywordsZone.height
	x: keywordsZone.x+2
	y: keywordsZone.y-6
	fontSize: 13
	lineHeight: 16
	padding: 0
	virtualKeyboard: false

keywords.style =
	color: "white"
	font: "Arial"

meta = new InputModule.Input
# 	setup: true
	parent: seoSettingsOld
	width: metaZone.width
	height: metaZone.height
	x: metaZone.x+2
	y: metaZone.y
	fontSize: 13
	lineHeight: 16
	padding: 0
	type: "textArea"
	virtualKeyboard: false
meta.style =
	color: "white"
	font: "Arial"


url = new InputModule.Input
# 	setup: true
	parent: seoSettingsOld
	width: urlZone.width
	height: urlZone.height
	x: urlZone.x+2
	y: urlZone.y-6
	fontSize: 13
	lineHeight: 16
	padding: 0
	virtualKeyboard: false

url.style =
	color: "white"
	font: "Arial"


tag = new InputModule.Input
# 	setup: true
	parent: analyticsOld
	width: tagZone.width-6
	height: tagZone.height
	x: tagZone.x+6
	y: tagZone.y-7
	fontSize: 13
	lineHeight: 16
	padding: 0
	placeholder: "Google Tag Manager ID"
	placeholderColor: "#5a6a79"
	virtualKeyboard: false

tag.style =
	color: "white"
	font: "Arial"

ga = new InputModule.Input
# 	setup: true
	parent: analyticsOld
	width: gaZone.width-6
	height: gaZone.height
	x: gaZone.x+6
	y: gaZone.y-6
	fontSize: 13
	lineHeight: 16
	padding: 0
	placeholder: "Google Analytics ID"
	placeholderColor: "#5a6a79"
	virtualKeyboard: false

ga.style =
	color: "white"
	font: "Arial"

facebook = new InputModule.Input
# 	setup: true
	parent: analyticsOld
	width: facebookZone.width-6
	height: facebookZone.height
	x: facebookZone.x+6
	y: facebookZone.y-6
	fontSize: 13
	lineHeight: 16
	padding: 0
	placeholder: "Google Analytics ID"
	placeholderColor: "#5a6a79"
	virtualKeyboard: false

facebook.style =
	color: "white"
	font: "Arial"

# Affordances

pointers = [addNewZone, settingsZone, analyticsZoneOld, seoZoneOld, addNewBack, settingsBack, seoBack, analyticsBack, headlineZoneOld, pointerAddNew, pointerSettings, pointerTop]


createAffordances = (index) ->
	pointers[index].onMouseOver ->
		if pointers[index].visible == true
			document.body.style.cursor = "pointer"
	pointers[index].onMouseOut ->
		document.body.style.cursor = "auto"

for layer, i in pointers
	createAffordances(i)