# Manage SSHD server
class sshd {
  package { 'openssh-server':
    ensure => installed,
  }
#  file { '/etc/ssh/sshd_config':
#    source  => 'puppet:///modules/sshd/sshd.conf',
#    owner   => 'root',
#    group   => 'root',
#    mode    => '0644',
#    require => Package['openssh-server'],
#    notify  => Service['sshd'],
#  }
  augeas { 'sshd_config':
    context => '/files/etc/ssh/sshd_config',
    changes => [
      #Port config
      'set Port 22',
      ###Security config###
      #disable ROOT login
      'set PermitRootLogin no',
      #force Passwords
      'set PermitEmptyPasswords no',
      #force Vercion 2
      'set Protocol 2',
      #banners
      'set PrintMotd yes',
      #issue.net banner
      'set Banner /etc/issue.net',
    ],
    require => Package['openssh-server'],
    notify  => Service['sshd'],
  }
  service {'sshd':
    name => $operatingsystem ? {
      Debian  => 'ssh',
      Ubuntu  => 'ssh',
      default => 'sshd',
    },
    ensure  => running,
    enable  => true,
#    require => [Package['openssh-server'],File['/etc/ssh/sshd_config']],
    require => [Package['openssh-server'],Augeas['sshd_config']],
  }
}
