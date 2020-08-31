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
    it("return 1", async () => {
      listMaterialsResult = await material.getMaterials();
      assert.equal(
        String(listMaterialsResult),
        "iron,1,0x627306090abaB3A6e1400e9345bC60c78a8BEf57,iron,10,0x627306090abaB3A6e1400e9345bC60c78a8BEf57,copper,20,0x627306090abaB3A6e1400e9345bC60c78a8BEf57",
      );
    });
  });
});
