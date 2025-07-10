// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract SimpleStorage{

    uint256  public  favoriteNumber;

    //uint256[] listofFavoriteNumbers;

    struct Person{
        uint256 myFavoriteNumber;
        string name;

    }

    Person[] public listOfPeople;

    // Person public myFriend = Person( 1, "john");

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
        favoriteNumber = favoriteNumber + 1;
        
    }

    function retrieve() private  view   returns (uint256){
        return favoriteNumber;
    }
    
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        //Person memory newPerson = Person(_favoriteNumber,_name);
        listOfPeople.push(Person(_favoriteNumber, _name));

    }

}