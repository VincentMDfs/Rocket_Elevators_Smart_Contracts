const MaterialProvider = artifacts.require("MaterialProvider");

contract("MaterialProvider", (accounts) => {
  let material;
  let materialResult;
  before(async () => {
    material = await MaterialProvider.deployed();
  });

  describe("add material to list and test if it's the same", async () => {
    before("add material to the list", async () => {
      await material.addMaterial("iron", 1);
    });
    it("return 1", async () => {
      materialResult = await material.getMaterial(0);
      assert.equal(String(materialResult.quantity), "1");
    });
  });

  describe("check list of materials", async () => {
    before("add multiple materials to the list", async () => {
      await material.addMaterial("iron", 10);
      await material.addMaterial("copper", 20);
    });
    it("return 1 string", async () => {
      listMaterialsResult = await material.getMaterials();
      expect(String(listMaterialsResult)).to.be.an("string");
    });
  });
});
