// Script assets have changed for v2.3.0 see

function PlayerStateRoll() {
    vsp = vsp + grv;
    hsp = lengthdir_x(speedRoll, facing_direction);

    moveDistanceRemaining = max(0, moveDistanceRemaining - speedRoll);

    // Change State
    if (moveDistanceRemaining <= 0 || roll_cooldown == 0) {
        state = PlayerStepMovement;
    }
}