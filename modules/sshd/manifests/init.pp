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
      #user jail
      'set UsePrivilegeSeparation yes',
      #permit pubkey auth
      'set PubkeyAuthentication yes',
      #permit password login
      'set PasswordAuthentication no',
      #challenge response
      'set ChallengeResponseAuthentication no',
      #banners
      'set PrintMotd yes',
      #issue.net banner
      'set Banner /etc/issue.net',
      #Secure SSH Server based in https://stribika.github.io/2015/01/04/secure-secure-shell.html
      'set KexAlgorithms curve25519-sha256@libssh.org,diffie-hellman-group-exchange-sha256',
      'set Ciphers chacha20-poly1305@openssh.com,aes256-gcm@openssh.com,aes128-gcm@openssh.com,aes256-ctr,aes192-ctr,aes128-ctr',
      'set MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-ripemd160-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-512,hmac-sha2-256,hmac-ripemd160,umac-128@openssh.com',
      
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
  firewall { '100 allow openssh':
    chain   => 'INPUT',
    state   => ['NEW'],
    dport   => '22',
    proto   => 'tcp',
    action  => 'accept',
  } 
}
