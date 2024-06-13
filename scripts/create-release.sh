cd -

file="gradle.properties"
propVersion="rabbit.android.build"
propVersionCode="rabbit.android.versionCode"
version=$(grep "${propVersion}" ${file} | cut -d'=' -f2)
versionCode=$(grep "${propVersionCode}" ${file} | cut -d'=' -f2)

cd scripts
newVersion=$(sh ./semver.sh bump prerel alpha.. ${version})
newVersionCode=$((versionCode + 1))

releaseBranch="release/${newVersion}"
git checkout -b "${releaseBranch}"

sed -i 's\${propVersion}=${version}\${propVersion}=${newVersion}\g' gradle.properties
sed -i 's\${propVersionCode}=${versionCode}\${propVersionCode}=${newVersionCode}\g' gradle.properties

git add --all
git commit -m "Version Updated v${newVersion}"
git push origin "${releaseBranch}"

echo "ReleaseVersion=${newVersion}" >> "$GITHUB_OUTPUT"
echo "ReleaseVersionCode=${newVersionCode}" >> "$GITHUB_OUTPUT"
echo "ReleaseBranch=${releaseBranch}" >> "$GITHUB_OUTPUT"