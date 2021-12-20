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
    <v-app-bar app v-if="isLogin">
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
      <router-view
        :status="signInData.status"
        @submitFirstStep="submitStep1"
        @submitSecondStep="submitStep2"
      ></router-view>
    </v-main>
  </v-app>
</template>

<script>
import axios from "./axios-http.js";
import Menu from "./components/nav/Menu.vue";
export default {
  components: {
    "menu-item": Menu,
  },
  data() {
    return {
      showNavigation: false,
      user: null,
      signInData: {
        email: null,
        password: null,
        firstname: null,
        lastname: null,
        status: null
      }
    };
  },
  computed: {
    isLogin: function() { 
      return this.user !== null
    }
  },
  methods: {
    submitStep1(email) {
      this.signInData.email = email;
      axios.post('signIn/step1', {'email': email})
      .then(res => {
        this.signInData.status = res.data.status;
        console.log(this.signInData)
      })
    },
    submitStep2(data) {
      if(this.signInData.status === 'invited') {
        this.signInData.firstname = data.firstname;
        this.signInData.lastname = data.lastname;
        this.signInData.password = data.password;
      } else {
        this.signInData.password = data.password;
      }
      console.log(this.signInData);
      axios.post('signIn/step2', this.signInData)
      .then(res => {
        this.user = res.data.user;
        localStorage.setItem('user', JSON.stringify(res.data.user));
        this.$router.push('/myprofile');
      })
    }
  },
  mounted() {
    if (JSON.parse(localStorage.getItem("user"))) {
      this.user = JSON.parse(localStorage.getItem("user"));
      console.log(this.user);
    }
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
