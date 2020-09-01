// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;

contract SolutionManufacturing {
        mapping (string => uint256) public materials;
    
    
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


    function makeController(uint256 numControllers) public returns (bool) {
        Controller memory controller1 = Controller(2,3);
        if (materials["Plastic"] >= numControllers * controller1.Plastic && materials["Copper"] >= numControllers * controller1.Copper){

            materials["Plastic"] -= numControllers * controller1.Plastic;
            materials["Copper"] -= numControllers * controller1.Copper;
            return true;
        }
        else {
            return false;
        }     
    }
    
    function makeShaft(uint256 numShafts) public returns(bool) {
        Shaft memory shaft1 = Shaft(10,12);
        
        if (materials["AluminumBars"] >= numShafts * shaft1.AluminumBars &&materials["ConcreteBlock"] >= numShafts * shaft1.ConcreteBlock){

            materials["AluminumBars"] -= numShafts * shaft1.AluminumBars;
            materials["ConcreteBlock"] -= numShafts * shaft1.ConcreteBlock;
            return true;
        }
        else {
            return false;
        }
        
    }
    
    function makeDoor(uint256 numDoors) public returns(bool) {

        Door memory door1 = Door(4,1);

        if (materials["StainlessSheet"] >= numDoors * door1.StainlessSheet && materials["StainlessFrame"] >= numDoors * door1.StainlessSheet){
            materials["StainlessSheet"] -= numDoors * door1.StainlessSheet;
            materials["StainlessFrame"] -= numDoors * door1.StainlessFrame;
            return true;
        }
        else {
            return false;
        }
    }
    
    function makeButton(uint256 numButtons) public returns (bool) {

        Button memory button1 = Button(1,1);

        if (materials["Spring"] >= numButtons * button1.Spring && materials["Glass"] >= numButtons * button1.Glass){

            materials["Spring"] -= numButtons * button1.Spring;
            materials["Glass"] -= numButtons * button1.Glass;
            return true;
        }
        else {
            return false;
        }
    }
    
    function makeMotor(uint256 numMotors) public returns (bool) {

        Motor memory motor1 = Motor(1,1);

        if (materials["Engine"] >= numMotors * motor1.Engine && materials["Cable"] >= numMotors * motor1.Cable){
            
            materials["Engine"] -= numMotors * motor1.Engine;
            materials["Cable"] -= numMotors * motor1.Cable;
            return true; 
        }
        else {
            return false;
        }    
    }
    
    function makeOrder(uint256 d, uint256 b, uint256 c, uint256 m, uint256 s) public returns (bool) {
        if (makeController(c) == true && makeShaft(s) == true && makeDoor(d) == true && makeButton(b) == true && makeMotor(m) == true){
            
            return true;
        }
        else {

            return false;

        }       
    }
}