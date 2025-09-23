$ErrorActionPreference = "Stop"

npm install
npm run build

if (Test-Path "docs") { Remove-Item -Recurse -Force "docs" }
New-Item -ItemType Directory -Path "docs" | Out-Null

Copy-Item "dist\*" "docs\" -Recurse -Force

Copy-Item "docs\index.html" "docs\404.html" -Force
New-Item -ItemType File -Path "docs\.nojekyll" -Force | Out-Null

git add docs
git commit -m "deploy: build to docs"
git push origin main

Write-Host "done"
