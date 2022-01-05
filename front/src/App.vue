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
        :userEro="user"
        :status="signInData.status"
        :role="signInData.role"
        :invalidEmail="error.invalidEmail"
        :eroSupport="error.eroSupport"
        :invalidEmailOrPassword="error.invalidEmailOrPassword"
        @submitFirstStep="submitStep1"
        @submitSecondStep="submitStep2"
        @clearSignInData="clearSignInData"
        @clearErrorMessage="clearErrorMessage"
        @changeProfile="changeProfile"
        @changeAlumniInfo="changeAlumniInfo"
        @addNewEmployment="addNewEmployment"
        @updateEmployment="updateEmployment"
        @deleteEmployment="deleteEmployment"
        @addSkills="addSkills"
        @deleteSkill="deleteSkill"
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
        eroSupport : null,
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
      this.user = { role: null };
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
          this.error.eroSupport = null;
        })
        .catch((err) => {
          if (err.response.status === 401) {
            this.error.invalidEmail = "Invalid email address";
            this.error.eroSupport = "To help you please contact ERO by + 855 71254321"
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
      data["status"] = this.signInData.status;
      data["email"] = this.signInData.email;
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
      this.error.eroSupport = null;
    },
    changeProfile(profile) {
      this.user.profile = profile;
    },
    changeAlumniInfo(newEmail, newPhone) {
      this.user.email = newEmail;
      this.user.phone = newPhone;
    },
    addNewEmployment(data) {
      this.user.employments.unshift(data);
    },
    updateEmployment(data) {
      this.user.employments = this.user.employments.map(obj => data.find(o => o.id === obj.id) || obj);
    },
    deleteEmployment(id) {
      this.user.employments = this.user.employments.filter(emp => emp.id !== id);
    },

    addSkills(skills) {
      for(let skill of skills) {
        this.user.skills.unshift(skill);
      }
    },
    
    deleteSkill(skill) {
      this.user.skills = this.user.skills.filter(s => s !== skill);
    }
  },
  mounted() {
    if (localStorage.getItem("userId")) {
      let userId = localStorage.getItem("userId");
      axios.get("users/" + userId).then((res) => {
        this.user = res.data;
        if(this.user.role === 'alumni') {
          this.user.employments = this.user.employments.reverse();
          this.user.employments.sort(function (a, b) {
            var dateA = new Date(a.startJobDate), dateB = new Date(b.startJobDate)
            return dateB - dateA
          });
        }
        if(this.$router.path === "/eroview" ||
           this.$router.path === "/myprofile" ||
           this.$router.path === "/signin" ||
           this.$router.path === "/" 
        ) {
          if (this.user.role === "admin" || this.user.role === "ero") {
            this.$router.push("/eroview");
          } else {
            this.$router.push("/myprofile");
          }
        }
      });
    }
  },
};
</script>

<style>
@import url("http://fonts.cdnfonts.com/css/sf-ui-display");
* {
  font-family: sans-serif;
  color: #4d4d4d;
}
.container {
  width: 50%;
  margin: auto;
}

.v-main {
  background: #e0e8ef;
}
</style>
