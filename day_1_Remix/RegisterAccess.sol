// SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

// Array

contract RegisterAccess {
    string[] private info;

    address public owner;

    mapping(address => bool) public whiteList;

    constructor() {
        owner = msg.sender;

        whiteList[msg.sender] = true;
    }

    event InfoChange(string oldInfo, string newInfo);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner");

        _;
    }

    modifier onlyWhitelist() {
        require(whiteList[msg.sender] == true, "Only whitelist");

        _;
    }

    function getInfo(uint256 index) public view returns (string memory) {
        return info[index];
    }

    function setInfo(uint256 index, string memory _info) public onlyWhitelist {
        emit InfoChange(info[index], _info);

        info[index] = _info;
    }

    function addInfo(string memory _info)
        public
        onlyWhitelist
        returns (uint256 index)
    {
        info.push(_info);

        index = info.length - 1;
    }

    function listInfo() public view returns (string[] memory) {
        return info;
    }

    function addMember(address _member) public onlyOwner {
        whiteList[_member] = true;
    }

    function delMember(address _member) public onlyOwner {
        whiteList[_member] = false;
    }
}
