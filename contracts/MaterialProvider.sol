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
        ProjectOffice.Components[] memory components = ProjectOffice(a).getComponents();
        for(index;index<components.length;index++) {
            pushMaterialInsideArray("Aluminum Bars", (components[index].Shafts * 10));
            pushMaterialInsideArray("Concrete Block", (components[index].Shafts * 12));
            pushMaterialInsideArray("Plastic", (components[index].Controllers * 2));
            pushMaterialInsideArray("Copper", (components[index].Controllers * 3));
            pushMaterialInsideArray("Stainless Sheet", (components[index].Doors * 4));
            pushMaterialInsideArray("Stainless Frame", (components[index].Doors * 1));
            pushMaterialInsideArray("Spring", (components[index].Buttons * 1));
            pushMaterialInsideArray("Glass", (components[index].Buttons * 1));
            pushMaterialInsideArray("Engine", (components[index].Motors * 1));
            pushMaterialInsideArray("Cable", (components[index].Motors * 1));
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
