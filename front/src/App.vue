<template>
  <v-app>
    <navigation-bar
      v-if="isLogin"
      @signout="signOut"
      :role="user.role"
    ></navigation-bar>
    <v-main>
      <router-view
        :status="signInData.status"
        :invalidEmail="error.invalidEmail"
        :invalidEmailOrPassword="error.invalidEmailOrPassword"
        @submitFirstStep="submitStep1"
        @submitSecondStep="submitStep2"
        @clearSignInData="clearSignInData"
      ></router-view>
    </v-main>
  </v-app>
</template>

<script>
import axios from "./axios-http.js";
import Nav from "./components/nav/Navigation.vue";
export default {
  components: {
    "navigation-bar": Nav,
  },
  data() {
    return {
      showNavigation: false,
      user: null,
      error: {
        invalidEmail: null,
        invalidEmailOrPassword: null,
      },
      signInData: {
        email: null,
        password: null,
        firstname: null,
        lastname: null,
        status: null,
      },
    };
  },
  computed: {
    isLogin: function () {
      return this.user !== null;
    },
  },
  methods: {
    signOut() {
      localStorage.removeItem("user");
      this.user = null;
      this.$router.push("/signin");
    },
    submitStep1(email) {
      let route = "signin/";
      this.signInData.email = email;
      axios
        .get(route + email)
        .then((res) => {
          this.signInData.status = res.data.status;
          this.error.invalidEmail = null;
        })
        .catch((err) => {
          if (err.response.status === 401) {
            this.error.invalidEmail = "Invalid email address";
          }
        });
    },
    submitStep2(data) {
      let route = "signin/password";
      if (this.signInData.status === "invited") {
        this.signInData.firstname = data.firstname;
        this.signInData.lastname = data.lastname;
        this.signInData.password = data.password;
        route = "signin/completeinfo";
      } else {
        this.signInData.password = data.password;
      }
      axios
        .post(route, this.signInData)
        .then((res) => {
          this.user = res.data.user;
          localStorage.setItem("user", JSON.stringify(res.data.user));
          this.error.invalidEmailOrPassword = null;
          if (this.user.role === "admin" || this.user.role === "ero") {
            this.$router.push("/eroview");
          } else {
            this.$router.push("/myprofile");
          }
        })
        .catch((err) => {
          if (err.response.status === 401) {
            this.error.invalidEmailOrPassword = "Invalid email or password";
          }
        });
    },
    clearSignInData() {
      this.signInData = {
        email: null,
        password: null,
        firstname: null,
        lastname: null,
        status: null,
      };
      this.error.invalidEmailOrPassword = null;
    },
  },
  mounted() {
    if (JSON.parse(localStorage.getItem("user"))) {
      this.user = JSON.parse(localStorage.getItem("user"));
      if (this.user.role === "admin" || this.user.role === "ero") {
        this.$router.push("/eroview");
      } else {
        this.$router.push("/myprofile");
      }
    }
  },
};
</script>

<style>
@import url("http://fonts.cdnfonts.com/css/sf-ui-display");
* {
  font-family: "SF UI Display 100", sans-serif;
  color: #4d4d4d;
}
.container {
  width: 50%;
  margin: auto;
}

.v-main {
  background: #E0E8EF;
}
</style>
