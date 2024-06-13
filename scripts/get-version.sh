file="gradle.properties"

cd -
version=$(grep "rabbit.appVersion" ${file} | cut -d'=' -f2)
echo "AppVersion=${version}" >> "$GITHUB_OUTPUT"