// SPDX-License-Identifier: MIT

// The above code is not comment, instead used to set License
// MIT License is used because it has least restrictions

pragma solidity ^0.8.8; //Set version from and above
/*
    we can set the version to exact version by
    pragma solidity 0.8.7;

    we can even set from and upto
    pragma solidity >=0.8.7 <0.9.0;
*/

contract SimpleStorage {

    //<-----This Section Helps to understand Variables----->
    // bool hasFavoriteNumber = false;
    uint public favoriteNumber;//init to 0
    // /* 
    //     We can set the size of uint as
    //     uint8 a=123; where the size will be 8bits
    //     We can also set it upto 256 as
    //     uint256 a=123; //which is the default value
    // */
    // int favoriteInt = -5;
    // string favoriteNumberInText = "Five";
    // address myAddress = 0x65c39f39974a4149463f0989AEe89AF953b0f334;
    // bytes32 favoriteBytes = "cat"; 
    // //byte32 is the maximum size of bytes 


    /*
        Default access specifier is internal
        public ->  vissible external and internal
        private -> only in current contract
        external -> can only be message called (this.func)
        internal -> only visible internally
    */

    //<-----Creation of Structure----->
    struct People {
        uint256 favNumber;
        string name;
    }

    //Creating a struct variable
    People public person = People({favNumber:5, name:"Samarth"});

    //Creating Array
    //uint256[] public favNumList;
    People[] public people;

    //<-----Creation of Maps----->
    mapping(string => uint256) public nameToFavoriteNumber;

    //<-----This Section Helps to understand Functions----->
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns(uint256)
    {
        //This function can't modify the states of the blockchain but can display value
        return favoriteNumber;
        //No gas spent
    }

    function add() public pure returns(uint256)
    {
        //This function can only use some logic and return. It cann't modify state or print
        return (1+1);
        //No gas spent
    }

    //Function to read values for structure
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber,_name));
        nameToFavoriteNumber[_name]=_favoriteNumber;
    }
    /*
        We can store data in 6 places
        1. stack 
        2. memory -> temp variable that can be modified
        3. storage -> permanent 
        4. calldata -> temp var that can't be modified
        5. code
        6. logs
        1,5,6 can't be explicitly mentioned
        these are required to be specified only for arrays and other types
        Not for primitive data types
        bcz the compiler knows where to store primitive types like uint in memory
    */
}
