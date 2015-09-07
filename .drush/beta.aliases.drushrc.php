<?php

if (!isset($drush_major_version)) {
  $drush_version_components = explode('.', DRUSH_VERSION);
  $drush_major_version = $drush_version_components[0];
}
// Site beta, environment dev
$aliases['dev'] = array(
  'root' => '/var/www/html/beta.dev/docroot',
  'ac-site' => 'beta',
  'ac-env' => 'dev',
  'ac-realm' => 'devcloud',
  'uri' => 'beta6yl7gzyycb.devcloud.acquia-sites.com',
  'remote-host' => 'free-4024.devcloud.hosting.acquia.com',
  'remote-user' => 'beta.dev',
  'path-aliases' => array(
    '%drush-script' => 'drush' . $drush_major_version,
  )
);
$aliases['dev.livedev'] = array(
  'parent' => '@beta.dev',
  'root' => '/mnt/gfs/beta.dev/livedev/docroot',
);

if (!isset($drush_major_version)) {
  $drush_version_components = explode('.', DRUSH_VERSION);
  $drush_major_version = $drush_version_components[0];
}
// Site beta, environment test
$aliases['test'] = array(
  'root' => '/var/www/html/beta.test/docroot',
  'ac-site' => 'beta',
  'ac-env' => 'test',
  'ac-realm' => 'devcloud',
  'uri' => 'betaw8usv9xgqs.devcloud.acquia-sites.com',
  'remote-host' => 'free-4024.devcloud.hosting.acquia.com',
  'remote-user' => 'beta.test',
  'path-aliases' => array(
    '%drush-script' => 'drush' . $drush_major_version,
  )
);
$aliases['test.livedev'] = array(
  'parent' => '@beta.test',
  'root' => '/mnt/gfs/beta.test/livedev/docroot',
);
