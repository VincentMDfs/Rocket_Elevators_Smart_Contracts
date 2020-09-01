const { equal } = require("assert");
const { assert } = require("console");

const MaterialProvider = artifacts.require("MaterialProvider");

contract("MaterialProvider", (accounts) => {
  let material;
  let materialResult;
  before(async () => {
    material = await MaterialProvider.deployed();
  });

  describe("check adding multiple request", async () => {
    before("add multiple materials to the list", async () => {
      
      await material.calculateMaterial("shafts", 8)
      await material.calculateMaterial("controllers", 1)
      await material.calculateMaterial("doors", 40)
      await material.calculateMaterial("buttons", 96)
      await material.calculateMaterial("motors", 8)

    });
    it("return string", async () => {
      listMaterialsResult = await material.getMaterials();
      expect(String(listMaterialsResult)).to.be.an("string");

    });

    it("return 80 for quantity", async () => {
      expect(listMaterialsResult[0].quantity).to.be.eq("80")
    });
  });

});
