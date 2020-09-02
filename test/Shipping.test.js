const { equal } = require("assert");
const { assert } = require("console");

const SolutionManufacturing = artifacts.require("SolutionManufacturing");
const QualityControl = artifacts.require("QualityControl");
const Shipping = artifacts.require("Shipping");
const MaterialProvider = artifacts.require("MaterialProvider");
const ProjectOffice = artifacts.require("ProjectOffice");



contract("Shipping", (accounts) => {
  let quality,manufacturing;
  before(async () => {
    manufacturing = await SolutionManufacturing.deployed();
    quality = await QualityControl.deployed();
    shipping = await Shipping.deployed();
    m = await MaterialProvider.deployed();
    p = await ProjectOffice.deployed();
  });

  describe("check adding multiple request to the shipping order", async () => {
    before("add multiple product to the list", async () => {
        r = await p.addComponents(1, 2, 8, 5);
        r1 = await m.calculateMaterial(r.receipt.to)
        result1 = await manufacturing.getOrder(r1.receipt.to)
        result2 = await quality.addToList(result1.receipt.to)
        await shipping.A_receiveOrder(result2.receipt.to);
        await shipping.B_EverythingPacked();
        await shipping.C_EverythingShipped();
        await shipping.D_EverythingReceived();
    });
    it("check if is a string", async () => {
        res = await shipping.E_viewEverything();
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
