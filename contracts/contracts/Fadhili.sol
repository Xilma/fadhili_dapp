pragma solidity >=0.7.0 <0.9.0;

contract Fadhili{
    uint public donationCount = 0;

    constructor() public {
        createDonation("Food");
    }

    struct Donate{
        uint id;
        //uint donation;
        string category;
        bool completed;
    }

    //create mapping 
    //creates key value pairs that get stored on the blockchain
    mapping(uint => Donate) public donations;

    //function for creating the donations
    function createDonation(string memory _category) public {
        donationCount ++;
        //store donation on the blockchain by adding it to the donations mapping
        donations[donationCount] = Donate(donationCount, _category, false);
    }

    struct Receive{
        uint id;
        uint fundreceived;
        string category;
        bool beneficial;
    }
}
