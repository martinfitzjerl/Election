//solium-disable linebreak-style
pragma solidity >=0.4.22 <0.6.0; 

contract Election {
    //Model a Candidate
    struct Candidate{
        uint id;
        //unknown integer, value not yet assigned
        string name;
        uint voteCount;
    }

    string public candidate;
    //state variable assigned getter function

    //Store Candidates
    //Fetch Candidates
    mapping(uint => Candidate) public candidates;
    //mapping is a key value pair, key is the uint and value is the Candidate
    //Store Candidates Count
    uint public candidatesCount;
    //counter cache to fetch from mapping, state variable

    // Constructor
    constructor() public{
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    function addCandidate(string _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }
}