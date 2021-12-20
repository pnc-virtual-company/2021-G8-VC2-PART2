<template>
  <v-app>
    <navigation-bar></navigation-bar>
    <v-main>
      <router-view></router-view>
    </v-main>
    <!-- <v-footer app> </v-footer> -->
  </v-app>
</template>

<script>
import Nav from "./components/nav/Navigation.vue";
export default {
  components: {
    "navigation-bar": Nav,
  },
};
</script>

<style>
* {
  font-family: "San Francisco", Helvetica, Arial, san-serif;
  color: #4d4d4d;
}
.container {
  width: 50%;
  margin: auto;
  background: #f3f2ef;
}
</style>
