const Coursetro = artifacts.require("./Coursetro.sol");
const MyContract = artifacts.require("./MyContract.sol");

module.exports = function(deployer) {
  deployer.deploy(Coursetro);
  deployer.deploy(MyContract);
};
