const Migrations = artifacts.require("Migrations");
const MaterialProvider = artifacts.require("MaterialProvider");
const ProjectOffice = artifacts.require("ProjectOffice");
const Shipping = artifacts.require("Shipping");
const QualityControl = artifacts.require("QualityControl");
const SolutionManufacturing = artifacts.require("SolutionManufacturing");




module.exports = function (deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(MaterialProvider);
  deployer.deploy(ProjectOffice);
  deployer.deploy(QualityControl);
  deployer.deploy(SolutionManufacturing);
  deployer.deploy(Shipping);
};
