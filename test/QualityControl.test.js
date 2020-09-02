const { equal } = require("assert");
const { assert } = require("console");

const SolutionManufacturing = artifacts.require("SolutionManufacturing");
const MaterialProvider = artifacts.require("MaterialProvider");
const ProjectOffice = artifacts.require("ProjectOffice");
const QualityControl = artifacts.require("QualityControl");

contract("QualityControl", (accounts) => {
  let solution;
  let quality;
  let m;
  let p;
  before(async () => {
    solution = await SolutionManufacturing.deployed();
    quality = await QualityControl.deployed();
    m = await MaterialProvider.deployed();
    p = await ProjectOffice.deployed();
  });
  

  describe("check adding multiple request", async () => {
    before("add to list", async () => {
      r = await p.addComponents(1, 2, 8, 5);
      r1 = await m.calculateMaterial(r.receipt.to)
      result = await solution.getOrder(r1.receipt.to)


      await quality.addToList(result.receipt.to);
    });
    it("return string", async () => {
      q = await quality.getVerification();
      expect(String(q)).to.be.an("string");
      
    });
    it("return string", async () => {
      console.log(q.mList[0].verified != true);
      expect(q.mList[0].verified).to.equal(true);
      
    });


  });
});