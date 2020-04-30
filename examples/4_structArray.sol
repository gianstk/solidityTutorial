pragma solidity 0.5.1;

contract MyContract {
    // an array of Person datatype
    uint256 public peopleCount;
    Person[] public people;
    
    struct Person {
        string _firstName;
        string _lastName;
    }
    
    function addPerson(string memory _firstName, string memory _lastName) public {
        people.push(Person(_firstName, _lastName));
        peopleCount += 1;
    }
   
}