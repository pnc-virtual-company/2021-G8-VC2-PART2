<template>
  <v-app>
    <v-navigation-drawer
      app
      v-model="showNavigation"
      absolute
      bottom
      temporary
      width="23%"
    >
      <menu-item></menu-item>
    </v-navigation-drawer>
    <v-app-bar app height="45px">
      <v-app-bar-nav-icon
        @click.prevent="showNavigation = !showNavigation"
      ></v-app-bar-nav-icon>
      <v-img max-height="50" max-width="250" src=""></v-img>
      <v-spacer></v-spacer>
      <v-avatar size="36">
        <img
          src="https://i.pinimg.com/originals/a6/58/32/a65832155622ac173337874f02b218fb.png"
          alt=""
        />
      </v-avatar>
    </v-app-bar>
    <v-main>
      <v-container fluid ma-0 pa-0 fill-height>
        <router-view></router-view>
      </v-container>
    </v-main>
    <v-footer app> </v-footer>
  </v-app>
</template>

<script>
import Menu from "./components/nav/Menu.vue";
export default {
  components: {
    "menu-item": Menu,
  },
  data() {
    return {
      showNavigation: false,
    };
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
