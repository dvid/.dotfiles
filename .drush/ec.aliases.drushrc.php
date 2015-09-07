<?php

/**
 * Local
 */
$aliases['cc.local'] = array(
  'uri' => 'default',
  'root' => '/www/ec/cc',
  'path-aliases' => array(
    '%dump-dir' => '/tmp'
  ),
);
$aliases['beta'] = array(
  'uri' => 'beta.local',
  'root' => '/Volumes/Vault/Dev/var/www/ec/beta/build',
  'path-aliases' => array(
    '%dump-dir' => '/tmp'
  ),
);
$aliases['eeas'] = array(
  'uri' => 'eeas.local',
  'root' => '/www/ec/eeas/platform',
  'path-aliases' => array(
    '%dump-dir' => '/tmp'
  ),
);

/**
 * CNECT
 */
$aliases['dae'] = array(
  'uri' => 'dae.local',
  'root' => '/www/ec/dae/docroot',
  'path-aliases' => array(
    '%dump-dir' => '/tmp'
  ),
);
// The site in sites/site1/
$aliases['d4eu'] = array(
  'uri' => 'd4eu.local',
  'root' => '/www/ec/d4eu/docroot',
  'path-aliases' => array(
    '%dump-dir' => '/tmp'
  ),
);

/**
 * Remote
 */
$aliases['beta.acquia'] = array(
  'uri' => 'beta',
  'root' => '/path/to/drupal',
  'remote-host' => 'example.com',
  'remote-user' => '[server_user]'
);
// The site in sites/site1/
$aliases['beta.play'] = array(
  'uri' => 'beta',
  'root' => '/path/to/drupal',
  'remote-host' => 'example.com',
  'remote-user' => '[server_user]'
);
