<template>
  <section>
    <div class="filter-container">
      <div class="filter">
        <v-select label="Company" dense solo></v-select>
      </div>
      <div class="filter">
        <v-select label="Position" dense solo></v-select>
      </div>
      <div class="filter">
        <v-select label="Batch" dense solo></v-select>
      </div>
      <div class="filter">
        <v-select label="Major" dense solo></v-select>
      </div>
      <div class="filter">
        <v-select label="Domain" dense solo></v-select>
      </div>
      <!-- <v-btn depressed color="white">
        <v-icon color="error">mdi-close</v-icon>
      </v-btn> -->
    </div>
    <v-flex class="d-flex">
      <v-flex class="d-flex">
        <v-card class="card-alumni mr-4">
          <v-icon class="mt-3">mdi-account-multiple</v-icon>
          <p>Alumni</p>
          <p class="numOfAlumni">200</p>
        </v-card>
        <v-card class="card-alumni">
          <v-icon class="mt-3">mdi-magnify</v-icon>
          <p>XXX</p>
          <p class="numOfAlumni">100</p>
        </v-card>
      </v-flex>
    </v-flex>
    <v-card class="mt-7 pa-4 rounded-lg">
      <ero-card></ero-card>
    </v-card>
  </section>
</template>

<script>
import EroCard from "./AlumniCard.vue";

export default {
  components: {
    EroCard,
  },
  data() {
    return {};
  },
  methods: {
    submit(emailToInvite, selectedRole) {
      this.dialog = false;
      let data = {
        email: emailToInvite,
        role: selectedRole,
      };
      this.$emit("invite", data);
    },
  },
};
</script>

<style>
.v-icon,
.numOfAlumni {
  color: #00a3ff;
}

.card-alumni {
  text-align: center;
  width: 110px;
  height: 110px;
}
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
