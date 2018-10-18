web3 = new Web3(web3.currentProvider);
var messageContract = web3.eth.contract([
	{
		"constant": false,
		"inputs": [
			{
				"name": "requestSender",
				"type": "address"
			}
		],
		"name": "acceptFriend",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "requestReceiver",
				"type": "address"
			}
		],
		"name": "addFriend",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "name",
				"type": "bytes32"
			}
		],
		"name": "addUser",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"name": "user1",
				"type": "address"
			},
			{
				"indexed": false,
				"name": "user2",
				"type": "address"
			}
		],
		"name": "userRejected",
		"type": "event"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"name": "user1",
				"type": "address"
			},
			{
				"indexed": false,
				"name": "user2",
				"type": "address"
			}
		],
		"name": "friendAdded",
		"type": "event"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"name": "message",
				"type": "bytes32"
			},
			{
				"indexed": false,
				"name": "sender",
				"type": "address"
			}
		],
		"name": "messageSent",
		"type": "event"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"name": "sender",
				"type": "address"
			},
			{
				"indexed": false,
				"name": "receiver",
				"type": "address"
			}
		],
		"name": "requestSent",
		"type": "event"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"name": "name",
				"type": "bytes32"
			},
			{
				"indexed": false,
				"name": "userAddress",
				"type": "address"
			}
		],
		"name": "userAdded",
		"type": "event"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "requestSender",
				"type": "address"
			}
		],
		"name": "rejectRequest",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "message",
				"type": "bytes32"
			},
			{
				"name": "receiver",
				"type": "address"
			}
		],
		"name": "sendMessage",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "constructor"
	},
	{
		"constant": true,
		"inputs": [
			{
				"name": "",
				"type": "address"
			}
		],
		"name": "users",
		"outputs": [
			{
				"name": "name",
				"type": "bytes32"
			},
			{
				"name": "msgcount",
				"type": "uint256"
			},
			{
				"name": "isMember",
				"type": "bool"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	}
]);
var contract = messageContract.at(0x64c46452a997f397d1873dbaff05215d9c5f2eaf);
console.log(contract);
