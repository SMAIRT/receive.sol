// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MySmartContract {
    address public owner;

    constructor() {
        // Set the contract creator as the owner
        owner = msg.sender;
    }

    // Modifier to restrict function access to only the contract owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner.");
        _;
    }

    // Function to receive Ether. msg.value contains the Ether sent
    receive() external payable {
        // Function logic when receiving Ether if needed
    }

    // Fallback function called when msg.data is not empty
    fallback() external payable {}

    // Function to withdraw all Ether from this contract to the owner's address
    function withdrawAll() public onlyOwner {
        uint amount = address(this).balance;
        require(amount > 0, "No Ether left to withdraw");

        // Transfer all Ether to owner. 'transfer' is a method available for 'payable' addresses
        (bool success, ) = owner.call{value: amount}("");
        require(success, "Failed to send Ether");
    }

    // Function to send Ether from the contract to another address
    function sendEther(address payable _to, uint _amount) public onlyOwner {
        require(address(this).balance >= _amount, "Not enough Ether in the contract");
        (_to).transfer(_amount);
    }

    // Function to check the contract's balance
    function checkBalance() public view returns (uint) {
        return address(this).balance;
    }
}
