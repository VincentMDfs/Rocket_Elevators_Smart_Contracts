const { equal } = require("assert");
const { assert } = require("console");

const SolutionManufacturing = artifacts.require("SolutionManufacturing");
const QualityControl = artifacts.require("QualityControl");
const Shipping = artifacts.require("Shipping");



contract("Shipping", (accounts) => {
  let quality,manufacturing;
  before(async () => {
    manufacturing = await SolutionManufacturing.deployed();
    quality = await QualityControl.deployed();
    shipping = await Shipping.deployed();
  });

  describe("check adding multiple request to the shipping order", async () => {
    before("add multiple product to the list", async () => {
        result1 = await manufacturing.getOrder()
        result2 = await quality.addToList(result1.receipt.to)
        await shipping.receiveOrder(result2.receipt.to);
        await shipping.EverythingPacked();
        await shipping.EverythingShipped();
        await shipping.EverythingReceived();
    });
    it("check if is a string", async () => {
        res = await shipping.viewEverything();
        expect(String(res)).to.be.an("string");
    });
    it("check if shipped true", async () => {
        expect(res[0].shipped).to.be.eq(true);
    });

    // it("return 80 for quantity", async () => {
    //   expect(listMaterialsResult[0].quantity).to.be.eq("80");
    // });
  });
});
