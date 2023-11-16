//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.20;

// How to use Ether
// How to accept payments for your Smart Contract
// How to Withdraw them

contract SimpleStorageV3 {
    // state variables
    string private dataStorage;
    address private owner;

    constructor(string memory _data) {
        dataStorage = _data;
        owner = msg.sender;
    }

    error NotAuthorizedUser();
    error InsufficientPayment();
    error TransferFailed();

    event NewDataValuePublished(string _newDataValue);

    modifier onlyOwner() {
        if (msg.sender != owner) revert NotAuthorizedUser();
        _;
    }

    modifier checkPrice() {
        if (msg.value < 1 ether) revert InsufficientPayment();
        _;
    }

    function setData(string memory _newData) public payable checkPrice {
        dataStorage = _newData;
        emit NewDataValuePublished(dataStorage);
    }

    function getData() public view returns (string memory) {
        return dataStorage;
    }

    function withdrawFunds() public onlyOwner {
        // address of the contract
        // balance of the funds in the contract
        // receiver => owner

        // address contractAddr = address(this);
        // uint256 bal = contractAddr.balance;

        // transfer, send and call
        (bool success, ) = owner.call{value: address(this).balance}("");
        if (!success) revert TransferFailed();
    }
}
