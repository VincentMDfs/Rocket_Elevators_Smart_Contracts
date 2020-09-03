<template>
  <div v-if="isDrizzleInitialized">
    <project-data  />
    <material-data class="mt-5" />
    <solution-data class="mt-5"  />
    <quality-data class="mt-5"  />
    <shipping-data class="mt-5"  />
    <installation-data class="mt-5 "/>




  </div>
</template>

<script>
import { mapGetters } from "vuex";

import ProjectData from "../components/ProjectData.vue";
import MaterialData from "../components/MaterialProvider.vue";
import SolutionData from "../components/SolutionManufacturing.vue";
import QualityData from "../components/QualityControl.vue";
import ShippingData from "../components/Shipping.vue";
import InstallationData from "../components/Installation.vue";





export default {
  name: "Home",
  components: { ProjectData, MaterialData, SolutionData, QualityData, ShippingData, InstallationData },
  computed: {
    ...mapGetters("drizzle", ["isDrizzleInitialized", "drizzleInstance"]),
  },
};
</script>
