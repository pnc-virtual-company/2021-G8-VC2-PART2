<template>
  <v-card class="mx-auto my-12 pa-4">
    <h4>Employment</h4>
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

</style>