param(
  [string[]]$Rpcs = @(
    "https://ethereum.publicnode.com",
    "https://eth.llamarpc.com",
    "https://rpc.flashbots.net"
  )
)

$C="0x7edDCa72D3d8FcD19B21cEC191D1B61d652C3691"
$epoch=5
$expected=(Get-Content .\final_package.txt).Trim()

$lastErr=$null
foreach($rpc in $Rpcs){
  try{
    $onchain=(cast call $C "getRoot(uint64)(bytes32)" $epoch --rpc-url $rpc).Trim()
    if ($onchain.ToLower() -ne $expected.ToLower()) {
      Write-Host "FAIL: onchain $onchain != expected $expected (rpc=$rpc)"
      exit 1
    }
    Write-Host "PASS: onchain matches FINAL_PACKAGE (rpc=$rpc)"
    exit 0
  } catch {
    $lastErr=$_
  }
}
Write-Host "ERROR: all RPCs failed."
if($lastErr){ Write-Host $lastErr }
exit 2
