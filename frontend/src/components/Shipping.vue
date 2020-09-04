<template>
  <b-card v-if="isDrizzleInitialized" header="">
    <b-card-text>
      <b-button @click.prevent="sendReceivedOrder" variant="success"
        >Receive Order</b-button
      >
    </b-card-text>
    <template v-slot:footer>
      <b-table
        striped
        hover
        v-if="getShippingStamp"
        :items="getShippingStamp"
        :fields="[
          { key: 'materialName', label: 'Material' },
          { key: 'quantity', label: 'Quantity' },
          { key: 'packaged', label: 'Packaged' },
          { key: 'shipped', label: 'Shipped' },
          { key: 'received', label: 'Received' },
          //todo
        ]"
      ></b-table>
      <b-button style="margin: 0 10px;"  @click.prevent="sendPackaged" variant="success"
        >Pack the order</b-button
      >
      <b-button style="margin: 0 10px;"  @click.prevent="sendShipped" variant="success"
        >Ship the order</b-button
      ><b-button style="margin: 0 10px;"  @click.prevent="sendReceived" variant="success"
        >Order delivered</b-button
      >
    </template>
  </b-card>
</template>

<script>
import { mapGetters } from "vuex";
export default {
  computed: {
    ...mapGetters("drizzle", ["isDrizzleInitialized", "drizzleInstance"]),
    ...mapGetters("contracts", ["getContractData", "contractInstances"]),
    getShippingStamp() {
      !this.contractInstances["Shipping"].synced;
      let VerificationData = [];
      VerificationData = this.getContractData({
        contract: "Shipping",
        method: "E_viewEverything",
        toUtf8: false,
        toAscii: false,
      });
      let verificationArray = [];

      if (VerificationData === "loading") return;
      VerificationData.forEach((verification) => {

        verificationArray.push({
          materialName: verification[0],
          quantity: verification[1],
          packaged: verification[2],
          shipped: verification[3],
          received: verification[4]
          //todo
          
        });
      });
      return verificationArray;
    },
  },
  created() {
    this.$store.dispatch("drizzle/REGISTER_CONTRACT", {
      contractName: "Shipping",
      method: "E_viewEverything",
      methodArgs: "",
    });
  },
  methods: {
    sendReceivedOrder() {
      this.drizzleInstance.contracts["Shipping"].methods[
        "A_receiveOrder"
      ].cacheSend(this.drizzleInstance.contracts["QualityControl"].address);
    },
    sendPackaged() {
      this.drizzleInstance.contracts["Shipping"].methods[
        "B_EverythingPacked"
      ].cacheSend();
    },
    sendShipped() {
      this.drizzleInstance.contracts["Shipping"].methods[
        "C_EverythingShipped"
      ].cacheSend();
    },
    sendReceived() {
      this.drizzleInstance.contracts["Shipping"].methods[
        "D_EverythingReceived"
      ].cacheSend();
    }
  },
};
</script>
