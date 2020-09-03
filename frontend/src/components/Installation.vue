<template>
  <b-card v-if="isDrizzleInitialized" header="Install the finished product with the type">
    <b-card-text>

      <b-form>
        <b-form-group label="Type:">
          <b-form-select
            v-model="installForm.type"
            :options="selectType"
            required
          ></b-form-select>
        </b-form-group>
      </b-form>
        <b-button style="margin: 0 10px;" @click.prevent="sendInstall" variant="success"
        >Install</b-button>
      <b-button style="margin: 0 10px;" @click.prevent="sendActivate" variant="success"
        >Activate</b-button
      >
    </b-card-text>
    <template v-slot:footer>
      <b-table
        striped
        hover
        v-if="getInstallation"
        :items="getInstallation"
        :fields="[
          { key: 'name', label: 'Name' },
          { key: 'quantity', label: 'Quantity' },
          { key: 'installed', label: 'Installed' },
          { key: 'installationType', label: 'Installation Type' },
          { key: 'active', label: 'Active' },
          { key: 'address', label: 'Address of the tech' },
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
    getInstallation() {
      !this.contractInstances["Installation"].synced;
      let VerificationData = [];
      VerificationData = this.getContractData({
        contract: "Installation",
        method: "C_ViewEverything",
        toUtf8: false,
        toAscii: false,
      });
      let verificationArray = [];

      if (VerificationData === "loading") return;
      VerificationData.forEach((verification) => {
        console.log(verification)
        verificationArray.push({
          address: verification[0],
          installed: verification[1],
          installationType: verification[2],
          active: verification[3],
          name: verification[4],
          quantity: verification[5],
        });
      });
      return verificationArray;
    },
  },
  data() {
    return {
      installForm: {
        type: null,
      },
      selectType: [{ text: 'Select One', value: null }, 'Standard', 'Premium', 'Excelium'],
      
    };
  },
  created() {
    this.$store.dispatch("drizzle/REGISTER_CONTRACT", {
      contractName: "Installation",
      method: "C_ViewEverything",
      methodArgs: "",
    });
  },
  methods: {
    sendInstall() {
      if(this.installForm.type === null) {
        return
      }
      this.drizzleInstance.contracts["Installation"].methods[
        "A_Install"
      ].cacheSend(this.drizzleInstance.contracts["Shipping"].address, this.installForm.type);
      this.installForm.type = "";
    },
    sendActivate() {
      this.drizzleInstance.contracts["Installation"].methods[
        "B_Activate"
      ].cacheSend();
    },
    
  },
};
</script>
