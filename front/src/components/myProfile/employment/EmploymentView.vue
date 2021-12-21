<template>
  <v-card class="mt-5 mb-4 pa-4 rounded-lg">
    <v-row class="mb-1">
      <v-col cols="8" sm="3" md="5">
        <h3>Employment</h3>
      </v-col>
      <v-col class="add-info">
        <div class="circle mr-3">
          <v-icon size="20px">mdi-plus</v-icon>
        </div>
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
.add-info{
  display: flex;
  justify-content: flex-end;
}
.circle{
  background-color: #ffff;
  border-radius: 50%;
  padding: 10px;
  width: 25px;
  height: 25px;
  font-size: 18px;
  display: flex;
  justify-content: center;
  align-items: center;
  box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;
}
</style>