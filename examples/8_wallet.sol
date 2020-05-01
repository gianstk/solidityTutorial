pragma solidity 0.5.1;

contract MyContract {
    
    mapping(address => uint256) public balances; 
    address payable wallet;
    
    constructor(address payable _wallet) public {
        wallet = _wallet;
    }
    
    // can access the tracked event in the log of the transaction that emits this event
    event Purchase(
        address indexed _buyer,
        uint256 _amount
    );
    
    // "external modifier" -> can only be called outside of the smartcontract
    function() external payable {
        buyToken();
    }
    
    function buyToken() public payable {
        // buy a token
        balances[msg.sender] += 1;
        // send ether to the wallet
        wallet.transfer(msg.value);
        emit Purchase(msg.sender, msg.value);
        
    }
    
}