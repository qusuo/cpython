#! /bin/sh

sh ./downloadFrameworks.sh
sh ./buildAllArchitectures.sh
sh ./createFrameworks.sh
sh ./createModuleFrameworks.sh

# If we upload all packages to a repository, uncomment and create Package.swift 
# createPackage_swift.sh

