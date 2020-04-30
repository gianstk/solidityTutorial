pragma solidity 0.5.1;

contract MyContract {

    enum State { Waiting, Ready, Active }
    State public state;
 
    constructor() public {
        state = State.Active;
    }   
    
    function checkState() public view returns(string memory) {
        if (state == State.Waiting) {
            return "Waiting";
        } else if (state == State.Ready) {
            return "Ready";
        } else {
            return "Active";
        }
    }
    
    function next() public {
        if (state == State.Waiting) {
            state = State.Ready;
        } else if (state == State.Ready) {
            state = State.Active;
        } else {
            state = State.Waiting;
        }
    }
}