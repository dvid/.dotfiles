<?php

$aliases['radio1.dev'] = array(
     'uri' => 'xxx.radio1.be',
     'root' => '/www/radio1/htdocs',
     'remote-host' => 'phpdev2.nwf',
     'remote-user' => 'user',
     'ssh-options' => '-o PasswordAuthentication=yes',
     'path-aliases' => array(
       '%drush-script' => '/home/user/drush/drush'
     ),
);

$aliases['radio2.dev'] = array(
     'uri' => 'xxx.radio2.be',
     'root' => '/web/radio2/htdocs',
     'remote-host' => 'phpdev2.nwf',
     'remote-user' => 'user',
     'ssh-options' => '-o PasswordAuthentication=yes',
     'path-aliases' => array(
       '%drush-script' => '/home/user/drush/drush'
     ),
);
