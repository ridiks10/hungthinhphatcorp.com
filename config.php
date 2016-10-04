<?php
// echo "<h1>Comming Soon<h1>";
// die();
// DIR HOST
define('DIR_HOST', 'C:\xampp\htdocs\hungthinhphatcorp.com/');
// HTTP
define('HTTP_SERVER', 'http://localhost/hungthinhphatcorp.com/');
// HTTPS
define('HTTPS_SERVER', 'http://localhost/hungthinhphatcorp.com/');

// DIR
define('DIR_APPLICATION', DIR_HOST. 'catalog/');
define('DIR_SYSTEM', DIR_HOST. 'system/');
define('DIR_LANGUAGE', DIR_HOST. 'catalog/language/');
define('DIR_TEMPLATE', DIR_HOST. 'catalog/view/theme/');
define('DIR_CONFIG', DIR_HOST. 'system/config/');
define('DIR_IMAGE', DIR_HOST. 'image/');
define('DIR_CACHE', DIR_HOST. 'system/cache/');
define('DIR_DOWNLOAD', DIR_HOST. 'system/download/');
define('DIR_UPLOAD', DIR_HOST. 'system/upload/');
define('DIR_MODIFICATION', DIR_HOST. 'system/modification/');
define('DIR_LOGS', DIR_HOST. 'system/logs/');

// DB
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_DATABASE', 'htp');
define('DB_PORT', '3306');
define('DB_PREFIX', 'sm_');