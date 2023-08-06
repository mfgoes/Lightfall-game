 /// @description Insert description here
// Create a new tilemap layer
if (live_call()) return live_result;

// Get the tilemap layer id
var layer_id = layer_get_id("Tiles_1");
var tilemap_id = layer_tilemap_get_id(layer_id);

// Set the tiles
tilemap_set(tilemap_id, 0, 0, 0);  // First tile in the tileset
tilemap_set(tilemap_id, 1, 1, 0);  // Second tile in the tileset
tilemap_set(tilemap_id, 2, 2, 0);  // Third tile in the tileset