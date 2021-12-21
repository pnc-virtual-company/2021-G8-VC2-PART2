<template>
  <nav>
    <v-navigation-drawer v-model="sidebar" app absolute left temporary>
      <v-list flat>
        <v-list-item-group v-model="group">
          <v-list-item
            v-for="item in menuItems"
            :key="item.title"
            :to="item.path"
          >
            <v-list-item-action>
              <v-icon>{{ item.icon }}</v-icon>
            </v-list-item-action>
            <v-list-item-content>{{ item.title }}</v-list-item-content>
          </v-list-item>
          <v-divider></v-divider>
          <v-list-item>
            <v-list-item-action>
              <v-icon>mdi-login</v-icon>
            </v-list-item-action>
            <v-list-item-content>Logout</v-list-item-content>
          </v-list-item>
        </v-list-item-group>
      </v-list>
    </v-navigation-drawer>

    <v-toolbar dense>
      <span class="hidden-sm-and-up">
        <v-app-bar-nav-icon @click="sidebar = !sidebar"> </v-app-bar-nav-icon>
      </span>

      <v-spacer></v-spacer>
      <v-toolbar-items class="hidden-xs-only">
        <v-btn
          active-class="grey-5 white--text"
          text
          v-for="item in menuItems"
          :key="item.title"
          :to="item.path"
        >
          <v-icon left>{{ item.icon }}</v-icon>
          {{ item.title }}
        </v-btn>
        <div class="my-2" @click="$emit('signout')">
          <v-btn small color="red" dark> Logout </v-btn>
        </div>
      </v-toolbar-items>
    </v-toolbar>
  </nav>
</template>

<script>
export default {
  data() {
    return {
      sidebar: false,
      group: false,
      menuItems: [
        { title: "My Profile", path: "/myprofile", icon: "mdi-account" },
        { title: "Event", path: "/", icon: "mdi-calendar-today" },
        { title: "Explore Alumi", path: "/eroview", icon: "mdi-account-search" },
        { title: "Manage User", path: "/", icon: "mdi-account-multiple" },
      ],
    };
  },
};
</script>

<style>
</style>