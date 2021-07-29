pragma solidity >=0.4.11;

contract CarShop{

    struct Car{
        uint id;
        string name;   
        uint price;
    }

    mapping(uint => Car) public cars;

    uint public carsCount;

    function addCar(string memory _name, uint _price) private {
        carsCount++; 
        cars[carsCount] = Car(carsCount, _name, _price);
    }


}








