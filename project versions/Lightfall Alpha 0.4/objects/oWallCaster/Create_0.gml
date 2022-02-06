/// @description generate casters for walls (only when in player bounds. this will save performance)
event_inherited();

polygon = polygon_from_instance(id);
// This is a static shadow caster (it never changes its polygon)
flags |= eShadowCasterFlags.Static;

ignored = false;