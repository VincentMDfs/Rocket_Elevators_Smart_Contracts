const { equal } = require("assert");
const { assert } = require("console");

const SolutionManufacturing = artifacts.require("SolutionManufacturing");
const QualityControl = artifacts.require("QualityControl");
const Shipping = artifacts.require("Shipping");
const MaterialProvider = artifacts.require("MaterialProvider");
const ProjectOffice = artifacts.require("ProjectOffice");
const Installation = artifacts.require("Installation");




contract("Shipping", (accounts) => {
  let quality,manufacturing;
  before(async () => {
    manufacturing = await SolutionManufacturing.deployed();
    quality = await QualityControl.deployed();
    shipping = await Shipping.deployed();
    m = await MaterialProvider.deployed();
    p = await ProjectOffice.deployed();
    i = await Installation.deployed();
  });

  describe("check adding multiple request to the shipping order", async () => {
    before("add multiple product to the list", async () => {
        r = await p.addComponents(1, 2, 8, 5);
        r1 = await m.calculateMaterial(r.receipt.to)
        result1 = await manufacturing.getOrder(r1.receipt.to)
        result2 = await quality.VerificationStamp(result1.receipt.to)
        ship = await shipping.A_receiveOrder(result2.receipt.to);
        await shipping.B_EverythingPacked();
        await shipping.C_EverythingShipped();
        await shipping.D_EverythingReceived();
        await i.A_Install(ship.receipt.to, "excelium");
        await i.B_Activate();

    });
    it("check if is a string", async () => {
        res = await i.C_ViewEverything();
        expect(String(res)).to.be.an("string");
    });
    it("check if active true", async () => {
        expect(res[0].active).to.be.eq(true);
    });
  });
});
