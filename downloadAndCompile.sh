#! /bin/sh

echo "Downloading frameworks..."
sh ./downloadFrameworks.sh
echo "Updating submodules..."
git submodule update --init --recursive
echo "Compiling Python 3.9..."
sh ./buildAllArchitectures.sh
echo "Creating Python frameworks..."
sh ./createFrameworks.sh
echo "Creating module frameworks..."
sh ./createModuleFrameworks.sh

# If we upload all packages to a repository, uncomment and create Package.swift 
# createPackage_swift.sh


