<template>
  <section>
    <div class="step2 mt-10">
      <div class="profile">
        <img class="avatar_lg" src="../../assets/profilepic.svg" alt="" />
        <img class="alumni_lg" src="../../assets/alumni_lg.png" alt="" />
      </div>
      <div class="title-login pa-5">
        <p style="font-size:27px;" v-if="status === 'invited'">COMPLETE INFORMATION</p>
        <p v-else>INPUT PASSWORD</p>
      </div>
      <v-form class="pa-0" ref="form" v-model="valid" lazy-validation>
        <v-row class="justify-center row-input" v-if="status === 'invited'">
          <v-col cols="5" lg="4" md="4" sm="4" xs="5">
            <v-text-field
              class="ma-0 pa-0"
              label="Firstname"
              clearable
              v-model="signInData.firstname"
              :rules="[rules.required]"
            ></v-text-field>
          </v-col>
          <v-col cols="5" lg="4" md="4" sm="4" xs="5">
            <v-text-field
              class="ma-0 pa-0"
              label="Lastname"
              clearable
              v-model="signInData.lastname"
              :rules="[rules.required]"
            ></v-text-field>
          </v-col>
        </v-row>
        <v-row class="justify-center row-input" v-if="status === 'invited' && role === 'alumni'">
          <v-col cols="5" lg="4" md="4" sm="4" xs="5">
            <v-select
              v-model="signInData.selectedBatch"
              :items="batches"
              class="ma-0 pa-0"
              dense
              clearable
              label="Batch"
              :rules="[rules.required]"
            ></v-select>
          </v-col>
          <v-col cols="5" lg="4" md="4" sm="4" xs="5">
            <v-select
              v-model="signInData.selectedMajor"
              :items="majors"
              class="ma-0 pa-0"
              dense
              clearable
              label="Major"
              :rules="[rules.required]"
            ></v-select>
          </v-col>
        </v-row>
        <v-row class="justify-center row-input" v-if="status === 'invited' && role === 'alumni'">
          <v-col cols="5" lg="4" md="4" sm="4" xs="5">
            <v-text-field
              v-model="signInData.phone"
              class="ma-0 pa-0"
              dense
              clearable
              type="number"
              label="Phone Number"
              placeholder="+885"
              :rules="[rules.required, rules.minPhone, rules.maxPhone]"
            ></v-text-field>
          </v-col>
          <v-col cols="5" lg="4" md="4" sm="4" xs="5">
            <v-select
              v-model="signInData.selectedGender"
              class="ma-0 pa-0"
              dense
              clearable
              label="Gender"
              :rules="[rules.required]"
              :items="genders"
            ></v-select>
          </v-col>
        </v-row>
        <v-row class="justify-center row-input">
          <v-col cols="10" lg="8" md="8" sm="8" xs="10">
            <v-text-field
              clearable
              class="ma-0 pa-0"
              v-model="signInData.password"
              :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
              :rules="[rules.required, rules.min, passwordConfirmationRule]"
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
          <v-col cols="10" lg="8" md="8" sm="8" xs="10">
            <v-text-field
              clearable
              class="ma-0 pa-0"
              v-model="signInData.confirmPassword"
              :append-icon="show2 ? 'mdi-eye' : 'mdi-eye-off'"
              :rules="[rules.required, rules.min, passwordConfirmationRule]"
              :type="show2 ? 'text' : 'password'"
              name="input-10-1"
              label="Comfirm Password"
              hint="At least 8 characters"
              @click:append="show2 = !show2"
            ></v-text-field>
          </v-col>
        </v-row>
        <v-row class="justify-center row-input">
          <v-col cols="3" lg="3" md="3" sm="3" xs="3">
            <v-btn depressed color="4d4d4d ma-0 pa-0" @click="$emit('back')">
              Back
            </v-btn>
          </v-col>
          <v-col cols="7" lg="5" md="5" sm="5" xs="7">
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
import axios from "../../axios-http.js";
export default {
  props: ["status", "invalidEmailOrPassword", "role"],
  data() {
    return {
      genders: ["Female", "Male", "Other"],
      majors: ["WEP", "SNA", "DMO"],
      batches: [],
      valid: true,
      show1: false,
      show2: false,
      firstValidation: [true],
      secondValidation: [true],
      signInData: {
        password: "",
        confirmPassword: "",
        firstname: "",
        lastname: "",
        selectedBatch: "",
        selectedMajor: "",
        selectedGender: "",
        phone: "",
      },
      rules: {
        required: (value) => !!value || "Required",
        min: (v) => v.length >= 8 || "Min 8 characters",
        minPhone: (v) => v.length >= 8 || "Min 8 characters",
        maxPhone: (v) => v.length <= 10 || "Max 10 characters",
      },
    };
  },
  computed: {
    passwordConfirmationRule() {
      return (
        this.signInData.confirmPassword === "" ||
        this.signInData.password === "" ||
        this.signInData.password === this.signInData.confirmPassword || 
        "Password must match"
      )
    },
  },
  methods: {
    validate() {
      let isValidated = this.$refs.form.validate();
      if (isValidated) {
        let data = {};
        if(this.status === 'validated') {
          data['password'] = this.signInData.password;
        } else {
          if(this.role === 'alumni') {
            data['firstname'] = this.signInData.firstname;
            data['lastname'] = this.signInData.lastname;
            data['gender'] = this.signInData.selectedGender;
            data['batch'] = this.signInData.selectedBatch;
            data['major'] = this.signInData.selectedMajor;
            data['phone'] = this.signInData.phone;
            data['password'] = this.signInData.password;
          } else {
            data['firstname'] = this.signInData.firstname;
            data['lastname'] = this.signInData.lastname;
            data['password'] = this.signInData.password;
          }
        }
        this.$emit("submitSecondStep", data);
      }
    },
  },
  mounted() {
    if(this.status === 'invited') {
      axios.get('batches')
      .then(res => {
        this.batches = res.data;
      })
    }
  },
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
@media (max-width: 1100px) {
  .alumni_lg{
    display: block;
  }
  .avatar_lg{
    display: none;
  }
}
</style>
