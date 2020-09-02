const { equal } = require("assert");
const { assert } = require("console");

const MaterialProvider = artifacts.require("MaterialProvider");

const ProjectOffice = artifacts.require("ProjectOffice");

contract("MaterialProvider", (accounts) => {
  let material;
  let materialResult;
  let product;
  before(async () => {
    product = await ProjectOffice.deployed();
    material = await MaterialProvider.deployed();
  });
  

  describe("check adding multiple request", async () => {
    before("add multiple materials to the list", async () => {
      result = await product.addComponents(1,2,8,5)


      await material.calculateMaterial(result.receipt.to);
    });
    it("return string", async () => {
      listMaterialsResult = await material.getMaterials();
      expect(String(listMaterialsResult)).to.be.an("string");
    });

    it("return 80 for quantity", async () => {
      expect(listMaterialsResult[0].quantity).to.be.eq("80");
    });
  });
});
