# receive.sol
basic smart contract to hold ethereum as receive with owner control

Explanation:
Receiving Ether: The receive() function is a special function in Solidity that does not take any arguments and does not return anything. It is executed on a call to the contract with empty calldata. This is the function that allows the contract to receive Ether directly.

Fallback Function: The fallback() function is called when none of the other functions match the function identifier or if no data was supplied at all and Ether is sent along with the call.

Withdrawing Ether: The withdrawAll() function allows the contract owner to withdraw all Ether stored in the contract. It uses the transfer method to send Ether, which automatically reverts on failure.

Sending Ether: The sendEther function allows the contract to send a specified amount of Ether to an address. This function uses the transfer method, which is a secure way to send Ether.

Checking Balance: The checkBalance() function provides a way to check the contract's balance, i.e., how much Ether is stored in the contract.

This smart contract now has the basic functionality to receive, store, and send Ether securely. Make sure to test thoroughly in a development environment before deploying to the main network.
