<template>
  <v-app>
    <navigation-bar
      v-if="isLogin"
      @signout="signOut"
      :role="user.role"
    ></navigation-bar>
    <v-main>
      <router-view
        :userData="user"
        :status="signInData.status"
        :role="signInData.role"
        :invalidEmail="error.invalidEmail"
        :invalidEmailOrPassword="error.invalidEmailOrPassword"
        @submitFirstStep="submitStep1"
        @submitSecondStep="submitStep2"
        @clearSignInData="clearSignInData"
        @clearErrorMessage="clearErrorMessage"
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
      user: {
        role: null,
      },
      error: {
        invalidEmail: null,
        invalidEmailOrPassword: null,
      },
      signInData: {
        email: null,
        status: null,
        role: null,
      },
    };
  },
  computed: {
    isLogin: function () {
      return this.user.role !== null;
    },
  },
  methods: {
    signOut() {
      localStorage.removeItem("userId");
      this.user = {role: null};
      this.$router.push("/signin");
    },
    submitStep1(email) {
      let route = "signin/";
      this.signInData.email = email;
      axios
        .get(route + email)
        .then((res) => {
          this.signInData.status = res.data.status;
          this.signInData.role = res.data.role;
          this.error.invalidEmail = null;
        })
        .catch((err) => {
          if (err.response.status === 401) {
            this.error.invalidEmail = "Invalid email address";
          } else {
            console.log(err);
          }
        });
    },
    submitStep2(data) {
      let route = "signin/password";
      if (this.signInData.status === "invited") {
        route = "signin/completeinfo";
      }
      data['status'] = this.signInData.status;
      data['email'] = this.signInData.email;
      axios
        .post(route, data)
        .then((res) => {
          this.user = res.data.user;
          this.error.invalidEmailOrPassword = null;
          if (this.user.role === "admin" || this.user.role === "ero") {
            localStorage.setItem("userId", this.user.id);
            this.$router.push("/eroview");
          } else {
            localStorage.setItem("userId", this.user.user_id);
            this.$router.push("/myprofile");
          }
        })
        .catch((err) => {
          if (err.response.status === 401) {
            this.error.invalidEmailOrPassword = "Invalid email or password";
          } else {
            console.log(err);
          }
        });
    },
    clearSignInData() {
      this.signInData = {
        email: null,
        status: null,
      };
      this.error.invalidEmailOrPassword = null;
    },
    clearErrorMessage() {
      this.error.invalidEmail = null;
    }
  },
  mounted() {
    if (localStorage.getItem("userId")) {
      let userId = localStorage.getItem("userId");
      axios.get('users/' + userId)
      .then(res => {
        this.user = res.data.user;
        if (this.user.role === "admin" || this.user.role === "ero") {
          this.$router.push("/eroview");
        } else {
          this.$router.push("/myprofile");
        }
      })
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
