<?php

declare(strict_types=1);

use Hyperf\HttpServer\Router\Router;

Router::addRoute(['GET', 'POST', 'HEAD'], '/', 'App\Controller\UserController@userInfo');

Router::get('/favicon.ico', function () {
    return '';
});
