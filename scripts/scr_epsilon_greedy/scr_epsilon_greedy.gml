/// Script: epsilon_greedy(state_index)
/// state_index: index of the current state (row in the Q-table)
function epsilon_greedy(obj, state_index) 
{
    // Get epsilon (exploration probability)
    var epsilon = obj.epsilon;
    var action_index;
    // Generate a random number between 0 and 1
    if (random(1) < epsilon) {
        category = "exploring";
        // Exploration: select a random action
        action_index = irandom(global.n_actions - 1);
    } else {
        category = "exploiting";
        // Exploitation: select the best action according to Q(s, a)
        var max_value = -99999999; // Initialize with a very low value
        var best_actions = [];

        // Find the action with the highest Q(s, a) value
        for (var a = 0; a < global.n_actions; a++) {
            var q_value = ds_grid_get(global.q_table, state_index, a);
            if (q_value > max_value) {
                max_value = q_value;
                best_actions = [a];
            } else if (q_value == max_value) {
                array_push(best_actions, a); // Add tied action
            }
        }
        // Choose a random action among the best
        action_index = best_actions[irandom(array_length(best_actions) - 1)];
    }

    // Return the index of the selected action
    return action_index;
}
