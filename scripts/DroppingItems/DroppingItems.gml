// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DropAmmo(dropRate, dropAmount)
{
    if (random_range(0, dropRate) == 0)
    {
        var amount = argument_count > 1 ? dropAmount : 1; // Check if dropAmount is specified, otherwise default to 1
        repeat(amount)
        {
            // Create ammo drop
            instance_create_layer(x + random_range(-4, 4), bbox_top + 1 - random(4), "Bullets", oPickupParent);
        }
    }
}
