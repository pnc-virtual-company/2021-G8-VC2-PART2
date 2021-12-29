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
    </div>
    <v-flex class="d-flex">
      <v-flex class="d-flex">
        <v-card class="card-alumni mr-5">
          <v-icon class="mt-4">mdi-account</v-icon>
          <p>Alumni</p>
          <p class="numOfAlumni">200</p>
        </v-card>
        <v-card class="card-alumni">
          <v-icon class="mt-4">mdi-account-multiple-plus</v-icon>
          <p>Invited</p>
          <p class="numOfAlumni">100</p>
        </v-card>
      </v-flex>
    </v-flex>
    <v-card class="mt-7 mb-4 pa-4 rounded-lg">
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
    return {
    }
  },
};
</script>

<style scoped>
.v-icon,
.numOfAlumni {
  color: #00a3ff;
}

.card-alumni {
  text-align: center;
  width: 120px;
  height: 120px;
  border-radius: 10px;
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
  width: 23%;
}
</style>
