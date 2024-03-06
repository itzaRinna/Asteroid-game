// Check if the instance is a big rock
if (sprite_index == spr_rock_big)
{
    instance_destroy(other); // Destroy the big rock
    effect_create_above(ef_explosion, x, y, 1, c_white); // Create an explosion effect

    direction = random(360); // Set a random direction

    // Check if the total number of big rocks is less than 12
    if (instance_number(obj_rock) < 12)
    {
        sprite_index = spr_rock_big; // Change sprite to big rock
        x = -100; // Move the big rock off-screen
        show_debug_message("Big rock destroyed and replaced.");
    }
    else
    {
        instance_destroy(); // If there are already 12 big rocks, destroy the big rock
        show_debug_message("Big rock destroyed as there are already 12.");
    }
}

// Increment points in obj_game if it exists and if the variable exists
if (instance_exists(obj_game)) {
    if (!variable_instance_exists(obj_game, "point")) {
        obj_game.point = 0; // Initialize point if it doesn't exist
        show_debug_message("Point variable initialized.");
    }
    obj_game.point += 50;
    show_debug_message("Points incremented.");
} else {
    show_debug_message("obj_game doesn't exist");
}

// Debug message to check the point value
show_debug_message("Current point value: " + string(obj_game.point));
