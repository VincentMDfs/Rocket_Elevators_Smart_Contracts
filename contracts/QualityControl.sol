pragma solidity >=0.4.22 <0.8.0;
pragma experimental ABIEncoderV2;

import './SolutionManufacturing.sol';

contract QualityControl {

    struct Permit{
        uint identifier;
        uint256 startdate;
        uint256 enddate;
        //uint datetime // 1512220800
    }

    struct Product{
        string name;
        uint quantity;
        bool verified;
    }

    struct Verification{
        Permit certificate;
        Permit perm;
        Product[] mList;
    }
    //Product[] mList;
    Verification v;
    uint index = 0;


    function generatePermit() public returns(Permit memory certificate){
        Permit memory p;
        p.identifier = now/2;
        p.startdate = now;
        p.enddate = now + 5* 365 days;
        return p;
    }

    function addToList(address a) public{
        v.certificate = generatePermit();
        v.perm = generatePermit();
        SolutionManufacturing.Product[] memory products = SolutionManufacturing(a).viewOrder();
        for(index;index<products.length;index++){
            Product memory p;
            p.verified = true;
            p.name = products[index].Name;
            p.quantity = products[index].Quantity;
            v.mList.push(p);
        }
    }

    function getVerification() public view returns(Verification memory){
        return v;
    }



}