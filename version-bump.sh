#!/bin/bash

# VersionBump takes two arguments, the version number (e.g. 1.0.3) and the tag message (e.g. "Initial release.") respectively
if [ "$#" -ne 2 ]; then
  echo "ERROR: Enter two arguments, the version number (e.g. 1.0.3) and the tag message (e.g. 'Initial release.') respectively."
  exit 1
fi
echo -e "Bumping version\n"
git checkout dev
echo -e "\nVB: Editing application.properties"
mv application.properties application.properties.temp
sed "s/app.version=.*/app.version=$1/g" < application.properties.temp > application.properties
rm -f application.properties.temp
echo ""
git add application.properties
git commit -m "Version bump."
echo ""
git checkout master
echo ""
git merge --no-ff dev
echo ""
git tag -a $1 -m $2
echo ""
git checkout dev
echo -e "\nSUCCESS"
echo "Run 'git push --all' after confirming the changes."
