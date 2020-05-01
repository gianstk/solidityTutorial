pragma solidity 0.5.1;

contract MyContract {
    
    // a Hash mapping of Person datatype
    uint256 public peopleCount = 0;
    mapping(uint => Person) public people;
    address owner;
    
    // initialize ownder's address
    constructor() public {
        owner = msg.sender;    
    }
    
    // define a modifier to check a owner
    modifier onlyOwner() {
        // msg.sender   -> address of the person who call the function
        // require      -> true if the condition is passed, else throw an error
        require(msg.sender == owner);
        _;
    }
    
    struct Person {
        uint _id;
        string _firstName;
        string _lastName;
    }
    

    function addPerson(string memory _firstName, string memory _lastName) public onlyOwner {
        incrementCount();
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
    }
    
    function incrementCount() internal {
        peopleCount += 1;
    }
   
}