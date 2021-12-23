<template>
  <section>
    <div class="step2">
      <div class="profile">
        <img src="../../assets/profilepic.svg" alt="" />
      </div>
      <div class="title-login">
        <p>COMPLETE INFORMATION</p>
      </div>
      <v-form ref="form" v-model="valid" lazy-validation>
        <v-row class="justify-center row-input" v-if="status === 'invited'">
          <v-col md="4" sm="5">
            <v-text-field
              class="ma-0 pa-0"
              label="Firstname"
              clearable
              v-model="firstname"
              :rules="[rules.required]"
            ></v-text-field>
          </v-col>
          <v-col md="4" sm="5">
            <v-text-field
              class="ma-0 pa-0"
              label="Lastname"
              clearable
              v-model="lastname"
              :rules="[rules.required]"
            ></v-text-field>
          </v-col>
        </v-row>
        <v-row class="justify-center row-input" v-if="status === 'invited'">
          <v-col md="4" sm="5">
            <v-combobox
              class="ma-0 pa-0"
              dense
              clearable
              label="Batch"
              :rules="[rules.required]"
            ></v-combobox>
          </v-col>
          <v-col md="4" sm="5">
            <v-combobox
              class="ma-0 pa-0"
              dense
              clearable
              label="Major"
              :rules="[rules.required]"
            ></v-combobox>
          </v-col>
        </v-row>
        <v-row class="justify-center row-input" v-if="status === 'invited'">
          <v-col md="4" sm="5">
            <v-text-field
              class="ma-0 pa-0"
              dense
              clearable
              label="Phone Number"
              placeholder="+885"
              :rules="[rules.required]"
            ></v-text-field>
          </v-col>
          <v-col md="4" sm="5">
            <v-select
              class="ma-0 pa-0"
              dense
              clearable
              label="Gender"
              :rules="[rules.required]"
              :items="items"
            ></v-select>
          </v-col>
        </v-row>
        <v-row class="justify-center row-input">
          <v-col md="8" sm="8">
            <v-text-field
              clearable
              class="ma-0 pa-0"
              v-model="password"
              :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
              :rules="[rules.required, rules.min, rules.isMatchWithConfirm]"
              :type="show1 ? 'text' : 'password'"
              name="input-10-1"
              label="Password"
              hint="At least 8 characters"
              @click:append="show1 = !show1"
            ></v-text-field>
            <p v-if="invalidEmailOrPassword !== null" class="red--text">
              {{ invalidEmailOrPassword }}
            </p>
          </v-col>
        </v-row>
        <v-row class="justify-center row-input" v-if="status === 'invited'">
          <v-col md="8" sm="8">
            <v-text-field
              clearable
              class="ma-0 pa-0"
              v-model="confirmPassword"
              :append-icon="show2 ? 'mdi-eye' : 'mdi-eye-off'"
              :rules="[rules.required, rules.min, rules.isMatchWithPassword]"
              :type="show2 ? 'text' : 'password'"
              name="input-10-1"
              label="Comfirm Password"
              hint="At least 8 characters"
              @click:append="show2 = !show2"
            ></v-text-field>
          </v-col>
        </v-row>
        <v-row class="justify-center row-input">
          <v-col md="3" sm="3">
            <v-btn depressed color="4d4d4d ma-0 pa-0" @click="$emit('back')">
              Back
            </v-btn>
          </v-col>
          <v-col md="5" sm="5">
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
      </v-form>
    </div>
  </section>
</template>

<script>
export default {
  props: ["status", "invalidEmailOrPassword"],
  data() {
    return {
      items: ["Female", "Male", "Other"],
      valid: true,
      show1: false,
      show2: false,
      firstValidation: [true],
      secondValidation: [true],
      password: "",
      confirmPassword: "",
      firstname: "",
      lastname: "",
      rules: {
        required: (value) => !!value || "Required",
        min: (v) => v.length >= 8 || "Min 8 characters",
        isMatchWithConfirm: (v) =>
          this.confirmPassword === "" ||
          v === this.confirmPassword ||
          "Password does not match",
        isMatchWithPassword: (v) =>
          this.password === "" ||
          v === this.password ||
          "Password does not match",
      },
    };
  },
  computed: {
    passwordConfirmationRule() {
      return () =>
        this.password === this.confirmPassword || "Password must match";
    },
  },
  methods: {
    validate() {
      let isValidated = this.$refs.form.validate();
      if (isValidated) {
        let data = {};
        if (this.status === "invited") {
          data = {
            firstname: this.firstname,
            lastname: this.lastname,
            password: this.password,
          };
        } else if (this.status === "validated") {
          data = {
            password: this.password,
          };
        }
        this.$emit("submitSecondStep", data);
      }
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
  margin-top: 6%;
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
