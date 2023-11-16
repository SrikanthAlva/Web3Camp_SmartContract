//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.20;

// access control
// events
// errors
// modifiers

contract SimpleStorageV2 {
    // state variables
    string private dataStorage;
    address private owner;

    constructor(string memory _data) {
        dataStorage = _data;
        owner = msg.sender;
    }

    error NotAuthorizedUser();

    event NewDataValuePublished(string _newDataValue);

    modifier onlyOwner() {
        if (msg.sender != owner) revert NotAuthorizedUser();
        _;
    }

    function setData(string memory _newData) public onlyOwner {
        dataStorage = _newData;
        emit NewDataValuePublished(dataStorage);
    }

    function getData() public view returns (string memory) {
        return dataStorage;
    }
}
