<template>
  <v-app>
    <!-- Navigation -->
    <!-- <v-navigation-drawer app v-model="showNavigation" absolute bottom temporary>
      <app-nav></app-nav>
    </v-navigation-drawer>
    <v-app-bar app>
      <v-app-bar-nav-icon
        @click.prevent="showNavigation = !showNavigation"
      ></v-app-bar-nav-icon>
      <v-img
      max-height="50"
      max-width="250"
      src=""
    ></v-img>
      <v-spacer></v-spacer>
      <v-avatar
      size="36"
    >
      <img src="https://i.pinimg.com/originals/a6/58/32/a65832155622ac173337874f02b218fb.png" alt="">
    </v-avatar> -->
      <!-- -->
    <!-- </v-app-bar> -->
    <v-main>
      <v-container fluid>
        <router-view></router-view>
      </v-container>
    </v-main>
    <v-footer app> </v-footer>
  </v-app>
</template>
<script>
// import Navigation from "./components/nav/Navigation.vue";

export default {
  // components: {
  //   "app-nav": Navigation,
  // },
  data() {
    return {
      showNavigation: false,
    };
  },
};
</script>
<style>
* {
  font-family: 'San Francisco', Helvetica, Arial, san-serif;
}
</style>