<?php

if (!isset($databases)) {
    $databases = array();
}

$databases['default']['default'] = array(
    'driver' => 'mysql',
    'database' => 'pantheon',
    'username' => 'root',
    'password' => '',
    'host' => 'wb-www-mysql',
    'port' => 17613 );