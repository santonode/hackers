#!/bin/bash
#
# HACKER QUERY v0.1 by CN
# Input: List of assetIDs (policy+encodechex)
# Output: Total Power of the Wallet
# txs.json temp file

# Define timestamp
timestamp() {
  date +"%Y-%m-%d"
}

#Wallet
wallet="Abitcoin"

# hacker assets
declare -a harray=(
"a890e508e5fb46eb1ad098043d3961d7ad5fc1662391b23a8a59e5e348656e6e694369706865722d36" #1 HenniCipher-6
"a890e508e5fb46eb1ad098043d3961d7ad5fc1662391b23a8a59e5e348696464656e30394d61736b65722d37" #2 Hidden09Masker-7
"a890e508e5fb46eb1ad098043d3961d7ad5fc1662391b23a8a59e5e348696464656e394465636f6465722d3130" #3 Hidden9Decoder-10
"a890e508e5fb46eb1ad098043d3961d7ad5fc1662391b23a8a59e5e3496f746134526f626f2d31" #4 Iota4robo-1
"a890e508e5fb46eb1ad098043d3961d7ad5fc1662391b23a8a59e5e3496f746134526f626f2d38" #5 Ioto4robo-8
"a890e508e5fb46eb1ad098043d3961d7ad5fc1662391b23a8a59e5e34a6f4369706865722d34" #6 JoCiper-4
"a890e508e5fb46eb1ad098043d3961d7ad5fc1662391b23a8a59e5e34a6f686e3130394465636f6465722d36" #7 John109Decoder-6
#"a890e508e5fb46eb1ad098043d3961d7ad5fc1662391b23a8a59e5e3"
#"a890e508e5fb46eb1ad098043d3961d7ad5fc1662391b23a8a59e5e3"
#"a890e508e5fb46eb1ad098043d3961d7ad5fc1662391b23a8a59e5e3"
#"a890e508e5fb46eb1ad098043d3961d7ad5fc1662391b23a8a59e5e3"
#"a890e508e5fb46eb1ad098043d3961d7ad5fc1662391b23a8a59e5e3"
#"a890e508e5fb46eb1ad098043d3961d7ad5fc1662391b23a8a59e5e3"
#"a890e508e5fb46eb1ad098043d3961d7ad5fc1662391b23a8a59e5e3"
#"a890e508e5fb46eb1ad098043d3961d7ad5fc1662391b23a8a59e5e3"
#"a890e508e5fb46eb1ad098043d3961d7ad5fc1662391b23a8a59e5e3"
#"a890e508e5fb46eb1ad098043d3961d7ad5fc1662391b23a8a59e5e3"
#"a890e508e5fb46eb1ad098043d3961d7ad5fc1662391b23a8a59e5e3"
#"a890e508e5fb46eb1ad098043d3961d7ad5fc1662391b23a8a59e5e3"
#"a890e508e5fb46eb1ad098043d3961d7ad5fc1662391b23a8a59e5e3"
#"a890e508e5fb46eb1ad098043d3961d7ad5fc1662391b23a8a59e5e3"
#"a890e508e5fb46eb1ad098043d3961d7ad5fc1662391b23a8a59e5e3"
#"a890e508e5fb46eb1ad098043d3961d7ad5fc1662391b23a8a59e5e3"
#"a890e508e5fb46eb1ad098043d3961d7ad5fc1662391b23a8a59e5e3"
#"a890e508e5fb46eb1ad098043d3961d7ad5fc1662391b23a8a59e5e3"
#"a890e508e5fb46eb1ad098043d3961d7ad5fc1662391b23a8a59e5e3"
#"a890e508e5fb46eb1ad098043d3961d7ad5fc1662391b23a8a59e5e3"
#"a890e508e5fb46eb1ad098043d3961d7ad5fc1662391b23a8a59e5e3"
#"a890e508e5fb46eb1ad098043d3961d7ad5fc1662391b23a8a59e5e3"
#"a890e508e5fb46eb1ad098043d3961d7ad5fc1662391b23a8a59e5e3"
#"a890e508e5fb46eb1ad098043d3961d7ad5fc1662391b23a8a59e5e3"
#"a890e508e5fb46eb1ad098043d3961d7ad5fc1662391b23a8a59e5e3"
#"a890e508e5fb46eb1ad098043d3961d7ad5fc1662391b23a8a59e5e3"

)

# hacker names
declare -a narray=(
"n1"
"n2"
"n3"
)

# hacker powers
declare -i parray=(
"5"
"10"
"20"
)

arraylength=${#harray[@]}

echo "HACKER QUERY v0.1"
timestamp
echo "adahandle $wallet"
echo "Asset Count" $arraylength

#######################################
# Read assets
#######################################

for (( i=0; i<${arraylength}; i++ ));
do

  curl -s -H "project_id: mainnetG3a6gw8MAMvoPOQgaGIRVQwRcbOFee6a" "https://cardano-mainnet.blockfrost.io/api/v0/assets/${harray[$i]}" -o txs.json
  narray[$i]="$(jq -r '.onchain_metadata.name' txs.json)"
  parray[$i]="$(jq -r '.onchain_metadata.power' txs.json)"

  rm txs.json
  echo "$i ${narray[$i]} ${parray[$i]} ${harray[$i]}"


done
######################################

sum=$(IFS=+; echo "$((${parray[*]}))")
echo "adahandle $wallet power=$sum"
