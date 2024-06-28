local AudioChannel = require("necro.audio.AudioChannel")
local Collision = require("necro.game.tile.Collision")
local CustomEntities = require("necro.game.data.CustomEntities")
local MinimapTheme = require("necro.game.data.tile.MinimapTheme")
local Ping = require("necro.client.Ping")


CustomEntities.extend({

	name = "ReliquaryMimic",
	template = CustomEntities.template.enemy("trapchest"),

	components = {
		friendlyName = { name = "Reliquary Mimic" },

		sprite = {
			texture = "mods/Reliquary/Sprites/ReliquaryMimic.png",
			height = 30
		},
		positionalSprite = {
			offsetY = 2
		},

		storage = {},
		storageGenerateItemPool = false,

		bestiary = false,
		enemyUnlockOnDeath = false
	}

})
