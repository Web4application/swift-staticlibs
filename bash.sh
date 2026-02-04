xcodebuild -showBuildSettings | grep " = " > XcodeBuildVariables_Paper.txt
xcodebuild -showBuildSettings -json > BuildSettings.json
git branch -m master main
git fetch origin
git branch -u origin/main main
git remote set-head origin -a
