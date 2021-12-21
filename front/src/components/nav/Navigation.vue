<template>
  <nav>
    <v-navigation-drawer
      v-model="sidebar"
      app
      absolute
      left
      temporary
      hieght="10vh"
    >
      <v-list>
        <v-list-item-group
          v-model="group"
          active-class="deep-purple--text text--accent-4"
        >
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
          <hr>
          <v-list-item
            @click="$emit('signout')"
          >
            <v-list-item-action>
              <v-icon>mdi-subdirectory-arrow-right</v-icon>
            </v-list-item-action>
            <v-list-item-content>Log out</v-list-item-content>
          </v-list-item>
        </v-list-item-group>
      </v-list>
    </v-navigation-drawer>

    <v-toolbar height="50px" dense fixed>
      <span class="hidden-sm-and-up">
        <v-app-bar-nav-icon @click="sidebar = !sidebar"> </v-app-bar-nav-icon>
      </span>
      <v-toolbar-title>
        <router-link
          to="/myprofile"
          tag="span"
          style="cursor: pointer"
          class="blue--text"
        >
          {{ appTitle }}
        </router-link>
      </v-toolbar-title>
      <v-spacer></v-spacer>
      <v-toolbar-items class="hidden-xs-only">
        <v-btn
          active-class="grey-5 black--text"
          text
          v-for="item in menuItems"
          :key="item.title"
          :to="item.path"
        >
          <v-icon left class="blue--text">{{ item.icon }}</v-icon>
          {{ item.title }}
        </v-btn>
        <v-spacer></v-spacer>
        <v-btn @click="$emit('signout')" class="rounded-lg ml-3" small color="error">
          <v-icon left class="">mdi-subdirectory-arrow-right</v-icon>
          Log out
        </v-btn>
      </v-toolbar-items>
    </v-toolbar>
  </nav>
</template>

<script>
export default {
  data() {
    return {
      appTitle: "ERO-ALUMNI",
      sidebar: false,
      group: false,
      menuItems: [
        { title: "My Profile", path: "/myprofile", icon: "mdi-account" },
        { title: "Event", path: "", icon: "mdi-calendar-today" },
        { title: "Explore Alumi", path: "/eroview", icon: "mdi-account-search"},
        { title: "Manage User", path: "", icon: "mdi-account-multiple" },
      ],
    };
  },
};
</script>

<style>
</style>