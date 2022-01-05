<template>
  <section>
    <div class="step1">
      <div class="profile">
        <img class="avatar_lg" src="../../assets/profilepic.svg" alt="" />
        <img class="alumni_lg" src="../../assets/alumni_lg.png" alt="" />
      </div>
      <div class="title-login">
        <p>WELCOME BACK</p>
      </div>
      <v-form class="pa-0" ref="form" v-model="valid" lazy-validation>
        <v-row class="justify-center">
          <v-col cols="10" lg="8" md="6" sm="8" xs="10">
            <v-text-field
              label="Email"
              type="email"
              prepend-inner-icon="mdi-email"
              v-model="email"
              :rules="[rules.required, rules.emailRules]"
            ></v-text-field>
            <small v-if="invalidEmail !== null" class="red--text">{{ invalidEmail }}</small>
          </v-col>
        </v-row>
        <v-row class="justify-center row-input">
          <v-col cols="10" lg="8" md="6" sm="8" xs="10">
            <v-btn
              :disabled="!valid"
              type="button"
              depressed
              color="primary"
              @click="$emit('submitFirstStep', email)"
            >
              NEXT <v-icon>mdi-arrow-right</v-icon></v-btn
            >
          </v-col>
        </v-row>
      </v-form>
    </div>
  </section>
</template>

<script>
export default {
  props: ["invalidEmail"],
  data() {
    return {
      valid: true,
      show1: false,
      email: "",
      isInvalidEmail: [],
      rules: {
        required: (value) => !!value || "Required",
        emailRules: (v) => /.+@.+/.test(v) || "Invalid email format",
      },
    };
  },
  watch: {
    email: function(newValue) {
      if(newValue !== '') {
        this.$emit('clearErrorMessage');
      }
    }
  }
};
</script>

<style scoped>
.alumni_lg{
  display: none;
}
.row-input {
  margin-top: 0;
  padding: 0;
}
.step1 {
  position: relative;
  animation-name: example;
  animation-duration: 0.5s;
}
@keyframes example {
  0% {
    right: -100%;
    top: 0%;
  }
  100% {
    right: 0%;
    top: 0%;
  }
}
.profile {
  display: flex;
  justify-content: center;
  align-items: center;
}
.profile > img {
  margin-top: 15%;
  width: 12vh;
}
.title-login {
  color: #4d4d4d;
  margin-top: 10px;
  text-align: center;
  font-size: 30px;
}
.v-btn {
  width: 100%;
}
@media (max-width: 1100px) {
  .alumni_lg{
    display: block;
  }
  .avatar_lg{
    display: none;
  }
}
</style>
