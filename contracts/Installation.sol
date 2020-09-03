//SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;
pragma experimental ABIEncoderV2;
import "./Shipping.sol";


//this was made with the heart of everyone :D
contract Installation {
	uint64 private index;
	uint64 private index1;

	FinishedProduct private finishedProduct;
	FinishedProduct[] private finishedProductList;

	struct FinishedProduct {
		address addressOfTech;
		bool installed;
		string installationType;
		bool active;
		string name;
		uint64 quantity;
	}

	//install all the product
	function A_Install(address a, string memory TypeOfInstalation) public {
		Shipping.Product[] memory inputProduct = Shipping(a).E_viewEverything();
		TypeOfInstalation = _toLower(TypeOfInstalation);
		if(compareStrings(TypeOfInstalation, "excelium") || compareStrings(TypeOfInstalation, "premium") || compareStrings(TypeOfInstalation, "standard")) {
			finishedProduct.installationType = TypeOfInstalation;
		}
		uint64 numButtons;
		uint64 numElevator;
		finishedProduct.installed = true;
		finishedProduct.addressOfTech = msg.sender;
		for(index;index<inputProduct.length;index++) {
			if(compareStrings(inputProduct[index].name, "Shafts")){
				finishedProduct.name = "Elevator";
				finishedProduct.quantity = inputProduct[index].quantity;
				finishedProductList.push(finishedProduct);
				numElevator = inputProduct[index].quantity;
			}else if(compareStrings(inputProduct[index].name, "Controller")) {
				finishedProduct.name = "Battery";
				finishedProduct.quantity = inputProduct[index].quantity;
				finishedProductList.push(finishedProduct);
			}else if(compareStrings(inputProduct[index].name, "Buttons")) {
				numButtons = inputProduct[index].quantity;
			}
		}
		finishedProduct.name = "Column";
		finishedProduct.quantity = (numButtons-(numElevator*8))/16;
		finishedProductList.push(finishedProduct);
	}


	//activate all the finished product
	function B_Activate() public {
		for(index1;index1<finishedProductList.length;index1++) {
			finishedProductList[index1].active = true;
		}
	}

	function C_ViewEverything() public view returns(FinishedProduct[] memory) {
		return finishedProductList;
	}


	//put string to lower case to then later compare
	function _toLower(string memory str) internal pure returns (string memory) {
        bytes memory bStr = bytes(str);
        bytes memory bLower = new bytes(bStr.length);
        for (uint64 i = 0; i < bStr.length; i++) {
            // Uppercase character...
            if ((uint8(bStr[i]) >= 65) && (uint8(bStr[i]) <= 90)) {
                // So we add 32 to make it lowercase
                bLower[i] = bytes1(uint8(bStr[i]) + 32);
            } else {
                bLower[i] = bStr[i];
            }
        }
        return string(bLower);
    }

	//compare strings
	function compareStrings (string memory a, string memory b) private pure returns (bool) {
		return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked((b))) );
	}

}
