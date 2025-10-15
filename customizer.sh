#!/bin/bash
#
# Created by: jimmy.nguyen.goldenowl@gmail.com
# Copyright © 2015 - 2023 Golden Owl Consulting
# Contact us: https://goldenowl.asia/
#

# Verify bash version. macOS comes with bash 3 preinstalled.
if [[ ${BASH_VERSINFO[0]} -lt 4 ]]
then
  echo "You need at least bash 4 to run this script."
  exit 1
fi

# exit when any command fails
set -e

if [[ $# -lt 1 ]]; then
   echo "Usage: bash customizer.sh my.new.package" >&2
   exit 1
fi

PACKAGE=$1
SUBDIR=${PACKAGE//.//} # Replaces . with /
oldPackage="com.pingak9.template"
oldPackageFolder=${oldPackage//.//}

for n in $(find . -type d \( -path '*/src/androidTest' -or -path '*/src/main' -or -path '*/src/test' \) )
do
  echo "Creating $n/kotlin/$SUBDIR"
  mkdir -p $n/kotlin/$SUBDIR
  echo "Moving files to $n/kotlin/$SUBDIR"
  mv $n/kotlin/$oldPackageFolder* $n/kotlin/$SUBDIR
  echo "Removing old $n/kotlin/$oldPackageFolder"
  rm -rf mv $n/kotlin/$oldPackageFolder
done

# Rename package and imports
echo "Renaming packages to $PACKAGE"
find ./ -type f -name "*.kt" -exec sed -i.bak "s/package $oldPackage/package $PACKAGE/g" {} \;
find ./ -type f -name "*.kt" -exec sed -i.bak "s/import $oldPackage/import $PACKAGE/g" {} \;

# Other files
find ./ -type f -name "*.gradle" -exec sed -i.bak "s/$oldPackage/$PACKAGE/g" {} \;
find ./ -type f -name "AndroidManifest.xml" -exec sed -i.bak "s/$oldPackage/$PACKAGE/g" {} \;
find ./ -type f -name "project.pbxproj" -exec sed -i.bak "s/$oldPackage/$PACKAGE/g" {} \;


echo "Cleaning up"
find . -name "*.bak" -type f -delete

# Remove additional files
echo "Removing additional files"
mv README-SAMPLE.md README.md
rm -rf .git
rm -rf customizer.sh
rm -rf ./resources
echo "Done!"
