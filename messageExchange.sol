pragma solidity ^0.4.22;
contract MessageExchange {
    
    enum Relationship {Unknown,Pending,Friend}
    
    struct User{
        bytes32 name;
        uint unreadedmsg;
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
    
    function addFriend(address requestReceiver){
        relations[msg.sender][requestReceiver]=Relationship.Pending;
        relations[requestReceiver][msg.sender]=Relationship.Pending;
    }
    
    function acceptFriend(address requestSender){
        relations[msg.sender][requestSender]=Relationship.Friend;
        relations[requestSender][msg.sender]=Relationship.Friend;
    }
    
    function rejectRequest(address requestSender){
        relations[msg.sender][requestSender]=Relationship.Unknown;
        relations[requestSender][msg.sender]=Relationship.Friend;
    }

    
}
