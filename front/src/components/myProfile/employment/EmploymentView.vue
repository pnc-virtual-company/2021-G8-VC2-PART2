<template>
  <v-card class="mt-5 mb-4 pa-4 rounded-lg">
    <v-row class="mb-1">
      <v-col cols="8" sm="3" md="5">
        <h3>Employment</h3>
      </v-col>
      <v-col class="add-info">
        <v-btn color="white" fab x-small dark elevation="1">
          <v-icon color="black">mdi-plus</v-icon>
        </v-btn>
      </v-col>
    </v-row>
    <employment-card></employment-card>
  </v-card>
</template>
<script>
import EmploymentCard from "./EmploymentCard.vue";

export default {
  components: {
    "employment-card": EmploymentCard,
  },
};
</script>

<style scoped>
.add-info {
  display: flex;
  justify-content: flex-end;
}
</style>