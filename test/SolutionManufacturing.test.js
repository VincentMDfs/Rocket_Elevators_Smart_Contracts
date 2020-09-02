const { equal } = require("assert");
const { assert } = require("console");

const SolutionManufacturing = artifacts.require("SolutionManufacturing");
const MaterialProvider = artifacts.require("MaterialProvider");
const ProjectOffice = artifacts.require("ProjectOffice");


contract("SolutionManufacturing", (accounts) => {
  let component;
  let materialprovider;
  let project;
  before(async () => {
    component = await SolutionManufacturing.deployed();
    materialprovider = await MaterialProvider.deployed();
    project = await ProjectOffice.deployed();
  });
  describe("check adding multiple request", async () => {
    before("add multiple materials to the list", async () => {

      r = await project.addComponents(1, 2, 8, 5);
      r1 = await materialprovider.calculateMaterial(r.receipt.to)
      await component.getOrder(r1.receipt.to);
    });
    it("return string", async () => {
        listProductsResult = await component.viewOrder();
          expect(String(listProductsResult)).to.be.an("string");
    });  
    it("return 1 for Controller", async () => {
        expect(listProductsResult[0].Name).to.be.eq("Controller");
        expect(listProductsResult[0].Quantity).to.be.eq("1");
    });
    it("return 8 for Shafts", async () => {
        expect(listProductsResult[1].Name).to.be.eq("Shafts");
        expect(listProductsResult[1].Quantity).to.be.eq("8");
    });
    it("return 40 for Doors", async () => {
        expect(listProductsResult[2].Name).to.be.eq("Doors");
        expect(listProductsResult[2].Quantity).to.be.eq("40");
    });
    it("return 96 for Buttons", async () => {
        expect(listProductsResult[3].Name).to.be.eq("Buttons");
        expect(listProductsResult[3].Quantity).to.be.eq("96");
    });
    it("return 1 for Motors", async () => {
        expect(listProductsResult[4].Name).to.be.eq("Motors");
        expect(listProductsResult[4].Quantity).to.be.eq("8");
    });
  });
});