local AudioChannel = require("necro.audio.AudioChannel")
local Collision = require("necro.game.tile.Collision")
local CustomEntities = require("necro.game.data.CustomEntities")
local MinimapTheme = require("necro.game.data.tile.MinimapTheme")
local Ping = require("necro.client.Ping")


CustomEntities.register({

	-- General
	name = "ReliquaryChest",
	friendlyName = { name = "Reliquary" },
	editorCategoryChest = {},

	-- Entity
	position = {},

	-- Interaction
	collision = {
		mask = Collision.Type.OBJECT
	},
	pingable = {
		type = Ping.Type.CONTAINER
	},
	pingableShowContents = {},
	pingableCursorOffset = {
		offsetY = -4
	},

	-- Graphics
	rowOrder = {},
	positionalSprite = {
		offsetY = 6
	},
	visualExtent = {
		width = 24,
		height = 24,
		offsetY = 4
	},
	sprite = {
		texture = "mods/Reliquary/Sprites/ReliquaryChest.png"
	},
	spriteSheet = {},
	silhouette = {},
	visibility = {},
	visibilityRevealWhenLit = {},
	visibilityVisibleOnProximity = {},
	visibleByMonocle = {},
	contentsVisibleByMonocle = {},
	minimapStaticPixel = {
		color = MinimapTheme.Color.CHEST,
		depth = MinimapTheme.Depth.CHEST
	},

	-- Audio
	audioChannel = {
		mask = AudioChannel.Flag.SOURCE_OBJECT
	},
	soundDeath = {
		sound = "chestOpen"
	},
	hiddenUntilProximity = {
		sound = "chestAppear"
	},

	-- Chest
	chestLike = {},
	storage = {},
	storageDropOnDeath = {},
	interactable = {},
	interactableSelfDestruct = {},
	interactableResetDamageCountdown = {},
	interactableCancelBounceTween = {},
	dropTombstoneOnDeath = {
		entityType = "TombstoneInteractable"
	},

})
