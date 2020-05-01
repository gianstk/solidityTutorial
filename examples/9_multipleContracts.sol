pragma solidity 0.5.1;


// create a smartcontract that could call a function in another contract
contract ERC20Token {
    string public name;
    mapping(address => uint256) public balances;
    
    function mint() public {
        // "tx.origin" instead of "msg.sender" since msg.sender will be the address of the "MyContract", not the user calling it
        balances[tx.origin] ++;
    }

}

// move "balances" variable to another contract
contract MyContract {
    
    address payable wallet;
    address public token;
    
    constructor(address payable _wallet, address _token) public {
        wallet = _wallet;
        token = _token;
    }
    
    // "external modifier" -> can only be called outside of the smartcontract
    function() external payable {
        buyToken();
    }
    
    function buyToken() public payable {
        ERC20Token _token = ERC20Token(address(token));
        _token.mint();
        wallet.transfer(msg.value);
    }
    
}