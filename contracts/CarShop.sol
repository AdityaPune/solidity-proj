pragma solidity >=0.4.11;

contract CarShop{

    struct Car{
        string name;   
        uint price;
        //uint add;
    }

    Car[] public cars;

    function addCar(string memory _name, uint _price ) public {
        cars.push(Car(_name, _price));
    }


}








