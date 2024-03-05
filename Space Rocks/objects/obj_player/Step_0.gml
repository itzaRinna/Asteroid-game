// Define variables for sliding
var slide_factor = 0.95; // Factor determining how quickly the object slows down when no keys are pressed
var min_slide_speed = 0.05; // Minimum speed below which the object stops sliding

// Update the movement based on input
if (keyboard_check(vk_up)) {
    motion_add(image_angle, 0.1);
} else if (keyboard_check(vk_down)) {
    motion_add(image_angle, -0.1);
}

if (keyboard_check(vk_left)) {
    image_angle += 2.5;
}

if (keyboard_check(vk_right)) {
    image_angle -= 2.5;
}

// Apply sliding effect
if (!keyboard_check(vk_up) && !keyboard_check(vk_down) && !keyboard_check(vk_left) && !keyboard_check(vk_right)) {
    // Apply sliding only when no keys are pressed
    var current_speed = speed; // Store current speed
    if (current_speed != 0) {
        speed *= slide_factor; // Apply sliding factor
        // Ensure speed doesn't drop below a minimum threshold
        if (speed < min_slide_speed) {
            speed = 0; // Stop sliding if speed drops below the threshold
        }
    }
}

move_wrap(1, 1, 0);

if (mouse_check_button_pressed(mb_left)) {
    instance_create_layer(x + 0, y + 0, "Instances", obj_bullet);
}
