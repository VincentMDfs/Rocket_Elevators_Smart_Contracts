<template>
  <b-card v-if="isDrizzleInitialized" header="Input your project data">
    <b-card-text>
      <b-form>
        <b-form-group label="Batteries:">
          <b-form-input
            type="number"
            v-model="projectForm.batteries"
          ></b-form-input>
        </b-form-group>
        <b-form-group label="Columns:">
          <b-form-input
            type="number"
            v-model="projectForm.columns"
          ></b-form-input>
        </b-form-group>
        <b-form-group label="Elevators:">
          <b-form-input
            type="number"
            v-model="projectForm.elevators"
          ></b-form-input>
        </b-form-group>
        <b-form-group label="Floors:">
          <b-form-input
            type="number"
            v-model="projectForm.floors"
          ></b-form-input>
        </b-form-group>

        <b-button @click.prevent="sendProjectData" variant="primary"
          >Submit</b-button
        >
      </b-form>
    </b-card-text>
    <template v-slot:footer>
      <b-table
        striped
        hover
        v-if="getProjectData"
        :items="getProjectData"
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
  data() {
    return {
      projectForm: {
        batteries: "",
        columns: "",
        elevators: "",
        floors: "",
      },
    };
  },
  created() {
    this.$store.dispatch("drizzle/REGISTER_CONTRACT", {
      contractName: "ProjectOffice",
      method: "getComponents",
      methodArgs: "",
    });
  },
  computed: {
    ...mapGetters("drizzle", ["isDrizzleInitialized", "drizzleInstance"]),
    ...mapGetters("contracts", ["getContractData", "contractInstances"]),

    getProjectData() {
      !this.contractInstances["ProjectOffice"].synced;
      let ProjectData = [];
      ProjectData = this.getContractData({
        contract: "ProjectOffice",
        method: "getComponents",
        toUtf8: false,
        toAscii: false,
      });
      let projectArray = [];
      if (ProjectData === "loading") return false;
      ProjectData.forEach((project) => {
        projectArray.push({
          controllers: project[0],
          shafts: project[1],
          doors: project[2],
          buttons: project[3],
          motors: project[4],
        });
      });
      return projectArray;
    },
  },
  methods: {
    sendProjectData() {
      this.drizzleInstance.contracts["ProjectOffice"].methods[
        "addComponents"
      ].cacheSend(
        this.projectForm.batteries,
        this.projectForm.columns,
        this.projectForm.elevators,
        this.projectForm.floors
      );
      this.projectForm.batteries = "";
      this.projectForm.columns = "";
      this.projectForm.elevators = "";
      this.projectForm.floors = "";
    },
  },
};
</script>
