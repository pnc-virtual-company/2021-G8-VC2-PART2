<template>
  <nav>
    <v-navigation-drawer app v-model="showNavigation" absolute top temporary>
      <v-list nav dense>
        <v-list-item-group
          v-model="group"
          active-class="deep-purple--text text--accent-4"
        >
        <v-list-item
          v-for="item in menuItems"
          :key="item.title"
          :to="item.path">
          <v-list-item-action>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-item-action>
          <v-list-item-content>{{ item.title }}</v-list-item-content>
        </v-list-item>
          </v-list-item-group>
      </v-list>
    </v-navigation-drawer>
    <v-app-bar app height="45px">
      <v-app-bar-nav-icon
        @click.prevent="showNavigation = !showNavigation" 
      ></v-app-bar-nav-icon>
      <v-img max-height="50" max-width="250" src=""></v-img>
      <v-spacer></v-spacer>
        <v-btn
            active-class="grey-5 white--text" 
            text
            v-for="item in menuItems"
            :key="item.title"
            :to="item.path">
            <v-icon left class="orange--text">{{ item.icon }}</v-icon>
            {{ item.title }}
        </v-btn>
      <!-- <v-avatar size="36">
        <img
          src="https://i.pinimg.com/originals/a6/58/32/a65832155622ac173337874f02b218fb.png"
          alt=""
        />
      </v-avatar> -->
    </v-app-bar>
  </nav>
</template>

<script>
export default {
  data() {
    return {
    showNavigation: false,
      appTitle: 'PNC Cambodia',
      sidebar: false,
      group: false,
      menuItems: [
          { title: 'My profile', path: '/myprofile', icon: 'mdi-home' },
          { title: 'About', path: '/about', icon: 'mdi-heart' },
          { title: 'Contact', path: '/contact', icon: 'mdi-phone' },
          { title: 'Sign In', path: '/signin', icon: 'mdi-login' },
     ]
    }
  }
}
</script>
