web3 = new Web3(web3.currentProvider);
var messageContract = web3.eth.contract();
var contract = messageContract.at();
console.log(contract);
