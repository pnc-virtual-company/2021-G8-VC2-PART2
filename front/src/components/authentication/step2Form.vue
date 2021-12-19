<template>
  <section>
    <div class="step2">
      <div class="profile">
        <img src="../../assets/profilepic.svg" alt="" />
      </div>
      <div class="title-login">
        <p>WELCOME BACK</p>
      </div>
      <v-form ref="form" v-model="valid" lazy-validation>
        <v-container>
          <v-row class="justify-center row-input">
            <v-col md="4">
              <v-text-field
                class="ma-0 pa-0"
                label="Firstname"
                v-model="firstname"
                prepend-inner-icon="mdi-account"
                :rules="[rules.required]"
                @click:append="show1 = !show1"
              ></v-text-field>
            </v-col>
            <v-col md="4">
              <v-text-field
                class="ma-0 pa-0"
                label="Lastname"
                prepend-inner-icon="mdi-account"
                v-model="lastname"
                :rules="[rules.required]"
              ></v-text-field>
            </v-col>
          </v-row>
          <v-row class="justify-center row-input">
            <v-col md="8">
              <v-text-field
                class="ma-0 pa-0"
                v-model="password"
                :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
                :rules="[rules.required, rules.min]"
                :type="show1 ? 'text' : 'password'"
                name="input-10-1"
                label="Password"
                hint="At least 8 characters"
                @click:append="show1 = !show1"
              ></v-text-field>
            </v-col>
          </v-row>
          <v-row class="justify-center row-input">
            <v-col md="8">
              <v-text-field
                class="ma-0 pa-0"
                v-model="comfirmPassword"
                :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
                :rules="[rules.required, rules.min]"
                :type="show1 ? 'text' : 'password'"
                name="input-10-1"
                label="Comfirm Password"
                hint="At least 8 characters"
                @click:append="show1 = !show1"
              ></v-text-field>
            </v-col>
          </v-row>
          <v-row class="justify-center row-input">
            <v-col md="3">
              <v-btn depressed color="4d4d4d ma-0 pa-0" @click="$emit('back')">
                Back
              </v-btn>
            </v-col>
            <v-col md="5">
              <v-btn
                :disabled="!valid"
                @click="validate"
                depressed
                color="primary ma-0 pa-0"
              >
                Sign in
              </v-btn>
            </v-col>
          </v-row>
        </v-container>
      </v-form>
    </div>
  </section>
</template>

<script>
export default {
  data() {
    return {
      valid: true,
      show1: false,
      password: "",
      comfirmPassword: "",
      firstname: "",
      lastname: "",
      rules: {
        required: (value) => !!value || "Required.",
        min: (v) => v.length >= 8 || "Min 8 characters",
      },
    };
  },
  methods: {
    validate() {
      this.$refs.form.validate();
    },
  },
};
</script>
<style scoped>
.row-input {
  margin-top: 0;
  padding: 0;
}
.step2 {
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
