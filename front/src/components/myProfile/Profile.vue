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
          <v-icon size="20">mdi-camera</v-icon>
        </div>
        <h3 class="mt-2">THON THENG</h3>
      </v-col>
      <v-col class="edit-info">
        <div class="circle mr-3">
          <v-icon>mdi-pencil</v-icon>
        </div>
      </v-col>
    </v-row>
    <v-row class="mt-0">
      <v-col cols="12" md="6">
        <v-list-item class="ma-0 pa-0">
          <div class="circle mr-3">
            <v-icon style="color: red">mdi-clipboard-text</v-icon>
          </div>
          <v-list-item-title>Batch 2021</v-list-item-title>
        </v-list-item>
        <v-list-item class="ma-0 pa-0">
          <v-icon class="circle mr-3" style="color: green">mdi-school</v-icon>
          <v-list-item-title>WEB</v-list-item-title>
        </v-list-item>
      </v-col>
      <v-spacer></v-spacer>
      <v-col xs="2" class="ma-0">
        <v-list-item class="ma-0 pa-0">
          <v-icon class="circle mr-3" style="color: blue">mdi-email</v-icon>
          <v-list-item-title>thontheng1990@gmail.com</v-list-item-title>
        </v-list-item>
        <v-list-item class="ma-0 pa-0">
          <v-icon class="circle mr-3" style="color: orange"
            >mdi-phone-in-talk</v-icon
          >
          <v-list-item-title>+1234567888</v-list-item-title>
        </v-list-item>
      </v-col>
    </v-row>
  </v-card>
</template>

<script>
export default {};
</script>

<style scoped>
.circle , .img{
  background-color: #ffff;
  border-radius: 50%;
  padding: 15px;
  width: 30px;
  height: 30px;
  font-size: 18px;
  display: flex;
  justify-content: center;
  align-items: center;
  box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;
}
.img {
  position: absolute;
  top: 60px;
  left: 75px;
  width: 30px;
  height: 30px;
}
.edit-info{
  display: flex;
  justify-content: flex-end;
}
</style>