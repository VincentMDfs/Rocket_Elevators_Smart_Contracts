pragma solidity >=0.4.22 <0.8.0;
pragma experimental ABIEncoderV2;
//SPDX-License-Identifier: MIT
contract ProjectOffice {

    Components[] components;
    address requester;

    function getComponents() public view returns (Components[] memory){
        return components;
    }

    struct Components {
        uint64 Controllers;
        uint64 Shafts;
        uint64 Doors;
        uint64 Buttons;
        uint64 Motors;
    }
    
    // addComponents by requester with input from the Order
    function addComponents(
        uint64 Batteries, uint64 Columns, uint64 Elevators, uint64 Floors
            )
    public 
    // Extrapolation by cacul
    // onlyRequester 
    {

        // Calcul base on input
        //Shafts        1 per elevator              8
        //Controllers    1 per batteries            1
        //Doors         1 per floor per elev        40
        //Buttons       8 per elev + 16 per col     96
        //Motors        1 per elev                  8
        Components memory c;
        c.Shafts = Elevators;
        c.Controllers = Batteries;
        c.Doors = Elevators * Floors;
        c.Buttons = (Elevators * 8) + (Columns * 16);
        c.Motors = Elevators;
        
        // Get the order details by orderNumber call
        components.push(c);
    }

}