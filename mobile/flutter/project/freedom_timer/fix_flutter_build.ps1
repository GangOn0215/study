# fix_flutter_build.ps1
Write-Host "=== Flutter Build Fix Script 시작 ==="

# 1. Flutter clean
Write-Host "1. flutter clean 실행..."
flutter clean

# 2. 캐시 폴더 삭제
Write-Host "2. 캐시 폴더 삭제..."
$projectPath = Get-Location
$buildPath = Join-Path $projectPath "build"
$dartToolPath = Join-Path $projectPath ".dart_tool"
$gradleUserPath = "$env:USERPROFILE\.gradle\caches"
$pubCachePath = "$env:LOCALAPPDATA\Pub\Cache"

$paths = @($buildPath, $dartToolPath, $gradleUserPath, $pubCachePath)
foreach ($p in $paths) {
    if (Test-Path $p) {
        Remove-Item -Recurse -Force $p
        Write-Host "삭제됨: $p"
    } else {
        Write-Host "없음: $p"
    }
}

# 3. gradle.properties 수정
Write-Host "3. gradle.properties 확인 및 수정..."
$gradleProp = Join-Path $projectPath "android\gradle.properties"
if (!(Test-Path $gradleProp)) {
    Write-Host "gradle.properties 없음 → 새로 생성"
    New-Item -ItemType File -Path $gradleProp -Force | Out-Null
}
$content = Get-Content $gradleProp
if ($content -notmatch "org.gradle.daemon") {
    Add-Content $gradleProp "`norg.gradle.daemon=false"
    Add-Content $gradleProp "org.gradle.parallel=false"
    Add-Content $gradleProp "org.gradle.configureondemand=false"
    Write-Host "gradle.properties 설정 추가 완료"
} else {
    Write-Host "이미 설정이 있음 → 건너뜀"
}

# 4. pub get
Write-Host "4. flutter pub get 실행..."
flutter pub get

# 5. APK 빌드
Write-Host "5. flutter build apk 실행..."
flutter build apk --release --split-per-abi

Write-Host "=== Flutter Build Fix Script 완료 ==="
