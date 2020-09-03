<template>
  <b-card v-if="isDrizzleInitialized" header="Put the stamp for the verification">
    <b-card-text>
      <b-button @click.prevent="sendQualityControl" variant="success"
        >Verification stamp</b-button
      >
    </b-card-text>
    <template v-slot:footer>
      <b-table
        striped
        hover
        v-if="getVerificationStamp"
        :items="getVerificationStamp"
        :fields="[
          { key: 'materialName', label: 'Material' },
          { key: 'quantity', label: 'Quantity' },
          { key: 'verified', label: 'Verified' },
          //todo
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
    getVerificationStamp() {
      !this.contractInstances["QualityControl"].synced;
      let VerificationData = [];
      VerificationData = this.getContractData({
        contract: "QualityControl",
        method: "getVerification",
        toUtf8: false,
        toAscii: false,
      });
      let verificationArray = [];
      if (VerificationData === "loading") return;
      VerificationData[2].forEach((verification) => {

        verificationArray.push({
          materialName: verification[0],
          quantity: verification[1],
          verified: verification[2],
          
        });
      });
      return verificationArray;
    },
  },
  created() {
    this.$store.dispatch("drizzle/REGISTER_CONTRACT", {
      contractName: "QualityControl",
      method: "getVerification",
      methodArgs: "",
    });
  },
  methods: {
    sendQualityControl() {
      this.drizzleInstance.contracts["QualityControl"].methods[
        "VerificationStamp"
      ].cacheSend(this.drizzleInstance.contracts["SolutionManufacturing"].address);
    },
  },
};
</script>
