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

    // Calculate material
    function calculateMaterial(string memory object, int256 number)
        public
        returns (bool success)
    {
        materialStruct.requester = msg.sender;
        if (bytes(object).length == bytes("shafts").length) {
            materialStruct.material = "Aluminum Bars";
            materialStruct.quantity = number * 10;
            materialList.push(materialStruct);
            materialStruct.material = "Concrete Block";
            materialStruct.quantity = number * 12;
            materialList.push(materialStruct);
        } else if (bytes(object).length == bytes("controllers").length) {
            materialStruct.material = "Plastic";
            materialStruct.quantity = number * 2;
            materialList.push(materialStruct);
            materialStruct.material = "Copper";
            materialStruct.quantity = number * 3;
            materialList.push(materialStruct);
        } else if (bytes(object).length == bytes("doors").length) {
            materialStruct.material = "Stainless Sheet";
            materialStruct.quantity = number * 4;
            materialList.push(materialStruct);
            materialStruct.material = "Stainless Frame";
            materialStruct.quantity = number * 1;
            materialList.push(materialStruct);
        } else if (bytes(object).length == bytes("buttons").length) {
            materialStruct.material = "Spring";
            materialStruct.quantity = number * 1;
            materialList.push(materialStruct);
            materialStruct.material = "Glass";
            materialStruct.quantity = number * 1;
            materialList.push(materialStruct);
        } else if (bytes(object).length == bytes("motors").length) {
            materialStruct.material = "Engine";
            materialStruct.quantity = number * 1;
            materialList.push(materialStruct);
            materialStruct.material = "Cable";
            materialStruct.quantity = number * 1;
            materialList.push(materialStruct);
        } else {
            return false;
        }
        return true;
    }

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

    // Change the quantity of a material (only the requester)
    function changeQuatity(uint256 position, int256 newQuatity)
        public
        returns (bool success)
    {
        require(
            msg.sender == materialList[position].requester,
            "Only the requester can change the quantity"
        );
        materialList[position].quantity = newQuatity;
        return true;
    }

    // // Change owner of the transaction
    // function changeRequester(uint256 position, address newRequester)
    //     public
    //     returns (bool success)
    // {
    //     require(
    //         msg.sender == materialList[position].requester,
    //         "Only the requester can change the requester"
    //     );
    //     require(
    //         msg.sender == newRequester,
    //         "You cannot change the requester to yourself"
    //     );
    //     materialList[position].requester = newRequester;
    //     return true;
    // }

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

    // Return the list of materials
    function getMaterials() public view returns (Material[] memory material) {
        return materialList;
    }
}
