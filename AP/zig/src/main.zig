const std = @import("std");
const ErrorValue = error{
    NotAP,
};

// TODO sumAllElementsAP
// To know the sum of all elements of an AP
// SumAllElements = length_number_list / 2 (2number_list[0] + (length_number_list - 1) common_diff)
fn sumAllElementsAP(num_elem: usize, number_list: []i64, common_diff: i64) void {
    _ = common_diff;
    _ = number_list;
    _ = num_elem;
}

// TODO memberExpressionAP
// To know some member value
// number_list[i] = number_list[0] + (length_number_list - 1) common_diff
// i is the term, number_list[0] is the first term and common_diff is the difference number between the number
fn memberExpressionAP(num_elem: usize, number_list: []i64, common_diff: i64) void {
    _ = number_list;
    _ = common_diff;
    _ = num_elem;
}

// common_diff must be a constant value to define an Arithmethic Progression
fn checkIfIsAnAP(number_list: []const i64) ErrorValue!void {
    if (number_list.len < 2) {
        std.debug.print("The list is too short to be an AP", .{});
        return;
    }
    const common_diff = number_list[1] - number_list[0];

    for (number_list, 0..) |value, index| {
        if (index == 0 or number_list[index] == number_list[number_list.len - 1]) {
            continue;
        }
        var diff_with_next = number_list[index + 1] - value;
        if (diff_with_next != common_diff) {
            std.debug.print("That is not an AP", .{});
            return;
        }
    }
    std.debug.print("That is an AP because the common_diff is {d}", .{common_diff});
}

fn checkIfIsAnAPFloat(number_list: []const f64) ErrorValue!void {
    if (number_list.len < 2) {
        std.debug.print("The list is too short to be an AP", .{});
        return;
    }
    const common_diff = number_list[1] - number_list[0];

    for (number_list, 0..) |value, index| {
        if (index == 0 or number_list[index] == number_list[number_list.len - 1]) {
            continue;
        }
        var diff_with_next = number_list[index + 1] - value;
        if (diff_with_next != common_diff) {
            std.debug.print("That is not an AP", .{});
            return error.NotAP;
        }
    }
    std.debug.print("That is an AP because the common_diff is {d}", .{common_diff});
}
pub fn main() void {
    const testlist = [_]f64{ 1.5, 3, 4.5, 6, 7.5, 9 };
    checkIfIsAnAPFloat(&testlist);
}

test "Check AP with integer numbers list " {
    const integer_number_list = [_]i64{ 5, 10, 15, 20, 25, 30 };
    try checkIfIsAnAP(&integer_number_list);
}

test "Check AP with integer numbers list with innvalid exoression" {
    const integer_number_list = [_]i64{ 5, 10, 15, 20, 25, 30 };
    try checkIfIsAnAP(&integer_number_list);
}

test "Check AP with float numbers list " {
    const float_number_list = [_]f64{ 1.5, 3, 4.5, 6, 7.5, 9 };
    try checkIfIsAnAPFloat(&float_number_list);
}

test "Check AP with float numbers list with invalid progression " {
    const float_number_list = [_]f64{ 1.5, 3, 4.5, 5, 7.5, 9 };
    var error_ap = checkIfIsAnAPFloat(&float_number_list);
    std.debug.assert(error_ap == ErrorValue.NotAP);
}
