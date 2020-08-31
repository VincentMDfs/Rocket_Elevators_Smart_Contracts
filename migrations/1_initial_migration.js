const Migrations = artifacts.require("Migrations");
const MaterialProvider = artifacts.require("MaterialProvider");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(MaterialProvider);
};
