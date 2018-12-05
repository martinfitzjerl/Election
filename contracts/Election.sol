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
    mapping(address => bool) public voters;//getter function assigned automatically because it is public

    //Store Candidates
    //Fetch Candidates
    mapping(uint => Candidate) public candidates;
    //mapping is a key value pair, key is the uint and value is the Candidate, cannot know how many candidates or values in mapping (returns default value) so we use a counter cache
    //Store Candidates Count
    uint public candidatesCount;
    //counter cache to fetch from mapping, state variable

    // voted event
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

    function vote(uint _candidateId) public {
        // require address has not voted before
        require(!voters[msg.sender]);//condition is true then execute function, boolean value

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);
        //if an exception is thrown the function will refund the ethereum up to this point, important to be bug free to save gas

        //record that voter has voted
        voters[msg.sender] = true;
        //solidity metadata from account that sends function, msg is the message metadata and .sender is the metadata from the account that calls function

        //increase vote count for candidate
        candidates[_candidateId].voteCount ++;
    }
}