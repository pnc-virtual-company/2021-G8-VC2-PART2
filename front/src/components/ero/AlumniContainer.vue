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
      <v-dialog v-model="dialog" max-width="500px">
        <template v-slot:activator="{ on, attrs }">
          <v-btn depressed color="primary invite-btn" v-bind="attrs" v-on="on"> Invite </v-btn>
        </template>
        <v-card>
          <v-card-title>
            <span class="text-h5">Invite People</span>
          </v-card-title>
          <v-card-text>
              <v-row class="pa-0">
                <v-col cols="12 mt-0">
                  <v-select :items="roles" label="Select role" solo></v-select>
                  <v-text-field
                    prepend-inner-icon="mdi-email"
                    label="Email"
                    required
                  ></v-text-field>
                </v-col>
              </v-row>
          </v-card-text>
          <v-divider></v-divider>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="blue darken-1" text @click="dialog = false">
              Close
            </v-btn>
            <v-btn color="blue darken-1" text @click="dialog = false">
              Submit
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
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
      dialog: false,
      roles: ['ERO', 'Alumni'],
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
