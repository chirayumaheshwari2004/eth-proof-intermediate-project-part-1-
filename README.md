# Passport 

This Solidity program is a simple demo code for minting and burning token. The purpose of the program is to demonstrate the mechanism of minting , burning and supply of the tokens

## Description
This contract is written in Solidity language, a programming language used for developing smart contracts on the Ethereum blockchain. This contract have 4 public state variables (Token Name, Token Abbrv., Total Supply and balances). balances are the mapping of sender to its balance. next There are two functions : mintTokens and burnTokens. mintTokens takes 2 parameter ( address and value). upon calling of mintToken the value will be added to the tokenSupply and balance of the sender. Next in burnTokens it also takes two parameters (address and value) to be burnt, there is conditional statement to check if the toknes to be burnt is actually available in sender's balance or not. if condition is true then the value will be deducted from both totalSupply and balance of address.
## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., MyToken.sol). Copy and paste the following code into the file:

```javascript
// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

/*
       REQUIREMENTS
    1. Your contract will have public variables that store the details about your coin (Token Name, Token Abbrv., Total Supply)
    2. Your contract will have a mapping of addresses to balances (address => uint)
    3. You will have a mint function that takes two parameters: an address and a value. 
       The function then increases the total supply by that number and increases the balance 
       of the “sender” address by that amount
    4. Your contract will have a burn function, which works the opposite of the mint function, as it will destroy tokens. 
       It will take an address and value just like the mint functions. It will then deduct the value from the total supply 
       and from the balance of the “sender”.
    5. Lastly, your burn function should have conditionals to make sure the balance of "sender" is greater than or equal 
       to the amount that is supposed to be burned.
*/

contract MyToken {

    // public variables here
    string public tokenName = "GOLD";
    string public tokenAbbrv = "GLD";
    uint public totalSupply = 0;

    // mapping variable here
    mapping(address => uint) public balances;

    // mint function
    function mintTokens(address _addr,uint _value)public {
        totalSupply += _value;
        balances[_addr] += _value;
    }

    // burn function
    function burnTokens(address _addr,uint _value)public{
        if(_value<=balances[_addr]){
            totalSupply -= _value;
            balances[_addr] -=_value;
        }
    }

    /*
    few addresses for testing purpose:
    0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
    0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
    */
}

```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.18" (or another compatible version), and then click on the "Compile MyToken.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "MyToken" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it. Click on the "MyToken" contract in the left-hand sidebar, and then check the token Abbrev, tokenName, total supply by clicking them. By passing address and token value in mintToken and clicking it will call the mintTokens function and same will be with burnTokens.

## Authors

Mayank Sharma  
[@Mayank](https://www.linkedin.com/in/mayank-sharma-078278243/)


## License

This MyToken is licensed under the MIT License 
