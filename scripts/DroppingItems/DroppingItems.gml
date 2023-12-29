/// @param dropRate The drop rate or chance of an ammo drop occurring.
///                Specify a lower value to increase the chance of a drop.
/// @param dropAmount The number of ammo drops to create.
///                   Specify an integer greater than or equal to 1.
///                   If not specified, defaults to 1.
function DropAmmo(dropRate, dropAmount)
{
   if (random(1) < dropRate) // Change the condition here
    {
        var amount = argument_count > 1 ? dropAmount : 1; // Check if dropAmount is specified, otherwise default to 1
        repeat(amount)
        {
            // Create ammo drop
            instance_create_layer(x + random_range(-4, 4), bbox_top + 1 - random(4), "Bullets", oPickupParent);
        }
    }
}

/// @param dropRate The drop rate or chance of a drop occurring.
///                Range of chance between 0 (0%) and 1 (100%)
/// @param dropAmount The number of ammo drops to create.
///                   Specify an integer greater than or equal to 1. ie if Rate is 5, it's 1 in 5. 
///                   If not specified, defaults to 1.
function DropAmmoOrHealth(dropRate, dropAmount, chanceAmmo) //chanceAmmo = probability of dropping ammo instead of health
{
   if (random(1) < dropRate) // Change the condition here
    {
        var amount = argument_count > 1 ? dropAmount : 1; // Check if dropAmount is specified, otherwise default to 1
        repeat(amount)
        {
            // Create ammo drop
            dd = instance_create_layer(x + random_range(-4, 4), bbox_top + 1 - random(4), "Bullets", oPickupParent);
			dd.pickup_type = 2; //health
			if random(1) < chanceAmmo dd.pickup_type = 0; //ammo (0 means 0% chance, 1 means 100% chance
        }
    }
}