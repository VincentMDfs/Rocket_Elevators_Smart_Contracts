<template>
    <b-card v-if="isDrizzleInitialized" header="">
        <b-card-text>
        <b-button @click.prevent="sendOrder" variant="success"
            >Manufacture the products</b-button
        >
        </b-card-text>
        <template v-slot:footer>
        <b-table
            striped
            hover
            v-if="getSolutionData"
            :items="getSolutionData"
            :fields="[
              { key: 'controllers', label: 'Controllers' },
              { key: 'shafts', label: 'Shafts' },
              { key: 'doors', label: 'Doors' },
              { key: 'buttons', label: 'Buttons' },
              { key: 'motors', label: 'Motors' },
            ]"
        ></b-table>
        </template>
    </b-card>
</template>

<script>
import { mapGetters } from "vuex";
export default {
  computed: {
    ...mapGetters("drizzle", ["isDrizzleInitialized", "drizzleInstance"]),
    ...mapGetters("contracts", ["getContractData", "contractInstances"]),
    getSolutionData() {
      !this.contractInstances["SolutionManufacturing"].synced;
      let SolutionData = [];
      SolutionData = this.getContractData({
        contract: "SolutionManufacturing",
        method: "viewOrder",
        toUtf8: false,
        toAscii: false,
      });
      let solutionReturn = {};
      let solutionArray = [];
      if (SolutionData === "loading") return;
      SolutionData.forEach((solution) => {
        switch (solution[0]) {
            case "Controller":
              solutionReturn.controllers = solution[1]
              break;
            case "Shafts":
              solutionReturn.shafts = solution[1]
              break;
            case "Doors":
              solutionReturn.doors = solution[1]
              break;
            case "Buttons":
              solutionReturn.buttons = solution[1]
              break;
            case "Motors":
              solutionReturn.motors = solution[1]
              break;
            default:
              console.log("error in switch case solution manufacturing")
              break;
        }
      });
      solutionArray.push(solutionReturn)
      return solutionArray;
    },
  },
  created() {
    this.$store.dispatch("drizzle/REGISTER_CONTRACT", {
      contractName: "SolutionManufacturing",
      method: "viewOrder",
      methodArgs: "",
    });
  },
  methods: {
    sendOrder() {
      this.drizzleInstance.contracts["SolutionManufacturing"].methods[
        "getOrder"
      ].cacheSend(this.drizzleInstance.contracts["MaterialProvider"].address);
    },
  },
};
</script>

