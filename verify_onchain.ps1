param([string]$Rpc="https://ethereum.publicnode.com")
$C="0x7edDCa72D3d8FcD19B21cEC191D1B61d652C3691"
$epoch=5
$expected=(Get-Content .\final_package.txt).Trim()

$onchain=(cast call $C "getRoot(uint64)(bytes32)" $epoch --rpc-url $Rpc).Trim()
if ($onchain.ToLower() -ne $expected.ToLower()) {
  Write-Host "FAIL: onchain $onchain != expected $expected"
  exit 1
}
Write-Host "PASS: onchain matches FINAL_PACKAGE"
