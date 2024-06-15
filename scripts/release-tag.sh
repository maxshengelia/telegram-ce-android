git checkout master

file="gradle.properties"
propVersion="rabbit.android.build"
version=$(grep "${propVersion}" ${file} | cut -d'=' -f2)
git tag ${version}
git push origin --tags