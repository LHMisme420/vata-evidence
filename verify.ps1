# VATA PUBLIC VERIFIER

$files = @(
  "MAINNET_LIE_RECEIPT.md",
  "affidavit.txt",
  "summary.txt",
  "final_package.txt"
)

Write-Host "=== FILE HASHES ==="
foreach ($f in $files) {
  $h = (Get-FileHash $f -Algorithm SHA256).Hash.ToLower()
  Write-Host "$f : $h"
}

Write-Host ""
Write-Host "FINAL_PACKAGE (from file):"
Get-Content final_package.txt