# == Class: role_rsyslog
#
class role_rsyslog {

  # Install rsyslog server
  class { 'rsyslog::server':
    enable_tcp                => true,
    enable_udp                => true,
    enable_onefile            => true,
    server_dir                => '/srv/log/',
    custom_config             => 'role_rsyslog/server-custom.conf.erb',
    high_precision_timestamps => true,
  }
  
  # Create logrotate rule; rotate every hour, only if file is bigger than 500MB, keep 1 rotated files
  logrotate::rule { 'messages':
    path         => '/srv/log/messages',
    rotate       => 1,
    rotate_every => 'hour',
    size         => '500M',
    postrotate   => 'reload rsyslog >/dev/null 2>&1 || true',
  }
  
}
