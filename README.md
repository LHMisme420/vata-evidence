VATA Public Evidence Package

Ethereum Mainnet Contract:
0x7edDCa72D3d8FcD19B21cEC191D1B61d652C3691

Epoch: 5
On-chain root:
0x2976115c0260afd1693424661ed1a743686ae6d6f46f069e2d1fa85ee213b726

Steps to verify:

1) Run:
   powershell -ExecutionPolicy Bypass -File verify.ps1

2) Compare FINAL_PACKAGE output to on-chain:

   cast call 0x7edDCa72D3d8FcD19B21cEC191D1B61d652C3691 "getRoot(uint64)(bytes32)" 5 --rpc-url https://ethereum.publicnode.com

If equal, package is authentic.