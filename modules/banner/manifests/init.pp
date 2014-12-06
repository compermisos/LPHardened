# Manage SSHD server
class banner {
  file { '/etc/issue':
    source  => 'puppet:///modules/banner/issue.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
  file { '/etc/issue.net':
    source  => 'puppet:///modules/banner/issue.net.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
  file { '/etc/motd':
   name => $operatingsystem ? {
      Debian  => '/etc/motd.tail',
      Ubuntu  => '/etc/motd.tail',
      default => '/etc/motd',
    },
    source  => 'puppet:///modules/banner/motd.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}
