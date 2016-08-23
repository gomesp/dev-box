include git
include ohmyzsh
ohmyzsh::install { 'vagrant': }
ohmyzsh::theme { 'vagrant': theme => 'robbyrussell' }
ohmyzsh::plugins { 'vagrant': plugins => 'git github bundler docker git-flow' }
