pragma solidity ^0.4.22;
contract MessageExchange {
    
    event userAdded(bytes32 name,address userAddress);
    event requestSent(address sender,address receiver);
    event friendAdded(address user1,address user2 );
    event userRejected(address user1,address user2 );
    event messageSent(bytes32 message, address sender);
        
    enum Relationship {Unknown,Pending,Friend}
    
    struct User{
        bytes32 name;
        uint msgcount;
        bool isMember;
    }
            
    mapping (address => mapping (uint => bytes32)) inbox;
    mapping (address => mapping(address => Relationship)) relations;
    mapping (address => User) public users;
    
    constructor(){
        
    }
    
    function addUser(bytes32 name) public {
        users[msg.sender]= User(name,0,true);
        emit userAdded(name,msg.sender);
    }
    
    function addFriend(address requestReceiver) public onlyMember{
        require (requestReceiver != msg.sender, "You can not add yourself");
        relations[msg.sender][requestReceiver]=Relationship.Pending;
        relations[requestReceiver][msg.sender]=Relationship.Pending;
        emit requestSent(msg.sender,requestReceiver);
    }
    
    function acceptFriend(address requestSender) public onlyMember{
        require (relations[msg.sender][requestSender]==Relationship.Pending);
        require (relations[requestSender][msg.sender]==Relationship.Pending);
        relations[msg.sender][requestSender]=Relationship.Friend;
        relations[requestSender][msg.sender]=Relationship.Friend;
        emit friendAdded(msg.sender,requestSender);
    }
    
    function rejectRequest(address requestSender) public onlyMember{
        require (relations[msg.sender][requestSender]==Relationship.Pending);
        require (relations[requestSender][msg.sender]==Relationship.Pending);
        relations[msg.sender][requestSender]=Relationship.Unknown;
        relations[requestSender][msg.sender]=Relationship.Unknown;
        emit userRejected(msg.sender,requestSender); 
    }
    
    function sendMessage(bytes32 message , address receiver) public onlyMember{
        require (relations[msg.sender][receiver]==Relationship.Friend);
        require (relations[receiver][msg.sender]==Relationship.Friend);
        users[receiver].msgcount+=1;
        inbox[receiver][(users[receiver].msgcount)-1]=message;
        emit messageSent(message,receiver);
    }

    modifier onlyMember(){
         require(users[msg.sender].isMember==true);
         _;
     }
}