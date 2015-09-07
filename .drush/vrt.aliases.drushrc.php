<?php

$aliases['radio1.dev'] = array(
     'uri' => 'dev.radio1.be',
     'root' => '/data/web/radio1/htdocs',
     'remote-host' => 'phpdev2.nwf',
     'remote-user' => 'polidod',
     'ssh-options' => '-o PasswordAuthentication=yes',
     'path-aliases' => array(
       '%drush-script' => '/home/polidod/drush/drush'
     ),
);

$aliases['radio2.dev'] = array(
     'uri' => 'dev.radio2.be',
     'root' => '/data/web/radio2/htdocs',
     'remote-host' => 'phpdev2.nwf',
     'remote-user' => 'polidod',
     'ssh-options' => '-o PasswordAuthentication=yes',
     'path-aliases' => array(
       '%drush-script' => '/home/polidod/drush/drush'
     ),
);
