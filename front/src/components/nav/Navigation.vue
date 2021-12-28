<template>
  <v-app-bar app white elevation="0" color="white">
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
          active-class="blue--text"
        >
          <v-list-item
            active-class="blue--text"
            v-for="item in menuItems"
            :key="item.title"
            :to="item.path"
          >
            <v-list-item-action>
              <v-icon>{{ item.icon }}</v-icon>
            </v-list-item-action>
            <v-list-item-content>{{ item.title }}</v-list-item-content>
          </v-list-item>
          <hr />
          <v-list-item @click="$emit('signout')">
            <v-list-item-action>
              <v-icon>mdi-subdirectory-arrow-right</v-icon>
            </v-list-item-action>
            <v-list-item-content>Log out</v-list-item-content>
          </v-list-item>
        </v-list-item-group>
      </v-list>
    </v-navigation-drawer>
      <span class="hidden-sm-and-up">
        <v-app-bar-nav-icon @click="sidebar = !sidebar"> </v-app-bar-nav-icon>
      </span>
      <v-toolbar-title>
        <v-img
          max-width="150"
          src="../../assets/PN_LogoAlumni.png"
        ></v-img>
      </v-toolbar-title>
      <v-spacer></v-spacer>
      <v-tabs class="d-flex justify-end">
        <v-tabs-slider color="blue"></v-tabs-slider>
        <v-tab
          active-class="blue--text"
          v-for="item in menuItems"
          :key="item.title"
          :to="item.path"
          text
          class=""
        >
          <v-icon left>{{ item.icon }}</v-icon>
          {{ item.title }}
        </v-tab>
        <v-spacer></v-spacer>
         <div class="my-2 ml-2 logout ma-2" @click="$emit('signout')">
            <v-btn
              color="warning"
              dark
              elevation="0"
            >
              Logout
            </v-btn>
          </div>
      </v-tabs>
  </v-app-bar>
</template>

<script>
export default {
  props: ["role"],
  data() {
    return {
      appTitle: "ERO-ALUMNI",
      sidebar: false,
      group: false,
      menuItems: [],
      allMenuItems: [
        {
          title: "My Profile",
          path: "/myprofile",
          icon: "mdi-account",
          whoCanSee: ["alumni"],
        },
        {
          title: "Explore Alumi",
          path: "/eroview",
          icon: "mdi-account-search",
          whoCanSee: ["ero", "admin"],
        },
        {
          title: "Manage User",
          path: "/manageuser",
          icon: "mdi-account-multiple",
          whoCanSee: ["admin"],
        },
        {
          title: "Event",
          path: "/eventview",
          icon: "mdi-calendar-today",
          whoCanSee: ["alumni", "ero", "admin"],
        },
      ],
    };
  },
  methods: {
    isAllowedToSee(rights) {
      return rights.includes(this.role);
    },
  },
  mounted() {
    for (let menu of this.allMenuItems) {
      if (this.isAllowedToSee(menu.whoCanSee)) {
        this.menuItems.push(menu);
      }
    }
  },
};
</script>

<style scoped>
.logout {
  display: flex;
  justify-content: center;
  align-items: center;
}
</style>
