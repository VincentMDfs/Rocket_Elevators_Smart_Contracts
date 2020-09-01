//SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;
pragma experimental ABIEncoderV2;

contract MaterialProvider {
    // Material struct
    struct Material {
        string material;
        uint256 quantity;
        address requester;
    }

    // List of materials
    Material materialStruct;
    Material[] public materialList;

    // Calculate material
    function calculateMaterial(string memory object, uint256 number)
        public
        returns (bool success)
    {
        materialStruct.requester = msg.sender;
        if (compareStrings(object, "shafts")) {
            pushMaterialInsideArray("Aluminum Bars", (number*10));
            pushMaterialInsideArray("Concrete Block", (number*12));
        } else if (compareStrings(object, "controllers")) {
            pushMaterialInsideArray("Plastic", (number*2));
            pushMaterialInsideArray("Copper", (number*3));
        } else if (compareStrings(object, "doors")) {
            pushMaterialInsideArray("Stainless Sheet", (number*4));
            pushMaterialInsideArray("Stainless Frame", (number*1));
        } else if (compareStrings(object, "buttons")) {
            pushMaterialInsideArray("String", (number*1));
            pushMaterialInsideArray("Glass", (number*1));
        } else if (compareStrings(object, "motors")) {
            pushMaterialInsideArray("Engine", (number*1));
            pushMaterialInsideArray("Cable", (number*1));
        } else {
            return false;
        }
        return true;
    }

    //compare string
    function compareStrings(string memory a, string memory b) private 
       returns (bool) {
  return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked((b))) );
       }

    // push the material inside the array of materials
    function pushMaterialInsideArray(string memory material, uint256 quantity) private {
        materialStruct.material = material;
        materialStruct.quantity = quantity;
        materialList.push(materialStruct);
    }

    // Add material to the list of materials
    function addMaterial(string memory material, uint256 quantity)
        public
        returns (bool success)
    {
        materialStruct.material = material;
        materialStruct.quantity = quantity;
        materialStruct.requester = msg.sender;
        materialList.push(materialStruct);
        return true;
    }

    // Change owner of the transaction
    function changeRequester(uint256 position, address newRequester)
        public
        returns (bool success)
    {
        require(
            msg.sender == materialList[position].requester,
            "Only the requester can change the requester"
        );
        require(
            msg.sender == newRequester,
            "You cannot change the requester to yourself"
        );
        materialList[position].requester = newRequester;
        return true;
    }

    // Return the current list of materials
    function getMaterial(uint256 position)
        public
        view
        returns (
            string memory material,
            uint256 quantity,
            address requester
        )
    {
        return (
            materialList[position].material,
            materialList[position].quantity,
            materialList[position].requester
        );
    }

    //change material type
    function changeMaterialType(uint256 position, string memory newMaterial)
        public
        returns (bool success)
    {
        require(
            msg.sender == materialList[position].requester,
            "Only the requester can change the material type"
        );

        materialList[position].material = newMaterial;

        return true;
    }

    // Change the quantity of a material (only the requester)
    function changeQuantity(uint256 position, uint256 newQuantity)
        public
        returns (bool success)
    {
        require(
            msg.sender == materialList[position].requester,
            "Only the requester can change the quantity"
        );
        materialList[position].quantity = newQuantity;
        return true;
    }

    // Return the list of materials
    function getMaterials() public view returns (Material[] memory material) {
        return materialList;
    }
}
