<template>
  <v-card class="mt-5 pa-4 rounded-lg">
    <v-row>
      <v-col cols="8" sm="3" md="5">
        <v-avatar size="80px">
          <img
            :src="image"
            alt=""
          />
        </v-avatar>
        <div class="img mr-3">
          <div class="text-center">
            <v-dialog v-model="dialog" width="500">
              <template v-slot:activator="{ on, attrs }">
                <v-btn
                  color="white"
                  fab
                  x-small
                  height="25"
                  width="25"
                  dark
                  elevation="1"
                  v-bind="attrs"
                  v-on="on"
                >
                  <v-icon color="black">mdi-camera</v-icon>
                </v-btn>
              </template>

              <v-card>
                <v-card-title>
                  <span class="text-h6">EDIT PROFILE</span>
                </v-card-title>
                <v-divider></v-divider>
                <v-card-text class="text-center">
                  <v-avatar size="270">
                    <v-img class="center" max-width="300" :src="image"> </v-img>
                  </v-avatar>
                </v-card-text>
                <v-card-actions class="btn-upload">
                  <div class="image-upload mb-2">
                    <input
                      type="file"
                      @change="fileChange"
                      name="myFile"
                      id="myFile"
                    />
                    <label
                      for="myFile"
                      class="custom-file-upload"
                      color="primary"
                      >SELECT PROFILE</label
                    >

                  </div>
                  <v-spacer></v-spacer>
                  <v-btn
                    class="mb-1"
                    small
                    depressed
                    color="primary"
                    text
                    @click="dialog = false"
                  >
                    Cancel
                  </v-btn>
                  <v-btn
                    small
                    depressed
                    color="primary"
                    class="white--text mb-1"
                    @click="dialog = false"
                  >
                    Change
                  </v-btn>
                </v-card-actions>
              </v-card>
            </v-dialog>
          </div>
          <!--  -->
        </div>
        <div class="d-flex">
          <h3 class="mt-2">{{ alumniData.name }}</h3>
          <v-icon>mdi-gender-female</v-icon>
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
          <v-list-item-title>{{ alumniData.batch }}</v-list-item-title>
        </v-list-item>
        <v-list-item class="ma-0 pa-0">
          <v-icon class="mr-3" color="#00A3FF">mdi-school</v-icon>
          <v-list-item-title>{{ alumniData.skill }}</v-list-item-title>
        </v-list-item>
      </v-col>
      <v-spacer></v-spacer>
      <v-col class="ma-0">
        <v-list-item class="ma-0 pa-0">
          <v-icon class="mr-3" color="#00A3FF">mdi-email</v-icon>
          <v-list-item-title>{{ alumniData.email }}</v-list-item-title>
        </v-list-item>
        <v-list-item class="ma-0 pa-0">
          <v-icon class="mr-3" color="#00A3FF">mdi-phone-in-talk</v-icon>
          <v-list-item-title>{{ alumniData.phone }}</v-list-item-title>
        </v-list-item>
      </v-col>
    </v-row>
  </v-card>
</template>

<script>
export default {
  props: ["alumniData"],
  data() {
    return {
      dialog: false,
      image:
        "https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Free-Image.png",
    };
  },
  methods: {
    fileChange(e) {
      let file = e.target.files[0];
      this.image = URL.createObjectURL(file);
    },
  },
};
</script>

<style scoped>
.v-dialog > .v-card > .v-card__actions {
  padding: 16px 24px 14px;
}
.custom-file-upload {
  font-size: 12px;
  border-radius: 5px;
  background: #00a3ff;
  padding: 8px 9px;
  cursor: pointer;
  color: white;
}
input[type="file"] {
  display: none;
}
.img {
  position: absolute;
  top: 60px;
  left: 75px;
}

.edit-info {
  display: flex;
  justify-content: flex-end;
}
.center {
  display: block;
  margin: auto;
  width: 50%;
  margin-top: 10px;
}
.v-card-title {
  background: rgb(168, 96, 96);
}
</style>
