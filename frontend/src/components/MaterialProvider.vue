<template>
  <b-card v-if="isDrizzleInitialized" header="Request material to provider">
    <b-card-text>
      <b-button @click.prevent="sendMaterialCalculation" variant="success"
        >Send material to the calculation</b-button
      >
    </b-card-text>
    <template v-slot:footer>
      <b-table
        striped
        hover
        v-if="getMaterialData"
        :items="getMaterialData"
        :fields="[
          { key: 'materialName', label: 'Material' },
          { key: 'quantity', label: 'Quantity' },
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
    getMaterialData() {
      !this.contractInstances["MaterialProvider"].synced;
      let MaterialData = [];
      MaterialData = this.getContractData({
        contract: "MaterialProvider",
        method: "getMaterials",
        toUtf8: false,
        toAscii: false,
      });
      let materialArray = [];
      if (MaterialData === "loading") return;
      MaterialData.forEach((material) => {
        materialArray.push({
          materialName: material[0],
          quantity: material[1],
        });
      });
      return materialArray;
    },
  },
  created() {
    this.$store.dispatch("drizzle/REGISTER_CONTRACT", {
      contractName: "MaterialProvider",
      method: "getMaterials",
      methodArgs: "",
    });
  },
  methods: {
    sendMaterialCalculation() {
      this.drizzleInstance.contracts["MaterialProvider"].methods[
        "calculateMaterial"
      ].cacheSend(this.drizzleInstance.contracts["ProjectOffice"].address);
    },
  },
};
</script>
