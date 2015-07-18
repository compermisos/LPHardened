# iptables purge
  resources { "firewall":
    purge   => true
  }

  Firewall {
    before  => Class['fw::post'],
    require => Class['fw::pre'],
  }

  class { ['fw::pre', 'fw::post']: }

node 'Default' {
  $ssh_port = 22
  include fw
  include sshd
  include banner
  include chkrootkit
  include rkhunter
}


