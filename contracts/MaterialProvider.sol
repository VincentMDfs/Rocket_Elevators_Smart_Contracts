//SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;
pragma experimental ABIEncoderV2;

import "./ProjectOffice.sol";

contract MaterialProvider {
    uint private index = 0;
    // Material struct
    struct Material {
        string material;
        uint256 quantity;
    }//address of creator
   
    // List of materials
    Material materialStruct;
    Material[] private materialList;

    // Calculate material
    function calculateMaterial(address a)
        public
    {
        ProjectOffice.Components[] memory componants = ProjectOffice(a).getComponents();
        for(index;index<componants.length;index++) {
            pushMaterialInsideArray("Aluminum Bars", (componants[index].Shafts * 10));
            pushMaterialInsideArray("Concrete Block", (componants[index].Shafts * 12));
            pushMaterialInsideArray("Plastic", (componants[index].Controllers * 2));
            pushMaterialInsideArray("Copper", (componants[index].Controllers * 3));
            pushMaterialInsideArray("Stainless Sheet", (componants[index].Doors * 4));
            pushMaterialInsideArray("Stainless Frame", (componants[index].Doors * 1));
            pushMaterialInsideArray("String", (componants[index].Buttons * 1));
            pushMaterialInsideArray("Glass", (componants[index].Buttons * 1));
            pushMaterialInsideArray("Engine", (componants[index].Motors * 1));
            pushMaterialInsideArray("Cable", (componants[index].Motors * 1));
        }
    }

    // push the material inside the array of materials
    function pushMaterialInsideArray(string memory material, uint256 quantity)
        private
    {
        materialStruct.material = material;
        materialStruct.quantity = quantity;
        materialList.push(materialStruct);
    }

    // Return the list of materials
    function getMaterials() public view returns (Material[] memory material) {
        return materialList;
    }
}
