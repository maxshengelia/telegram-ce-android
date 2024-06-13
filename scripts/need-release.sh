git checkout develop
tagDevelop=$(git tag --points-at develop)
echo ${tagDevelop}
if [[ ${tagDevelop} == "v"* ]]; then
  echo "Do not need release"
  echo "NeedRelease=false" >> "$GITHUB_OUTPUT"
else
  echo "Need new release"
  echo "NeedRelease=true" >> "$GITHUB_OUTPUT"
fi