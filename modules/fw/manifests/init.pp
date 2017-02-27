class fw {
  file { '/etc/rsyslog.d/20-iptables.conf':
    source  => 'puppet:///modules/fw/syslog.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => File['/var/log/iptables.log'],
  }#
  file { '/etc/logrotate.d/iptables':
    source  => 'puppet:///modules/fw/logrotate.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => File['/etc/rsyslog.d/20-iptables.conf'],
  }
  file { '/var/log/iptables.log':
    owner   => 'syslog',
    group   => 'adm',
    mode    => '0640',
  }
}
