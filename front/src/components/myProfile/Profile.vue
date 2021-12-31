<template>
  <v-card class="mt-5 pa-4 rounded-lg">
    <!-- edit info -->
    <v-dialog
      persistent
      v-model="editInfoDialog"
      :max-width="options.width"
      :style="{ zIndex: options.zIndex }"
    >
      <v-card>
        <v-card-title class="mx-auto text--h6">Edit Information</v-card-title>
        <v-divider></v-divider>
        <v-card-text>
          <v-form ref="form" v-model="valid" lazy-validation>
            <v-text-field
              label="Email"
              type="email"
              clearable
              prepend-inner-icon="mdi-email"
              v-model="newEmail"
              :rules="[rules.required, rules.emailRules]"
            ></v-text-field>
            <v-text-field class="mt-2"
              v-model="newPhone"
              clearable
              label="Phone"
              type="number"
              prepend-inner-icon="mdi-phone-in-talk"
              :rules="[rules.required]"
            ></v-text-field>
          </v-form>
        </v-card-text>
        <v-card-actions class="btn-upload">
          <v-spacer></v-spacer>
          <v-btn
            class="mb-1"
            small
            depressed
            color="primary"
            text
            @click="editInfoDialog = false"
          >
            Cancel
          </v-btn>
          <v-btn
            :disabled="!valid"
            small
            depressed
            color="primary"
            class="white--text mb-1"
            @click="changeInfo"
          >
            Change
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
    <!-- end edit info -->
    <v-row>
      <v-col cols="8" sm="3" md="5">
        <v-avatar size="100px">
          <img
            :src="imageUrl + userData.profile"
            alt=""
          />
        </v-avatar>
        <div class="img mr-3">
          <div class="text-center">
            <v-dialog v-model="dialog" persistent width="500">
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
                    @click="changeProfile"
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
          <h3 class="mt-2">
            {{
              userData.firstname.toUpperCase() +
              " " +
              userData.lastname.toUpperCase()
            }}
          </h3>
          <v-icon>{{ getGenderSign }}</v-icon>
        </div>
      </v-col>
      <v-col class="edit-info">
        <v-btn
          color="white"
          fab
          x-small
          dark
          elevation="1"
          @click="openEditInfoDialog"
        >
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
          <v-list-item-title>{{ userData.batch }}</v-list-item-title>
        </v-list-item>
        <v-list-item class="ma-0 pa-0">
          <v-icon class="mr-3" color="#00A3FF">mdi-school</v-icon>
          <v-list-item-title>{{ userData.major }}</v-list-item-title>
        </v-list-item>
      </v-col>
      <v-spacer></v-spacer>
      <v-col class="ma-0">
        <v-list-item class="ma-0 pa-0">
          <v-icon class="mr-3" color="#00A3FF">mdi-email</v-icon>
          <v-list-item-title>{{ userData.email }}</v-list-item-title>
        </v-list-item>
        <v-list-item class="ma-0 pa-0">
          <v-icon class="mr-3" color="#00A3FF">mdi-phone-in-talk</v-icon>
          <v-list-item-title>+885 {{ userData.phone }}</v-list-item-title>
        </v-list-item>
      </v-col>
    </v-row>
  </v-card>
</template>

<script>
import axios from "../../axios-http.js";
export default {
  props: ["userData"],
  data() {
    return {
      imageUrl: "http://127.0.0.1:8000/storage/profiles/",
      dialog: false,
      image:
        "https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Free-Image.png",
      imageFile: null,
      valid: true,
      newEmail: "",
      newPhone: "",
      editInfoDialog: false,
      options: {
        color: "grey lighten-3",
        width: 400,
        zIndex: 200,
        noconfirm: false,
      },
      rules: {
        required: (value) => !!value || "Required",
        emailRules: (v) => /.+@.+/.test(v) || "Invalid email format",
      },
    };
  },
  computed: {
    getGenderSign: function () {
      let result = "mdi-gender-female";
      if (this.userData.gender === "Male") {
        result = "mdi-gender-male";
      } else if (this.userData.gender === "Other") {
        result = "";
      }
      return result;
    },
  },
  methods: {
    fileChange(e) {
      this.imageFile = e.target.files[0];
      this.image = URL.createObjectURL(this.imageFile);
    },
    changeProfile() {
      this.dialog = false;
      if (this.imageFile !== null) {
        let imageFile = new FormData();
        imageFile.append("profile", this.imageFile);
        imageFile.append("_method", "PUT");
        axios
          .post("users/updateprofiles/" + this.userData.user_id, imageFile)
          .then((res) => {
            this.$emit("changeProfile", res.data.profile);
          });
      }
    },
    changeInfo() {
      this.editInfoDialog = false;
      let data = {
        "email": this.newEmail,
        "phone": this.newPhone,
      }
      axios.put("users/updateinfo/" + this.userData.user_id, data)
      .then(res => {
        this.$emit('changeAlumniInfo', res.data.newEmail, res.data.newPhone);
      })
    },
    openEditInfoDialog() {
      this.editInfoDialog = true;
      this.newEmail = this.userData.email;
      this.newPhone = this.userData.phone;
    },
  },
  watch: {
    editInfoDialog: function (val) {
      if (val) {
        this.email = "";
        this.phoneNumber = "";
      }
    },
  },
};
</script>

<style scoped>
.v-application .mt-2 {
  margin-top: 10px !important;
}
.v-dialog > .v-card > .v-card__actions {
  padding: 16px 24px 14px;
}
.v-dialog > .v-card > .v-card__title {
  font-size: 17px;
  font-weight: 200;
  letter-spacing: 0.0125em;
  padding: 16px 24px 10px;
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
  top: 80px;
  left: 90px;
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
