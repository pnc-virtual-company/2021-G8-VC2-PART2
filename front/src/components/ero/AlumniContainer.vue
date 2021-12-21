<template>
  <section>
    <v-flex class="d-flex">
      <v-flex class="d-flex">
        <v-card class="card-alumni mr-8">
          <v-icon class="mt-4">mdi-account</v-icon>
          <p>Alumni</p>
          <p class="numOfAlumni">200</p>
        </v-card>
        <v-card class="card-alumni">
          <v-icon class="mt-4">mdi-home</v-icon>
          <p>Companies</p>
          <p class="numOfAlumni">100</p>
        </v-card>
      </v-flex>
    <v-btn depressed color="primary invite-btn"> Invite </v-btn>
    </v-flex>
    <v-card class="mt-7 mb-4 pa-4 rounded-lg">
      <ero-card></ero-card>
    </v-card>
  </section>
</template>

<script>
import EroCard from "./AlumniCard.vue";

export default {
  components: { EroCard },
};
</script>

<style scoped>
.add-info {
  display: flex;
  justify-content: flex-end;
}
.circle {
  background-color: #ffff;
  border-radius: 50%;
  padding: 10px;
  width: 25px;
  height: 25px;
  font-size: 18px;
  display: flex;
  justify-content: center;
  align-items: center;
  box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px,
    rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;
}
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
  border-radius: 10px;
}
</style>
