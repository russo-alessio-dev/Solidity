//SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract ArmyOfMiners{

    Miner[] miners; 

    struct Miner{
        string name;
        uint digPower;
    }

    function createMiner(string memory _name, uint _digPower) public {
        Miner memory miner = Miner(_name, _digPower);
        miners.push(miner);
    }

    function deleteMinerByName(string memory _name) public {

        //**** CREAZIONE DI UN NUOVO ARRAY ****//
        uint i = 0;
        Miner[] memory newMinerList = new Miner[](miners.length-1); 


        //**** COPIO L'ARRAY MINERS SENZA INCLUDERE IL MINER DA ELIMINARE  ****//
        for (uint j = 0; j < miners.length; j++){

            if( keccak256(abi.encodePacked(miners[j].name)) != keccak256(abi.encodePacked(_name))  ){
                newMinerList[i] = miners[j];
                i++;
            }

        }

        //**** SVUOTO L'ARRAY MINERS ****//
        while(miners.length != 0){    
            miners.pop();
        }

        //**** RICOSTRUISCO MINERS ****//
        for(uint j = 0; j< newMinerList.length; j++){
            miners.push(newMinerList[j]);
        }

    }

    function getMiners() public view returns(Miner[] memory){
        return(miners);
    }

}