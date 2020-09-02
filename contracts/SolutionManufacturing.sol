// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;
pragma experimental ABIEncoderV2;

import './MaterialProvider.sol';

contract SolutionManufacturing {

    mapping (string => uint256) public materials;
    
    struct Product {
        string Name;
        uint256 Quantity;
    }

     struct Controller {
        uint256 Plastic;
        uint256 Copper;
        
    }

    struct Shaft {
        uint256 AluminumBars;
        uint256 ConcreteBlock;

    }
    
    struct Door {
        uint256 StainlessSheet;
        uint256 StainlessFrame;
        
    }

    struct Button {
        uint256 Spring;
        uint256 Glass;
        
    }

    struct Motor {
        uint256 Engine;
        uint256 Cable;
        
    }
    Product productStruct;
    Product[] productList;
    uint private index = 0;
    

    constructor() public {

        materials["Plastic"] = 0;
        materials["Copper"] = 0;
        materials["AluminumBars"] = 0;
        materials["ConcreteBlock"] = 0;
        materials["StainlessSheet"] = 0;
        materials["StainlessFrame"] = 0;
        materials["Spring"] = 0;
        materials["Glass"] = 0;
        materials["Engine"] = 0;
        materials["Cable"] = 0;

    }

        //     INHERITANCE	ITEM		CALCULUS		TOTAL
        // Shafts		Aluminum Bars	10 per shaft		80
        // Shafts		Concrete Block	12 per shaft		96
        // Controllers	Plastic		2 per controller	2
        // Controllers	Copper		3 per controller	3
        // Doors		Stainless Sheet	4 per elevator		32
        // Doors		Stainless Frame	1 per elevator		8
        // Buttons		Spring		1 per button		96
        // Buttons		Glass		1 per button		96
        // Motors		Engine		1 per elev		8
        // Motors		Cable		1 per elevator		8

    function makeController() private returns (uint256 numControllers) {
        Controller memory controller1 = Controller(2,3);
        numControllers = materials["Plastic"] /= controller1.Plastic;
        productStruct.Name = "Controller";
        productStruct.Quantity = numControllers;
        productList.push(productStruct);
        return numControllers;
    }

    function makeShaft() private returns (uint256 numShafts) {
        Shaft memory shaft1 = Shaft(10,12);
        numShafts = materials["AluminumBars"] /= shaft1.AluminumBars;
        productStruct.Name = "Shafts";
        productStruct.Quantity = numShafts;
        productList.push(productStruct);
        return numShafts;
    }

    function makeDoor() private returns (uint256 numDoors) {
        Door memory door1 = Door(4,1);
        numDoors = materials["StainlessSheet"] /= door1.StainlessSheet;
        productStruct.Name = "Doors";
        productStruct.Quantity = numDoors;
        productList.push(productStruct);
        return numDoors;
    }

    function makeButton() private returns (uint256 numButtons) {
        Button memory button1 = Button(1,1);
        numButtons = materials["Glass"] /= button1.Glass;
        productStruct.Name = "Buttons";
        productStruct.Quantity = numButtons;
        productList.push(productStruct);
        return numButtons;
    }

    function makeMotor() private returns (uint256 numMotors) {
        Motor memory motor1 = Motor(1,1);
        numMotors = materials["Engine"] /= motor1.Engine;
        productStruct.Name = "Motors";
        productStruct.Quantity = numMotors;
        productList.push(productStruct);
        return numMotors;
    }

    function getOrder(address a) public {
        MaterialProvider.Material[] memory m = MaterialProvider(a).getMaterials();
        for(index; index<m.length;index++){
                materials[m[index].material] = m[index].quantity;
        }
        makeController();
        makeShaft();
        makeDoor();
        makeButton();
        makeMotor();

    }

    function viewOrder() public view returns (Product[] memory) {
        return productList;
        
    }
}