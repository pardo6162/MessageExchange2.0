pragma solidity ^0.4.22;
contract MessageExchange {
    
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
    }
    
    function addFriend(address requestReceiver) public onlyMember{
        require (requestReceiver != msg.sender, "Not add itself like friend");
        relations[msg.sender][requestReceiver]=Relationship.Pending;
        relations[requestReceiver][msg.sender]=Relationship.Pending;
    }
    
    function acceptFriend(address requestSender) public onlyMember{
        require (relations[msg.sender][requestSender]==Relationship.Pending);
        require (relations[requestSender][msg.sender]==Relationship.Pending);
        relations[msg.sender][requestSender]=Relationship.Friend;
        relations[requestSender][msg.sender]=Relationship.Friend;
    }
    
    function rejectRequest(address requestSender) public onlyMember{
        require (relations[msg.sender][requestSender]==Relationship.Pending);
        require (relations[requestSender][msg.sender]==Relationship.Pending);
        relations[msg.sender][requestSender]=Relationship.Unknown;
        relations[requestSender][msg.sender]=Relationship.Friend;
    }
    
    function sendMessage(bytes32 message , address receiver) public onlyMember{
        require(receiver!= msg.sender);
        require (relations[msg.sender][receiver]==Relationship.Friend);
        require (relations[receiver][msg.sender]==Relationship.Friend);
        users[receiver].msgcount+=1;
        inbox[receiver][(users[receiver].msgcount)-1]=message;
    }

    modifier onlyMember(){
         require(users[msg.sender].isMember==true);
         _;
     }
}
