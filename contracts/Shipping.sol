//SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;
pragma experimental ABIEncoderV2;

contract Shipping {
	uint private indexReceivedOrder;
	uint private indexPacked;
	uint private indexShipped;
	uint private indexReceived;
    Product[] private productList;
    Product product;


	struct Product {
		string name;
        uint quantity;
        bool verified;
		bool packaged;
		bool shipped;
		bool received;
	}

	// For each produit received, create a product and push the product in the productList
	function receiveOrder(address a) public {
		//QualityControl.Components[] memory components = QualityControl(a).getVerification();
		//for(indexReceivedOrder;indexReceivedOrder<components.length;indexReceivedOrder++){
		//		if(components[indexReceivedOrder].bool) {
			//		components[indexReceivedOrder].name	= product.name;
			//		components[indexReceivedOrder].quantity	= product.quantity;
			//		components[indexReceivedOrder].verified	= product.verified;
			//		productList.push(product);
			//	}
		//}
	}

	
	// For each product in the product list, make packed at true then call EverythingShipped
	function EverythingPacked() public {
		/*
		for(indexPacked;indexPacked<productList.length;indexPacked++) {
			if (!productList[indexPacked].packed){
				productList[indexPacked].packed = true;
			}
		}
		*/
	}

	// For each product in the product list, make shipped at true
	function EverythingShipped() public {
		/*
		for(indexShipped;indexShipped<productList.length;indexShipped++) {
			if (!productList[indexShipped].shipped){
				productList[indexShipped].shipped = true;
			}
		}
		*/

	}

	// For each product in the product list, make received at true
	function EverythingReceived() public {
		/*
		for (indexReceived;indexReceived<productList.length;indexReceived++) {
			if(!productList[indexReceived].received) {
				productList[indexReceived].received = true
			}
		}
		*/
	}

	function viewEverything() public view returns(Product[] memory) {
		return productList;
	}
}