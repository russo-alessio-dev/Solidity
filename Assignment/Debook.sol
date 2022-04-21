//SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Debook{

    string title; 
    address[] authors; 
    mapping(uint => string) content;
    uint size;

    function createPage(uint _pageNumber, string memory _content) public{
        require(keccak256(abi.encodePacked(content[_pageNumber])) == keccak256(abi.encodePacked("")));

        bool found = false; 

        content[_pageNumber] = _content;

        for(uint i = 0; i < authors.length; i++){
            if(authors[i] == msg.sender){
                found = true; 
                break;
            }
        }
        
        if(!found) authors.push(msg.sender);
        found = false;
   
        size++;

    }

    function goTo(uint _pageNumber) public view returns (string memory){
        return(content[_pageNumber]);
    } 

    function getSize() public view returns (uint){
        return(size);
    }

    function getAuthors() public view returns (address[] memory){
        return(authors);
    }
}
