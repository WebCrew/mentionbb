<?php

/**
 * 
 * !! Mention is a paid software. !!
 * !! The maker of this software: ParantezTech | https://www.r10.net/members/90047-scarecrow.html
 * !! No used Null. !!
 * !! As long as you are using a Null version, you will not be able to receive updates. !!
 *
 * !! The software uses ParFramework2, this infrastructure cannot be used by third parties or any other project can not be produced. !!
 * 
 */

ini_set('max_execution_time', 900);

$dir = __DIR__;
require($dir . '/bin/defs.php');

if (!file_exists(APPLICATION_SELF . '/vendor/autoload.php'))
{
    require(APPLICATION_SELF . '/vendorError.php');
    return;
}

/**
 * Run Application
 */
require(APPLICATION_SELF . '/vendor/autoload.php');
new \App\Mvc\Pub();

/**
 * Logger
 */
\App\Logger::ErrorLogger();
