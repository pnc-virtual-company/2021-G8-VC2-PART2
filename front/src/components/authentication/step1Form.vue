<template>
  <section>
    <div class="step1">
      <div class="profile">
        <img src="../../assets/profilepic.svg" alt="" />
      </div>
      <div class="title-login">
        <p>WELCOME BACK</p>
      </div>
      <v-form ref="form" v-model="valid" lazy-validation>
        <v-row class="justify-center">
          <v-col md="8">
            <v-text-field
              label="Email"
              type="email"
              prepend-inner-icon="mdi-email"
              v-model="email"
              :rules="[rules.required, rules.emailRules]"
            ></v-text-field>
          </v-col>
        </v-row>
        <v-row class="justify-center" v-if="invalidEmail !== null">
          <v-col md="8">
            <p class="red--text">{{ invalidEmail }}</p>
          </v-col>
        </v-row>
        <v-row class="justify-center">
          <v-col md="8">
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
  }
};
</script>

<style scoped>
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
</style>
