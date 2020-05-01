pragma solidity 0.5.1;

// This smartcontract contains "addPerson" function which can be called only after the current timestamp has passed the opening time


contract MyContract {
    
    // a Hash mapping of Person datatype
    uint256 public peopleCount = 0;
    mapping(uint => Person) public people;
    
    // using UNIX Epoch time
    uint256 openingTime = 1588252890; 
    
    // modifier for opening time
    modifier onlyWhileOpen() {
        require(block.timestamp >= openingTime);
        _;
    }
    
    struct Person {
        uint _id;
        string _firstName;
        string _lastName;
    }

    function addPerson(
        string memory _firstName, 
        string memory _lastName
    ) 
        public 
        onlyWhileOpen // timing modifier
    {
        incrementCount();
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
    }
    
    function incrementCount() internal {
        peopleCount += 1;
    }
   
}