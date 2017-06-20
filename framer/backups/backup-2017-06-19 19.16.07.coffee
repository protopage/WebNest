# Import file "PrototypeOld"
sketch = Framer.Importer.load("imported/PrototypeOld@1x", scale: 1)

{old, masker, settingsOld, analyticsZoneOld, seoZoneOld, analyticsOld, seoSettingsOld, addNewOld, headlineZoneOld, topBarOld, addNewZone, settingsZone, settingsBack, addNewBack, seoBack, analyticsBack} = sketch

# Document Setup
document.body.style.cursor = "auto"
Framer.Extras.Hints.disable()
Framer.Extras.Preloader.enable()


old.x = Align.center

hide = [settingsOld, seoSettingsOld, analyticsOld, addNewOld]

for layer in hide
	layer.visible = false

zones = [addNewZone, settingsZone, analyticsZoneOld, seoZoneOld, headlineZoneOld]
responders = [addNewOld, settingsOld, analyticsOld, seoSettingsOld, masker]

create = (i) ->
	zones[i].onClick ->
		responders[i].visible = true

for layer, i in zones
	create(i)


one = [addNewBack, settingsBack]
two = [seoBack, analyticsBack]