// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;
pragma experimental ABIEncoderV2;

contract MyFirstContract {
    uint256 number = 0;
    //Dynamic array (variable size)
    string[] names;
    //Añadiendo un Mapping
    mapping(string => uint256) public phoneNumbers;

    function changeNumber(uint256 _num) public {
        number = number + _num;
    }

    function getNumber() public view returns (uint256) {
        return number;
    }

    function getNumberMultiplied(uint256 _num) public {
        number = number * _num;
    }

    function addNumbers(uint256 _num1, uint256 _num2) public {
        number = _num1 + _num2;
    }

    // Añadir un Array
    function addName(string memory _name) public {
        names.push(_name);
    }

    function getName(uint256 _index) public view returns (string memory) {
        return names[_index];
    }

    //Añadiendo un Mapping
    function addMobileNumber(string memory _name, uint256 _mobileNumber)
        public
    {
        phoneNumbers[_name] = _mobileNumber;
    }

    function getMobileNumber(string memory _name)
        public
        view
        returns (uint256)
    {
        return phoneNumbers[_name];
    }

    //Funcion que devuelve la longitud del array:
    function getNamesLength() public view returns (uint256) {
        return names.length;
    }

    function getNames() public view returns (string[] memory) {
        return names;
    }
}
