<template>
  <section>
    <div class="filter-container">
      <div class="filter">
        <v-select label="Company" dense solo :items="companies"></v-select>
      </div>
      <div class="filter">
        <v-select label="Position" dense solo :items="positions"></v-select>
      </div>
      <div class="filter">
        <v-select label="Batch" dense solo :items="batches"></v-select>
      </div>
      <div class="filter">
        <v-select label="Major" dense solo :items="majos"></v-select>
      </div>
      <div class="filter">
        <v-select label="Domain" dense solo :items="domains"></v-select>
      </div>
      <!-- <v-btn depressed color="white">
        <v-icon color="error">mdi-close</v-icon>
      </v-btn>-->
    </div>
    <v-card class="mt-2 pa-4 rounded-lg">
      <ero-card
        v-for="alumni of alumnis"
        :key="alumni.id"
        :alumni="alumni"
      ></ero-card>
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
    companies: ["ABA", "WING", "AMK", "AIML", "Canadia", "Slash", "Manulife"],
    positions:["Web Developer","Mobile Developer","IT Support","IT Security"],
    batches:["2013","2014","2015","2016","2017","2018","2019","2020","2021","2022"],
    majos:["SNA","WEB"],
    domains: ["Bank", "Solution", "Online", "Delivery"],
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
    getExploreAlumniData() {
      axios.get('users/alumni').then(res=>{
      this.alumnis = res.data;
    })
    }
  },
  mounted() {
    this.getExploreAlumniData();
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
