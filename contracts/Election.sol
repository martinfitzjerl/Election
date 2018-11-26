//solium-disable linebreak-style
pragma solidity >=0.4.22 <0.6.0; 

contract Election {
    // Store candidate
    // Read candidate
    string public candidate;
    //state variable assigned getter function

    // Constructor
    constructor() public{
        candidate = "Candidate 1";
    }
}