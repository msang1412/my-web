<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');

$counter_file = 'counter.txt';

if (file_exists($counter_file)) {
    $count = (int)file_get_contents($counter_file);
} else {
    $count = 0;
}

$count++; // Tăng lên 1 mỗi lần script gọi

file_put_contents($counter_file, $count);

echo json_encode([
    "status" => true,
    "total_executions" => $count
]);
