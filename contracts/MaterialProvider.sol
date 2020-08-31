//SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;
pragma experimental ABIEncoderV2;

contract MaterialProvider {
    // Material struct
    struct Material {
        string material;
        int256 quantity;
        address requester;
    }

    // List of materials
    Material materialStruct;
    Material[] public materialList;

    // Add material to the list of materials
    function addMaterial(string memory material, int256 quantity)
        public
        returns (bool success)
    {
        materialStruct.material = material;
        materialStruct.quantity = quantity;
        materialStruct.requester = msg.sender;
        materialList.push(materialStruct);
        return true;
    }

    // Return the current list of materials
    function getMaterial(uint256 position)
        public
        view
        returns (
            string memory material,
            int256 quantity,
            address requester
        )
    {
        return (
            materialList[position].material,
            materialList[position].quantity,
            materialList[position].requester
        );
    }

    // Return the list of materials
    function getMaterials() public view returns (Material[] memory material) {
        return materialList;
    }
}
