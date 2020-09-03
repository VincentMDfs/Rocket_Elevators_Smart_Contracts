// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;
pragma experimental ABIEncoderV2;

import './MaterialProvider.sol';

contract SolutionManufacturing {

    mapping (string => uint64) private materials;
    
    struct Product {
        string Name;
        uint64 Quantity;
    }

     struct Controller {
        uint64 Plastic;
        uint64 Copper;
        
    }

    struct Shaft {
        uint64 AluminumBars;
        uint64 ConcreteBlock;

    }
    
    struct Door {
        uint64 StainlessSheet;
        uint64 StainlessFrame;
        
    }

    struct Button {
        uint64 Spring;
        uint64 Glass;
        
    }

    struct Motor {
        uint64 Engine;
        uint64 Cable;
        
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

    function makeController() private returns (uint64 numControllers) {
        if(materials["Plastic"] == 0){
            return 0;
        }
        Controller memory controller1 = Controller(2,3);
        numControllers = materials["Plastic"] /= controller1.Plastic;
        productStruct.Name = "Controller";
        productStruct.Quantity = numControllers;
        productList.push(productStruct);
        materials["Plastic"] = 0;
        materials["copper"] = 0;
        return numControllers;
    }

    function makeShaft() private returns (uint64 numShafts) {
        if(materials["AluminumBars"] == 0){
            return 0;
        }
        Shaft memory shaft1 = Shaft(10,12);
        numShafts = materials["AluminumBars"] /= shaft1.AluminumBars;
        productStruct.Name = "Shafts";
        productStruct.Quantity = numShafts;
        productList.push(productStruct);
        materials["AluminumBars"] = 0;
        materials["ConcreteBlock"] = 0;
        return numShafts;
    }

    function makeDoor() private returns (uint64 numDoors) {
        if(materials["StainlessSheet"] == 0){
            return 0;
        }
        Door memory door1 = Door(4,1);
        numDoors = materials["StainlessSheet"] /= door1.StainlessSheet;
        productStruct.Name = "Doors";
        productStruct.Quantity = numDoors;
        productList.push(productStruct);
        materials["StainlessSheet"] = 0;
        materials["StainlessFrame"] = 0;
        return numDoors;
    }

    function makeButton() private returns (uint64 numButtons) {
        if(materials["Glass"] == 0){
            return 0;
        }
        Button memory button1 = Button(1,1);
        numButtons = materials["Glass"] /= button1.Glass;
        productStruct.Name = "Buttons";
        productStruct.Quantity = numButtons;
        productList.push(productStruct);
        materials["Glass"] = 0;
        materials["Spring"] = 0;
        return numButtons;
    }

    function makeMotor() private returns (uint64 numMotors) {
        if(materials["Engine"] == 0){
            return 0;
        }
        Motor memory motor1 = Motor(1,1);
        numMotors = materials["Engine"] /= motor1.Engine;
        productStruct.Name = "Motors";
        productStruct.Quantity = numMotors;
        productList.push(productStruct);
        materials["Engine"] = 0;
        materials["Cable"] = 0;
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