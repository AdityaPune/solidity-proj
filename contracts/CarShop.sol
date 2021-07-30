pragma solidity >=0.4.11;

contract owned {
    address owner;
    constructor() { owner = msg.sender; }    

    modifier onlyOwner {
        require(
            msg.sender == owner,
            "Only owner can call this function."
        );
        _;
    }
}

contract CarShop is owned{

    struct Car{
        uint id;
        string name;   
        uint price;
    }
    mapping(uint => Car) public cars;
    mapping(uint => Car) public sold;

    uint sales;

    constructor() public {
        cars[0] = Car(0, "Toyota", 3000);
        cars[1] = Car(1, "Honda", 3500);
        cars[2] = Car(2, "Corolla", 2000);
    }

    
    uint public carsCount=2;   

    function addCar(string memory _name, uint _price) public onlyOwner {
        carsCount++; 
        cars[carsCount] = Car(carsCount, _name, _price);
    }

    function buyCar(uint _carid) public {
                
    }


}










