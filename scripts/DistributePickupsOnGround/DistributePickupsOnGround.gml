/// DistributePickupsOnGround(offsetX, moveAmount)
/// Distributes pickups evenly on the ground to prevent overlapping.
/// offsetX: The maximum distance between pickups horizontally.
/// moveAmount: The distance to move pickups horizontally and vertically.

/// Example usage: DistributePickupsOnGround(32, 5);

function DistributePickupsOnGround(offsetX, moveAmount)
{
    with (oPickupParent) {
        if (!adjusted) {
            var originalX = x;
            var originalY = y;

            // Move horizontally away from nearby pickups
            with (oPickupParent) {
                if (id != other.id) {
                    if (abs(x - originalX) < offsetX) {
                        if (x < originalX) {
                            x -= moveAmount;
                        } else {
                            x += moveAmount;
                        }
                    }
                }
            }

            // Adjust vertically to avoid overlapping
            var collision = true;
            while (collision) {
                collision = false;
                with (oPickupParent) {
                    if (id != other.id) {
                        if (place_meeting(x, y, id)) {
                            y -= moveAmount;
                            collision = true;
                            break;
                        }
                    }
                }
            }

            adjusted = true;
        }
    }
}