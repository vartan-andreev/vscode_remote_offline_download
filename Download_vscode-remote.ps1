# Prompt user for the path to VSCode Portable folder
$vscodePortablePath = Read-Host "Enter the path to the VSCode Portable folder (e.g., C:\Users\Vartana\OneDrive\Documents\VSCode-Portable):"

# Calculate the JSON file path based on the user input
$jsonFilePath = Join-Path -Path $vscodePortablePath -ChildPath "resources\app\product.json"

# Load JSON content and extract commit value
$jsonContent = Get-Content -Path $jsonFilePath -Raw | ConvertFrom-Json
$commitValue = $jsonContent.commit

# Construct download URL and filename
$downloadUrl = "https://update.code.visualstudio.com/commit:$commitValue/server-linux-x64/stable"
$fileName = "vscode-linux-x64.tar.gz"

# Download the file
Invoke-WebRequest -Uri $downloadUrl -OutFile $fileName

Write-Host "File downloaded and saved as $($PWD.Path)\$fileName"
