# Manage SSHD server
class sshd {
  package { 'openssh-server':
    ensure => installed,
  }
  file { '/etc/ssh/sshd_config':
    source  => 'puppet:///modules/sshd/sshd.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['openssh-server'],
  }
  service {'ssh':
    ensure  => running,
    enable  => true,
    require => [Package['openssh-server'],File['/etc/ssh/sshd_config']],
  }
}

