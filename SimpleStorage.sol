//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.20;

contract SimpleStorage {
    // state variables
    string private dataStorage;

    constructor(string memory _data) {
        dataStorage = _data;
    }

    function setData(string memory _newData) public {
        dataStorage = _newData;
    }

    function getData() public view returns (string memory) {
        return dataStorage;
    }
}
