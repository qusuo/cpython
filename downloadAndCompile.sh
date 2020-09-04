#! /bin/sh

./downloadFrameworks.sh
./buildAllArchitectures.sh
./createFrameworks.sh
./createModuleFrameworks.sh

# If we upload all packages to a repository, uncomment and create Package.swift 
# createPackage_swift.sh

