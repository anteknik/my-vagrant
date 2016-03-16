node 'zipset1', 'zipset2' {
  include zipset::mongodb  
}

node 'zipset3' {
  include zipset::mongodb  

  mongodb_replset { zipset:
  ensure  => present,
    members => ['192.168.50.101:27017', '192.168.50.102:27017', '192.168.50.103:27017']
  }

}

class zipset::mongodb {

  class {'::mongodb::globals':
    manage_package_repo => true,
  }
  ->class {'::mongodb::server':
    port    => 27017,
    replset => "zipset",
    bind_ip => ["0.0.0.0"]
  }

}
