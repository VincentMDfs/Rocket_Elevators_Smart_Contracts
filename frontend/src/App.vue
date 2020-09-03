<template>
  <div id="app">
    <b-navbar toggleable="lg" type="dark" variant="info">
      <b-navbar-brand href="#">Rocket Elevators Smart Contracts</b-navbar-brand>

      <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

      <b-collapse id="nav-collapse" is-nav>
        <!-- Right aligned nav items -->
        <b-navbar-nav class="ml-auto">
          <b-nav-text
            >Your account number: {{ activeAccount }} ({{ convertedBalance }}
            {{ units }} ETH)</b-nav-text
          >
        </b-navbar-nav>
      </b-collapse>
    </b-navbar>
    <b-container class="mt-2"><router-view /></b-container>
  </div>
</template>

<script>
import { mapGetters } from "vuex";

const capitalize = (ws) => ws[0].toUpperCase() + ws.slice(1).toLowerCase();
const precisionRound = (number, precision) => {
  const factor = Math.pow(10, precision);
  return Math.round(number * factor) / factor;
};

export default {
  computed: {
    ...mapGetters("accounts", ["activeAccount", "activeBalance"]),
    ...mapGetters("drizzle", ["isDrizzleInitialized", "drizzleInstance"]),

    convertedBalance() {
      const wei = this.activeBalance;
      const units = capitalize("Ether");
      return precisionRound(
        this.drizzleInstance.web3.utils.fromWei(wei, units),
        2
      );
    },
  },
};
</script>
