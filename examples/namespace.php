<?php
// А еще лучше начать использовать namespace'ы с автомотической загрузкой классов и тогда в этом плане наступит полная эйфория :). Хотя я сам и пользуюсь этим способом, код от этого лучше выглядеть не начинает :( вместо конструкции require*/include* появляется обратный слеш :(
// Ну, код 

use Vendor\App\Models;

$blog = new Blog();
$blog->posts[] = new Post();

// выглядит лучше чем

require_once 'lib/vendor/app/models/blog.php';
require_once 'lib/vendor/app/models/post.php';

$blog = new Vendor_App_Models_Blog();
$blog->posts[] = new Vendor_App_Models_Post();