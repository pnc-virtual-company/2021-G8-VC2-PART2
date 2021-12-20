<template>
  <nav>
    <v-navigation-drawer app v-model="showNavigation" absolute left temporary>
      <v-list nav dense>
        <v-list-item :to="{ path: '/myprofile' }">
          <v-list-item-icon>
            <v-icon>mdi-account</v-icon>
          </v-list-item-icon>
          <v-list-item-title>My Profile</v-list-item-title>
        </v-list-item>
        <v-list-item>
          <v-list-item-icon>
            <v-icon>mdi-calendar-today</v-icon>
          </v-list-item-icon>
          <v-list-item-title>Events</v-list-item-title>
        </v-list-item>
        <v-list-item>
          <v-list-item-icon>
            <v-icon>mdi-account-search</v-icon>
          </v-list-item-icon>
          <v-list-item-title>Explore Alumni</v-list-item-title>
        </v-list-item>
        <v-list-item>
          <v-list-item-icon>
            <v-icon>mdi-account-multiple</v-icon>
          </v-list-item-icon>
          <v-list-item-title>Manage Users</v-list-item-title>
        </v-list-item>
        <v-divider></v-divider>
        <v-list-item :to="{ path: '/signin' }" @click="$emit('signout')">
          <v-list-item-icon>
            <v-icon>mdi-export</v-icon>
          </v-list-item-icon>
          <v-list-item-title>Log out</v-list-item-title>
        </v-list-item>
      </v-list>
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
  </nav>
</template>

<script>
export default {
  data() {
    return {
      showNavigation: false,
    };
  },
};
</script>
