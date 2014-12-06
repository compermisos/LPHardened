# RKHunter
class rkhunter {
  package { 'rkhunter':
    ensure => installed,
  }
  cron{'rkhunter':
    command => '/usr/bin/rkhunter --append-log --cronjob',
    hour    => inline_template('<%= @hostname.sum % 24 %>'),
    minute  => '00'
  }
}
