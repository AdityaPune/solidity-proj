pragma solidity >=0.4.11;

contract owned {
    //The 'owned' contract is for the sole purpose of
    //ensuring that only the owner can call some
    //functions. In our case, the addCar function
    //to add a car into the inventory
    
    
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
    
    //CarShop contract is where the inventory and sales data is stored.
    //Functions to add cars into the inventory(owner only) and to buy a car(anyone on the blockchain)
    //are present

    //Car struct to act as the value parameter in our mapping
    struct Car{
        string name;   
        uint price;
    }
    
    
    //We will store buyer info in an array where the following data is present
    //for each buyer
    struct Buyers{
        address carbuyer;
        string name;   
        uint price;
    }
    
    
    
    address buyeraddress;
    
    
    //The following array will have records all the cars bought
    Buyers[] public carbuyerarray;
    
    //The cars mapping will have a list of cars in the shop's inventory.
    //Only the creator of the smart contract can add cars into this mapping
    mapping(uint => Car) public cars;
    
    

    //Variable to keep track of the total sales of our car shop
    uint sales;

    constructor() public {
        //Initializing the cars mapping with 3 Cars
        //Cars could be added manually as well but
        //Only by the creator of the contract
        cars[0] = Car( "Toyota", 3000);
        cars[1] = Car( "Honda", 3500);
        cars[2] = Car( "Corolla", 2000);
    }

    
    uint carsCount=2;   

    function addCar(string memory _name, uint _price) public onlyOwner {
        //If an address different to the owner calls this function
        //car won't get added to the inventory
        
        carsCount++; 
        cars[carsCount] = Car( _name, _price);
    }
    
    uint soldCount = 0;
    
    event salesEvent(address indexed _from, uint _value);
    function showSales() public {
        //Function to show the total sales
        emit salesEvent(msg.sender, sales);
    }
    
    event unitsEvent(address indexed _from, uint _value);
    function numberOfUnitsSold() public {
        //Function to show the total units sold
        emit unitsEvent(msg.sender, soldCount);
    }
    
    
    function buyCar(uint _carid) public {
        //Any address on the blockchain can call this function and buy
        //a car. We keep a record of the total sales and total units sold
        //inside the two variables sales and soldCount.
        
        buyeraddress = msg.sender;
        soldCount++;
        sales = sales+cars[_carid].price;
        carbuyerarray.push(Buyers(buyeraddress, cars[_carid].name, cars[_carid].price));
        delete cars[_carid];
    }

}


