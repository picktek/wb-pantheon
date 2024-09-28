<?php

$settings['trusted_host_patterns'] = [
    '^wb-pantheon\.local$',
];

if (!isset($databases)) {
    $databases = array();
}

$settings['hash_salt'] = 'tdGHVg8dVRiiGGz3q5OFKrq1tDVaibvrH-2z2ro_U2QlUU8Oi4aksXqbgZwuic9rP6upB1-fBw';

$databases['default']['default'] = array(
    'driver' => 'mysql',
    'database' => 'pantheon',
    'username' => 'root',
    'password' => '',
    'host' => 'wb-www-mysql',
    'port' => 17613
);