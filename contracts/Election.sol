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

    // Store accounts that have voted
    //---I don't know where this was added in the video??
    mapping(address => bool) public voters;

    //Store Candidates
    //Fetch Candidates
    mapping(uint => Candidate) public candidates;
    //mapping is a key value pair, key is the uint and value is the Candidate, cannot know how many candidates or values in mapping (returns default value) so we use a counter cache
    //Store Candidates Count
    uint public candidatesCount;
    //counter cache to fetch from mapping, state variable

    // voted event
    //---I don't know where this was added in the video??
    event votedEvent(
        uint indexed _candidateId
    );

    // Constructor
    constructor() public{
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    function addCandidate(string memory _name) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }
}