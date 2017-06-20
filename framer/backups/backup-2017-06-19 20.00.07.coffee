# Sketch
sketch = Framer.Importer.load("imported/PrototypeOld@1x", scale: 1)

{old, masker, settingsOld, analyticsZoneOld, seoZoneOld, analyticsOld, seoSettingsOld, addNewOld, headlineZoneOld, topBarOld, addNewZone, settingsZone, settingsBack, addNewBack, seoBack, analyticsBack, tagZone, facebookZone, gaZone, urlZone, metaZone, keywordsZone, pageTitleZone} = sketch
# Document Setup
document.body.style.cursor = "auto"
Framer.Extras.Hints.disable()
Framer.Extras.Preloader.enable()
InputModule = require "input"

old.x = Align.center
# Click Events
hide = [settingsOld, seoSettingsOld, analyticsOld, addNewOld]

for layer in hide
	layer.visible = false

zones = [addNewZone, settingsZone, analyticsZoneOld, seoZoneOld]
responders = [addNewOld, settingsOld, analyticsOld, seoSettingsOld]
one = [addNewBack, settingsBack]
two = [seoBack, analyticsBack]

createIn = (i) ->
	zones[i].onClick ->
		for layer in responders
			layer.visible = false
		responders[i].visible = true

createOut = (i) ->
	one[i].onClick ->
		for index in [0...2]
			responders[index].visible = false
	two[i].onClick ->
		for index in [2...4]
			responders[index].visible = false

for layer, i in zones
	createIn(i)

for i in [0...2]
	createOut(i)

headlineZoneOld.onClick ->
	masker.visible = false
	addNewOld.visible = false



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

url.style =
	color: "white"
	font: "Arial"


analyticsOld.visible = true

