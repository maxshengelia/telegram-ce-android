git checkout develop
lastCommitMsg=$(git log -1 --pretty=%B)
echo ${lastCommitMsg}
if [[ ${lastCommitMsg} == "Merge Version"* ]]; then
  echo "Do not need release"
  echo "NeedRelease=false" >> "$GITHUB_OUTPUT"
else
  echo "Need new release"
  echo "NeedRelease=true" >> "$GITHUB_OUTPUT"
fi