<template>
  <section>
    <div class="filter-container">
      <div class="filter">
        <v-select label="Company" dense solo :items="companyLists"></v-select>
      </div>
      <div class="filter">
        <v-select label="Position" dense solo :items="positions"></v-select>
      </div>
      <div class="filter">
        <v-select label="Batch" dense solo :items="batches"></v-select>
      </div>
      <div class="filter">
        <v-select label="Major" dense solo :items="majors"></v-select>
      </div>
      <div class="filter">
        <v-select label="Domain" dense solo :items="domains"></v-select>
      </div>
      <!-- <v-btn depressed color="white">
        <v-icon color="error">mdi-close</v-icon>
      </v-btn>-->
    </div>
    <v-card class="mt-2 pa-4 rounded-lg">
      <ero-card v-for="alumni of alumnis" :key="alumni.id" :alumni="alumni"></ero-card>
    </v-card>
  </section>
</template>

<script>
import EroCard from "./AlumniCard.vue";
import axios from "../../axios-http.js";
export default {
  components: {
    EroCard,
  },
  data: () => ({
    alumnis: null,
    companies: [],
    companyLists: [],
    positions: [],
    batches: [],
    majors: ["SNA","WEP"],
    domains: [],
  }),
  methods: {
    submit(emailToInvite, selectedRole) {
      this.dialog = false;
      let data = {
        email: emailToInvite,
        role: selectedRole,
      };
      this.$emit("invite", data);
    },
    /*get companies*/
    getCompanies() {
      axios.get("companies").then((res) => {
        this.companies = res.data;
        for (let company of this.companies) {
          this.companyLists.push(company.company_name);
        }
      });
    },
    /*get positions*/
    getPositions() {
      axios.get("workPositions").then((res) => {
        this.positions = res.data;
      });
    },
    /*get batches*/
    getBatches() {
      axios.get("batches").then((res) => {
        this.batches = res.data;
      });
    },
    /* get all of explore alumni */
    getExploreAlumniData() {
      axios.get("users/alumni").then((res) => {
        this.alumnis = res.data;
      });
    },
    /*get all domain companies*/
    getDomain() {
      axios.get("domain_companies").then((res) => {
        this.domains = res.data;
      });
    },
  },
  mounted() {
    this.getExploreAlumniData();
    this.getCompanies();
    this.getPositions();
    this.getBatches();
    this.getDomain();
  },
};
</script>

<style>
.v-sheet.v-card {
  border-radius: 5px;
}
.invite-btn {
  border-radius: 5px;
}

.v-select {
  border-radius: 5px;
}

.filter-container {
  display: flex;
  justify-content: space-between;
}

.filter {
  width: 18%;
}
.v-sheet.v-card:not(.v-sheet--outlined) {
  box-shadow: none;
}
</style>
