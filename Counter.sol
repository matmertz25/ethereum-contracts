pragma solidity 0.5.17;

contract Counter {
    
    // Public variable of type unsigned int to keep the number of counts
    uint256 public count = 0;
    address private owner;
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }
    
    constructor() public {
        owner = msg.sender;
    }
    
    event ValueChanged(uint oldValue, uint256 newValue);

    // Function that increments our counter
    function increment() public {
        count += 1;
        emit ValueChanged(count - 1, count);
    }
    
    function decrement() public {
        count--;
        emit ValueChanged(count + 1, count);
    }
    
    // Not necessary getter to get the count value
    function getCount() public view returns (uint256) {
        return count;
    }

}