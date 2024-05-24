// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Visa{

    // India and Russia allowed for visa , UK and Germany not allowed.
    enum nation {India, Russia, UK, Germany}

    //createing a structure to keep data of candidate.
    struct candidates {
        string name;
        uint age;
        uint phNo;
        nation nationality;
        bool isHavingPassport;
    }
    
    //mapping of candidate struct with address.
    mapping(address =>candidates) public candidate;

    //function to add a new candidate
    function addCandidate(address _candidateAddress, string memory _name, uint _age, uint _phNo, nation _nationality, bool _isHavingPassport)public{
        candidate[_candidateAddress].name = _name;
        candidate[_candidateAddress].age = _age;
        candidate[_candidateAddress].phNo = _phNo;
        candidate[_candidateAddress].nationality = _nationality;
        candidate[_candidateAddress].isHavingPassport = _isHavingPassport;
    }

    //fucntion to create a new passport only if age is greate that 18.
    function createNewPassport(address _candidateAddress)public returns(bool){
        //using require err handling if age fall below 18.
        require(candidate[_candidateAddress].age>=18,"Under age, application is rejected");
        candidate[_candidateAddress].isHavingPassport= true;

        return true;
    }

    //function to update the passport
    function updatePassport(address _candidateAddress,uint _newPhoneNo)public returns(candidates memory,string memory){
        //revert() is used to handle is passport doesen't exists.
        if(candidate[_candidateAddress].isHavingPassport!= true){
            revert("No existing passport to update, first create a new one");
        }
        candidate[_candidateAddress].phNo= _newPhoneNo;
        return (candidate[_candidateAddress],"Passport updated");
    }

    //function to apply for visa
    function applyVisa(address _candidateAddress)public view returns (string memory){
        //revert() used to handle if candidate has pasport or not
        if(candidate[_candidateAddress].isHavingPassport!= true){
            revert("No existing passport to update, first create a new one");
        }
        //assert() is used to check the eligible nationality
        assert(candidate[_candidateAddress].nationality == nation.India ||
        candidate[_candidateAddress].nationality == nation.Russia);
        return("visa applied successfully");
    }
}