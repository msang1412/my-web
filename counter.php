<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');

$counter_file = 'counter.txt';

// Đọc số lượt
if (file_exists($counter_file)) {
    $count = (int)file_get_contents($counter_file);
} else {
    $count = 0;
}

// Tăng counter nếu có ?increase=1
if (isset($_GET['increase'])) {
    $count++;
    file_put_contents($counter_file, $count);
}

// Xuất JSON giống Lanyard style
echo json_encode([
    "success" => true,
    "data" => [
        "script_name" => "Your Script",
        "total_executions" => $count,
        "author" => "Minh Sang",
        "github" => "https://github.com",
    ]
], JSON_PRETTY_PRINT);
