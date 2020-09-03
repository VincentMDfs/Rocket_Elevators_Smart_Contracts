import ProjectOffice from "../../build/contracts/ProjectOffice.json";
import MaterialProvider from "../../build/contracts/MaterialProvider.json";
//import SolutionManufacturing from '../../build/contracts/SolutionManufacturing.json'
//import QualityControl from '../../build/contracts/QualityControl.json'
//import Shipping from '../../build/contracts/Shipping.json'
//import Installation from '../../build/contracts/Installation.json'

const options = {
  web3: {
    block: false,
    fallback: {
      type: "ws",
      url: "ws://127.0.0.1:9545",
    },
  },

  contracts: [ProjectOffice, MaterialProvider],
  events: {
    SimpleStorage: ["StorageSet"],
  },
  polls: {
    accounts: 15000,
  },
};

export default options;
