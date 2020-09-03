<template>
  <div v-if="isDrizzleInitialized">
    <project-data />
    <material-data class="mt-2" />
  </div>
</template>

<script>
import { mapGetters } from "vuex";

import ProjectData from "../components/ProjectData.vue";
import MaterialData from "../components/MaterialProvider.vue";

export default {
  name: "Home",
  components: { ProjectData, MaterialData },
  computed: {
    ...mapGetters("drizzle", ["isDrizzleInitialized", "drizzleInstance"]),
  },
};
</script>
