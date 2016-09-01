class { 'apt':
  update => {
    frequency => 'always',
  },
}

include 'java'
java::oracle { 'jdk8' :
  ensure  => 'present',
  version => '8',
  java_se => 'jdk',
}

include 'git'
include 'ohmyzsh'
ohmyzsh::install { 'vagrant': }
ohmyzsh::theme { 'vagrant': theme => 'robbyrussell' }
ohmyzsh::plugins { 'vagrant': plugins => 'git github bundler docker git-flow' }
