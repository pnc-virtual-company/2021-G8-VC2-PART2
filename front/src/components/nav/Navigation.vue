<template>
  <v-app-bar app white elevation="1" color="white">
    <!-- alert when logout -->
    <v-dialog
      persistent
      v-model="dialog"
      :max-width="options.width"
      :style="{ zIndex: options.zIndex }"
    >
      <v-card>
        <v-card-title class="justify-center text-h6"
          >Ready to leave?</v-card-title
        >
        <v-divider></v-divider>

        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="white--text" small text @click="dialog = false">
            No
          </v-btn>
          <v-btn color="red white--text" small text @click="$emit('signout')"> Yes </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
    <!-- alert when logout -->
    <v-navigation-drawer
      v-model="sidebar"
      app
      absolute
      left
      temporary
      hieght="10vh"
    >
      <v-list>
        <v-list-item-group v-model="group" active-class="blue--text">
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
      <v-img max-width="150" src="../../assets/PN_LogoAlumni.png"></v-img>
    </v-toolbar-title>
    <v-spacer></v-spacer>
    <!-- <v-tabs class="d-flex justify-end">
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
      <div class="my-2 ml-2 logout ma-2" @click="dialog = true">
        <v-btn elevation="0"> Logout </v-btn>
      </div>
    </v-tabs> -->
    <!-- <v-list flat>
      <v-list-item-group>
        <v-list-item>
          <v-list-item-content>
            <v-icon>mdi-account</v-icon>
            <v-list-item-subtitle>
              My profile
            </v-list-item-subtitle>
          </v-list-item-content>
        </v-list-item>
      </v-list-item-group>
    </v-list> -->
      <v-toolbar-items class="hidden-xs-only">
        <v-btn
          text
          active-class="blue--text" 
          v-for="item in menuItems"
          :key="item.title"
          :to="item.path">
          <v-list-item-content class="text-center">
            <v-icon size="30">{{item.icon}}</v-icon>
            <v-list-item-subtitle active-class="blue--text"  size="15px">
              {{item.title}}
            </v-list-item-subtitle>
          </v-list-item-content>
        </v-btn>
        <v-spacer></v-spacer>
        <div class="my-2 ml-2 logout" @click="dialog = true">
          <v-btn elevation="0"> Logout </v-btn>
        </div>
      </v-toolbar-items> 
  </v-app-bar>
</template>

<script>
export default {
  props: ["role"],
  data() {
    return {
      appTitle: "ERO-ALUMNI",
      dialog: false,
      sidebar: false,
      group: false,
      options: {
        color: "grey lighten-3",
        width: 400,
        zIndex: 900,
        noconfirm: false,
      },
      menuItems: [],
      allMenuItems: [
        {
          title: "Profile",
          path: "/myprofile",
          icon: "mdi-account",
          whoCanSee: ["alumni"],
        },
        {
          title: "Explore",
          path: "/eroview",
          icon: "mdi-account-search",
          whoCanSee: ["ero", "admin"],
        },
        {
          title: "Manage",
          path: "/manageuser",
          icon: "mdi-account-multiple",
          whoCanSee: ["ero", "admin"],
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
.v-dialog {
  border-radius: 10px;
}
.signOutBtn{
  color: #E0E8EF;
}
</style>
