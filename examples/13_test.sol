pragma solidity 0.5.1;

import './safeMath.sol';

contract MyContract {
    using SafeMath for uint256;
    uint256 public value;
    
    function calculation(uint _value1, uint _value2) public {
        value = _value1.div(_value2);
    }
}