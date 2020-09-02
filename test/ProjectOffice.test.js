// JS Test File for Project Office Contract
const ProjectOffice = artifacts.require("./ProjectOffice.sol");
//const truffleAssert = require('truffle-assertions');

contract("ProjectOffice", async (accounts) => {
    // store the contract instance at a higher level 
    // to enable access from all functions.
    // This will run before each test proceed.
    var ProjectOfficeInstance;
    //var requester = accounts[0];
    before(async function () {
        // set contract instance into a variable
        ProjectOfficeInstance = await ProjectOffice.deployed();
    })
            //INPUT                 OUTPUT
            //Battery   1           Shaft       8
            //Columns   2           Controller  1
            //Elevators 8           Doors       40
            //Floors    5           Buttons     96
            //                      Motors      8

    it("Checking GetComponents Return Matches", async function () { 
        var expectedValue = [1, 8, 40, 96, 8];
        // actual function parameters
        // addComponents(Batteries, Columns, Elevators, Floors)
        var AddComponents = await ProjectOfficeInstance.addComponents(1, 2, 8, 5);
        var GetComponents = await ProjectOfficeInstance.getComponents();
        assert.equal(expectedValue, GetComponents.toString(), "Numbers should match");
    })
});