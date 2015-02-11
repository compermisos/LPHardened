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
  include fw
  include sshd
  include banner
  include chkrootkit
  include rkhunter
}


