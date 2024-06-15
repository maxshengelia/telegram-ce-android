file="gradle.properties"

cd -
version=$(grep "rabbit.android.build" ${file} | cut -d'=' -f2)
package=$(grep "APP_PACKAGE" ${file} | cut -d'=' -f2)

echo "AppVersion=${version}" >> "$GITHUB_OUTPUT"
echo "AppPackage=${package}" >> "$GITHUB_OUTPUT"