// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract SimpleStorage{
    

    uint256  public  favoriteNumber;

    //uint256[] listofFavoriteNumbers;

    struct Person{
        uint256 myFavoriteNumber;
        string name;

    }

    Person[] public listOfPeople;

    // 根据对应的键值对 string 找到uint256 zl => 23
    mapping (string => uint256) public nameToFavoriteNumber;

    // Person public myFriend = Person( 1, "john");

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
        favoriteNumber = favoriteNumber + 1;
        
    }

    function retrieve() public   view   returns (uint256){
        return favoriteNumber;
    }
    
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        //Person memory newPerson = Person(_favoriteNumber,_name);
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name]= _favoriteNumber;

    }

}