//SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;
pragma experimental ABIEncoderV2;
import "./QualityControl.sol";

contract Shipping {
	uint64 private indexReceivedOrder;
	uint64 private indexPacked;
	uint64 private indexShipped;
	uint64 private indexReceived;
    Product[] private productList;
    Product product;


	struct Product {
		string name;
        uint64 quantity;
		bool packaged;
		bool shipped;
		bool received;
	}

	// For each produit received, create a product and push the product in the productList
	function A_receiveOrder(address a) public {
		QualityControl.Product[] memory inputProduct = QualityControl(a).getVerification().mList;
		for(indexReceivedOrder;indexReceivedOrder<inputProduct.length;indexReceivedOrder++){
			if(inputProduct[indexReceivedOrder].verified) {
				product.name = inputProduct[indexReceivedOrder].name;
				product.quantity = inputProduct[indexReceivedOrder].quantity;
				productList.push(product);
			}
		}
	}

	
	// For each product in the product list, make packed at true then call EverythingShipped
	function B_EverythingPacked() public {
		for(indexPacked;indexPacked<productList.length;indexPacked++) {
			if (!productList[indexPacked].packaged){
				productList[indexPacked].packaged = true;
			}
		}
	}

	// For each product in the product list, make shipped at true
	function C_EverythingShipped() public {
		for(indexShipped;indexShipped<productList.length;indexShipped++) {
			if (!productList[indexShipped].shipped){
				productList[indexShipped].shipped = true;
			}
		}
	}

	// For each product in the product list, make received at true
	function D_EverythingReceived() public {
		for (indexReceived;indexReceived<productList.length;indexReceived++) {
			if(!productList[indexReceived].received) {
				productList[indexReceived].received = true;
			}
		}
	}

	function E_viewEverything() public view returns(Product[] memory) {
		return productList;
	}
}
