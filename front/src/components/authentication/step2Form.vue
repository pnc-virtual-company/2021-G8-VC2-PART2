<template>
  <section>
    <div class="step2 mt-5">
      <div class="profile">
        <img src="../../assets/profilepic.svg" alt="" />
      </div>
      <div class="title-login">
        <p v-if="status === 'invited'">COMPLETE INFORMATION</p>
        <p v-else>INPUT PASSWORD</p>
      </div>
      <v-form class="pa-10" ref="form" v-model="valid" lazy-validation>
        <v-row class="justify-center row-input" v-if="status === 'invited'">
          <v-col md="4" sm="5">
            <v-text-field
              class="ma-0 pa-0"
              label="Firstname"
              clearable
              v-model="signInData.firstname"
              :rules="[rules.required]"
            ></v-text-field>
          </v-col>
          <v-col md="4" sm="5">
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
          <v-col md="4" sm="5">
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
          <v-col md="4" sm="5">
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
          <v-col md="4" sm="5">
            <v-text-field
              v-model="signInData.phone"
              class="ma-0 pa-0"
              dense
              clearable
              type="number"
              label="Phone Number"
              placeholder="+885"
              :rules="[rules.required]"
            ></v-text-field>
          </v-col>
          <v-col md="4" sm="5">
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
          <v-col md="8" sm="8">
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
          <v-col md="8" sm="8">
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
import axios from "../../axios-http.js";
export default {
  props: ["status", "invalidEmailOrPassword", "role"],
  data() {
    return {
      genders: ["Female", "Male", "Other"],
      majors: ["WEP", "SNA"],
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
      },
    };
  },
  computed: {
    passwordConfirmationRule() {
      return () =>
        this.signInData.confirmPassword === "" ||
        this.signInData.password === "" ||
        this.signInData.password === this.signInData.confirmPassword || 
        "Password does not match";
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
