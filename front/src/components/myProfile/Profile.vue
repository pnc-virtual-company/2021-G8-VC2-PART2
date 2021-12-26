<template>
  <v-card class="mt-5 pa-4 rounded-lg">
    <v-row>
      <v-col cols="8" sm="3" md="5">
        <v-avatar size="80px">
          <img
            src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Circle-icons-profile.svg/1024px-Circle-icons-profile.svg.png"
            alt=""
          />
        </v-avatar>
        <div class="img mr-3">
          <v-btn
            color="white"
            fab
            x-small
            height="25"
            width="25"
            dark
            elevation="1"
          >
            <v-icon color="black">mdi-camera</v-icon>
          </v-btn>
        </div>
        <div class="d-flex">
          <h3 class="mt-2">{{userData.firstname.toUpperCase() + ' ' + userData.lastname.toUpperCase()}}</h3>
          <v-icon>{{ getGenderSign }}</v-icon>
        </div>
      </v-col>
      <v-col class="edit-info">
        <v-btn color="white" fab x-small dark elevation="1">
          <v-icon color="black">mdi-pencil</v-icon>
        </v-btn>
      </v-col>
    </v-row>
    <v-row class="mt-0">
      <v-col cols="12" md="6">
        <v-list-item class="ma-0 pa-0">
          <div class="mr-3">
            <v-icon color="#00A3FF">mdi-clipboard-text</v-icon>
          </div>
          <v-list-item-title>{{userData.batch}}</v-list-item-title>
        </v-list-item>
        <v-list-item class="ma-0 pa-0">
          <v-icon class="mr-3" color="#00A3FF">mdi-school</v-icon>
          <v-list-item-title>{{userData.major}}</v-list-item-title>
        </v-list-item>
      </v-col>
      <v-spacer></v-spacer>
      <v-col class="ma-0">
        <v-list-item class="ma-0 pa-0">
          <v-icon class="mr-3" color="#00A3FF">mdi-email</v-icon>
          <v-list-item-title>{{userData.email}}</v-list-item-title>
        </v-list-item>
        <v-list-item class="ma-0 pa-0">
          <v-icon class="mr-3" color="#00A3FF">mdi-phone-in-talk</v-icon>
          <v-list-item-title>+885 {{userData.phone}}</v-list-item-title>
        </v-list-item>
      </v-col>
    </v-row>
  </v-card>
</template>

<script>
export default {
  props:['userData'],
  computed: {
    getGenderSign: function() {
      let result = 'mdi-gender-female';
      if(this.userData.gender === 'Male') {
        result = 'mdi-gender-male'
      } else if(this.userData.gender === 'Other') {
        result = '';
      }
      return result;
    }
  }
};
</script>

<style scoped>
.img {
  position: absolute;
  top: 60px;
  left: 75px;
}

.edit-info {
  display: flex;
  justify-content: flex-end;
}
</style>