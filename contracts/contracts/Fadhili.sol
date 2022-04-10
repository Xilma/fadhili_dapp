pragma solidity >=0.7.0 <0.9.0;

contract Fadhili{
    uint public donationCount = 0;
    address payable owner;
    uint totalAmount;

    //contract settings
    constructor() public {
        createDonation('Harold Enterprises', '0.002', 'Food');
        owner = payable(msg.sender);
    }

    struct Donate{
        uint id;
        string name;
        string donation;
        string category;
        bool completed;
    }

    //create mapping 
    //creates key value pairs that get stored on the blockchain
    mapping(uint => Donate) public donations;

    //function for creating the donations
    function createDonation(string memory _name, string memory _donation, string memory _category) public {
        donationCount ++;
        //store donation on the blockchain by adding it to the donations mapping
        donations[donationCount] = Donate(donationCount, _name, _donation, _category, false);
    }

    function donate() public payable{
        (bool success) = owner.call(value: msg.value){""};
        require(success, "Failed to send money")
    }

    function getTotalDonations() view public returns(uint){
        return totalAmount;
    }

    struct Receive{
        uint id;
        string fundreceived;
        string category;
        bool beneficial;
    }
}
