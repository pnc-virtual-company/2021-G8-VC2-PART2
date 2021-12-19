<template>
  <section>
    <div class="step2">
      <div class="profile">
        <img src="../../assets/profilepic.svg" alt="" />
      </div>
      <div class="title-login">
        <p>WELCOME BACK</p>
      </div>
      <v-form>
        <v-container>
          <v-row class="justify-center row-input">
            <v-col md="4">
              <v-text-field
                class="ma-0 pa-0"
                label="Firstname"
                prepend-inner-icon="mdi-account"
                required
              ></v-text-field>
            </v-col>
            <v-col md="4">
              <v-text-field
                class="ma-0 pa-0"
                label="Lastname"
                prepend-inner-icon="mdi-account"
                required
              ></v-text-field>
            </v-col>
          </v-row>
          <v-row class="justify-center row-input">
            <v-col md="8">
              <v-text-field
                class="ma-0 pa-0"
                label="Password"
                prepend-inner-icon="mdi-key"
                type="password"
                required
              ></v-text-field>
            </v-col>
          </v-row>
          <v-row class="justify-center row-input">
            <v-col md="8">
              <v-text-field
                class="ma-0 pa-0"
                label="Confirm Password"
                prepend-inner-icon="mdi-checkbox-marked-circle"
                type="password"
                required
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
              <v-btn depressed color="primary ma-0 pa-0"> Sign in </v-btn>
            </v-col>
          </v-row>
        </v-container>
      </v-form>
    </div>
  </section>
</template>

<script></script>

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
