class pulp::repo($ensure) {
  if $ensure == 'absent' {
    yumrepo { 'pulp-v2-stable':
      enabled => 'absent'
    }
  } else {
    if $ensure == 'disabled' {
      $enabled = 0
    } else {
      $enabled = 1
    }
    if $operatingsystem == 'Centos' {

      $url = "http://repos.fedorapeople.org/repos/pulp/pulp/stable/2/${operatingsystemmajrelease}Server/\$basearch/"

      yumrepo { 'pulp-v2-stable':
        enabled  => $enabled,
        baseurl  => $url,
        descr    => 'Pulp v2 Production Releases',
        gpgcheck => 0
      }
    } else {
      yumrepo { 'pulp-v2-stable':
        enabled  => $enabled,
        baseurl  => 'http://repos.fedorapeople.org/repos/pulp/pulp/stable/2/$releasever/$basearch/',
        descr    => 'Pulp v2 Production Releases',
        gpgcheck => 0
      }
    }
  }
}
