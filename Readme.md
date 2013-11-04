# Minneapolis Infracoders Presentation 2013-11-04

## Contents

* packer: Packer scripts to create the two different boxes the vagrant environment uses
* vagrant: Vagrant test environment that sets up three boxes.  One puppetmaster and two clients.
* pres: Reveal.js Presentation

## Known issues
* Initial convergence of nodes takes two puppet runs
* librarian-puppet has issues on Windows
* The mcollective module seems to have a bad metadata file that needs to be removed

## Prerequisites
* Vagrant
* Librarian Puppet
* Packer
* Virtualbox

## Running the vagrant environment
1. Build the boxes using the packer templates in the `packer` directory
2. Import the centos box as `centos-64` and the ubuntu box as `ubuntu-precise`
3. Change to the vagrant directory
4. Run `librarian-puppet install` this should create a modules directory
5. Remove the file `modules/mcollective/metadata.json` see bug.
6. Run `vagrant up`
7. After the boxes have all finished one puppet run provision again with `vagrant provision`
8. If all goes well you should have three configured boxes
