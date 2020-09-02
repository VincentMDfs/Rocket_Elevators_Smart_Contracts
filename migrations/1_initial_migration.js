const Migrations = artifacts.require("Migrations");
const MaterialProvider = artifacts.require("MaterialProvider");
const ProjectOffice = artifacts.require("ProjectOffice");


module.exports = function (deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(MaterialProvider);
  deployer.deploy(ProjectOffice);

};
