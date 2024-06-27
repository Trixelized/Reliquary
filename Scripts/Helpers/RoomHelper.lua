local ProceduralLevel = require("necro.game.data.level.ProceduralLevel")
local Collision = require("necro.game.tile.Collision")
local RNG = require("necro.game.system.RNG")
local RNG_Rooms = RNG.Channel.extend("TrixLib_RNG_Rooms")


-- Prepare the module
local RoomHelper = {}


-- Module variables
RoomHelper.room_list = {}


-- Local variables
local fallback_room_type = ProceduralLevel.RoomType.STANDARD
local fallback_mask = Collision.Group.ENEMY_PLACEMENT


-- Get all rooms of a certain room type
function RoomHelper.get_all_rooms_of_type(room_type)

	room_type = room_type or fallback_room_type

	local found_rooms = {}

	for _, room in ipairs(RoomHelper.room_list) do
		if room.type == room_type then
			table.insert(found_rooms, room)
		end
	end

	return found_rooms

end


-- Get a random room of a certain type
function RoomHelper.get_random_room_of_type(room_type)

	room_type = room_type or fallback_room_type

	local found_rooms = RoomHelper.get_all_rooms_of_type(room_type)

	if #found_rooms > 0 then
		return RNG.choice(found_rooms, RNG_Rooms)
	else
		return nil
	end

end


-- Get all valid tiles in a room
function RoomHelper.get_valid_tiles_in_room(room, mask)

	mask = mask or fallback_mask

	local valid_tiles = {}

	for y = room.y, room.y + room.height - 1 do
		for x = room.x, room.x + room.width - 1 do

			local invalid = Collision.check(x, y, mask)

			if not invalid then
				table.insert(valid_tiles, {x = x, y = y})
			end

		end
	end

	return valid_tiles

end


-- Get a random valid tile in a room
function RoomHelper.get_random_valid_tile_in_room(room, mask)

	mask = mask or fallback_mask

	local found_tiles = RoomHelper.get_valid_tiles_in_room(room, mask)

	if #found_tiles > 0 then
		return RNG.choice(found_tiles, RNG_Rooms)
	else
		return nil
	end

end


-- Get a random valid tile in a room of a certain type
function RoomHelper.get_random_valid_tile_in_room_of_type(room_type, mask)

	room_type = room_type or fallback_room_type
	mask = mask or fallback_mask

	local found_room = RoomHelper.get_random_room_of_type(room_type)

	if found_room then
		return RoomHelper.get_random_valid_tile_in_room(found_room, mask)
	else
		return nil
	end

end


-- Fetch the rooms in the current level
event.levelLoad.add(
	"fetchRoomInfo",
	"currentLevel",
	function(ev)
		RoomHelper.room_list = ev.rooms or {}
	end
)


return RoomHelper
