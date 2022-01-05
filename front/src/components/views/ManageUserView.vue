<template>
  <section class="manageuser">
    <v-row class="mt-5">
      <v-col cols="12" sm="6" md="12" lg="12">
        <v-alert
          v-model="alert"
          dismissible
          color="cyan"
          border="left"
          elevation="3"
          colored-border
        >
          {{ alertMessage }}
        </v-alert>
    <v-card class="ma-0 pa-3" v-if="manageSelected === 'ero'"><b>Manage ERO</b></v-card>
    <v-card class="ma-0 pa-3" v-if="manageSelected === 'company'"><b>Manage Company</b></v-card>
        <v-text-field
          v-if="manageSelected === 'alumni'"
          v-model="keySearch"
          prepend-inner-icon="mdi-magnify"
          placeholder="Search"
          label="Search"
          hide-details
          clearable
          single-line
          solo
          height="20px"
        ></v-text-field>
      </v-col>
    </v-row>
    <v-row wrap>
      <v-col cols="12" sm="12" md="5" lg="5" v-if="manageSelected == 'alumni'">
        <v-card class="d-flex pa-2">
          <v-progress-circular
            :rotate="180"
            :size="90"
            :width="15"
            :value="percentage"
            color="red"
          >
            {{ invitedAlumnisStored.length + validatedAlumnisStored.length }}
          </v-progress-circular>
          <div class="data ml-3">
            <div class="pointer" @click="showInvited">
              <v-icon color="grey darken-2">mdi-checkbox-blank</v-icon>
              Invited {{ invitedAlumnisStored.length }}
            </div>
            <br />
            <div class="pointer" @click="showValidated">
              <v-icon color="grey lighten-2">mdi-checkbox-blank</v-icon>
              Validated {{ validatedAlumnisStored.length }}
            </div>
          </div>
        </v-card>
      </v-col>
      <v-col  cols="12" sm="12" md="5" lg="5" v-if="manageSelected !== 'alumni'"></v-col>
      <v-col cols="2" md="2" lg="2" v-if="manageSelected !== 'company'"></v-col>
      <v-col cols="4" md="4" lg="4" v-if="manageSelected === 'company'"></v-col>
      <v-col cols="3" md="3" lg="3">
        <v-select
          class="mt-1"
          label="Role"
          dense
          solo
          :items="manages"
          v-model="manageSelected"
        ></v-select>
      </v-col>
      <v-col cols="4" md="2" lg="2" v-if="manageSelected !== 'company'">
        <v-flex class="d-flex justify-end">
          <v-dialog v-model="dialog" max-width="500px" persistent>
            <template v-slot:activator="{ on, attrs }">
              <v-btn
                class="white--text mt-1 py-5"
                depressed
                color="warning invite-btn"
                v-bind="attrs"
                v-on="on"
              >
                Invite
              </v-btn>
            </template>
            <v-card>
              <v-card-title>
                <span class="text-h5">Invite People</span>
              </v-card-title>
              <v-card-text>
                <v-row class="pa-0">
                  <v-col cols="12 mt-0">
                    <v-select
                      v-if="userEro.role === 'admin'"
                      class="mt-5"
                      prepend-inner-icon="mdi-account-box-outline"
                      :items="manages"
                      v-model="selectedRoleForInvite"
                      label="Select role"
                      :rules="[rules.required]"
                    ></v-select>
                    <v-combobox
                      class="mt-3"
                      type="email"
                      prepend-inner-icon="mdi-email"
                      label="Emails"
                      v-model="inviteEmailList"
                      @blur="checkEmail"
                      :search-input.sync="notChipEmail"
                      small-chips
                      multiple
                      clearable
                      :rules="[rules.required]"
                    >
                      <template
                        v-slot:selection="{
                          attrs,
                          item,
                          parent,
                          inviteEmailList,
                        }"
                      >
                        <v-chip
                          v-bind="attrs"
                          :input-value="inviteEmailList"
                          small
                        >
                          <span class="pr-2">{{ item }}</span>
                          <v-icon small @click="parent.selectItem(item)"
                            >$delete</v-icon
                          >
                        </v-chip>
                      </template>
                    </v-combobox>
                  </v-col>
                </v-row>
              </v-card-text>
              <v-divider></v-divider>
              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn color="blue darken-1" text @click="dialog = false">
                  Close
                </v-btn>
                <v-btn
                  color="primary"
                  text
                  @click="submitEmail(inviteEmailList, selectedRoleForInvite)"
                >
                  Submit
                </v-btn>
              </v-card-actions>
            </v-card>
          </v-dialog>
        </v-flex>
      </v-col>
    </v-row>
    <!-- End -->
    <v-card class="card_contain mt-5 mb-5" v-if="manageSelected === 'alumni'">
      <v-card class="pa-10 text-center" v-if="alumnisToDisplay.length === 0">No People Found</v-card>
      <v-card
        flat
        class="name-card pa-3"
        v-for="user in alumnisToDisplay"
        :key="user.id"
      >
        <v-layout row class="border-left" :class="`pa-2 user ${user.major}`">
          <v-flex xs6 md3 sm2>
            <div class="caption grey--text mb-1">Name</div>
            <div>
              {{
                user.status == "invited"
                  ? "Empty"
                  : user.firstname + " " + user.lastname
              }}
            </div>
          </v-flex>
          <v-flex xs6 md4>
            <div class="caption grey--text mb-1">Email</div>
            <div>{{ user.email }}</div>
          </v-flex>
          <v-flex xs6 md2>
            <div class="caption grey--text mb-1">Gender</div>
            <div>{{ user.status == "invited" ? "Empty" : user.gender }}</div>
          </v-flex>
          <v-flex xs6 md2>
            <div class="caption grey--text mb-1">Major</div>
            <div :class="`major ${user.major}`">
              {{
                user.status == "invited"
                  ? "Empty"
                  : user.major + " " + user.batch
              }}
            </div>
          </v-flex>
          <v-flex xs6 md1>
            <div class="caption grey--text mb-1">Action</div>
            <v-btn
              icon
              @click="removeUser(user.user_id, user.role, user.status)"
            >
              <v-icon>mdi-delete</v-icon>
            </v-btn>
          </v-flex>
        </v-layout>
      </v-card>
    </v-card>
    <v-card class="card_contain mt-6" v-if="manageSelected === 'ero'">
      <v-card flat class="name-card pa-3" v-for="user in eros" :key="user.id">
        <v-layout row wrap :class="`pa-2 user ${user.status}`">
          <v-flex xs6 md1 sm2>
            <div class="caption grey--text mb-1">ID</div>
            <div>{{ user.id }}</div>
          </v-flex>
          <v-flex xs6 md3 xs2>
            <div class="caption grey--text mb-1">Name</div>
            <div>
              {{
                user.status == "invited"
                  ? "Empty"
                  : user.firstname + " " + user.lastname
              }}
            </div>
          </v-flex>
          <v-flex xs6 md4 xs4>
            <div class="caption grey--text mb-1">Email</div>
            <div>{{ user.email }}</div>
          </v-flex>
          <v-flex xs6 md3 xs4>
            <div class="caption grey--text mb-1">Status</div>
            <div :class="`ero ${user.status}`">{{ user.status }}</div>
          </v-flex>
          <v-flex xs6 md1 sm4>
            <div class="caption grey--text">Action</div>
            <v-btn icon @click="removeUser(user.id, user.role, user.status)">
              <v-icon>mdi-delete</v-icon>
            </v-btn>
          </v-flex>
        </v-layout>
      </v-card>
    </v-card>
    <!-- company -->
    <v-card class="ma-0 pa-2" v-if="manageSelected === 'company'">
      <v-row>
        <v-col>
          <v-list-item
            class="ma-0 pa-3 companyLogo"
            v-for="company of companyList"
            :key="company.id"
          >
            <v-avatar class="mr-5 companyLogo" size="60">
              <v-img :src="imageUrl + company.logo" alt=""></v-img>
            </v-avatar>
            <v-avatar size="60" class="edit">
              <v-icon
                size="20"
                color="white"
                @click="openLogoEditDialog(company.id, company.logo)"
                class="mt-1"
                >mdi-border-color</v-icon
              >
            </v-avatar>
            <v-list-item-title class="pa-1">
              <v-flex class="d-flex">
                <v-list-item-title>
                  {{ company.company_name }}
                </v-list-item-title>
                <v-menu bottom left> </v-menu>
              </v-flex>
              <v-list-item-subtitle class="mt-1">
                {{ company.domain_company }} at
                {{ company.location }}</v-list-item-subtitle
              >
            </v-list-item-title>
            <v-icon
              size="20"
              class="mb-3 edit-text"
              @click="isEditCompanyText = true"
              >mdi-border-color</v-icon
            >
          </v-list-item>
        </v-col>
      </v-row>
    </v-card>
    <!-- edit logo -->
    <v-dialog v-model="isEditLogo" persistent max-width="400px">
      <v-card>
        <v-card-title>
          <span class="text-h6">EDIT COMPANY LOGO</span>
        </v-card-title>
        <v-divider></v-divider>
        <v-card-text class="text-center">
          <v-avatar size="200">
            <v-img class="center mt-3" :src="companyLogo"> </v-img>
          </v-avatar>
        </v-card-text>
        <v-card-actions class="btn-upload">
          <div class="image-upload mb-2">
            <input type="file" @change="fileChange" name="myFile" id="myFile" />
            <label for="myFile" class="custom-file-upload" color="primary"
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
            @click="isEditLogo = false"
          >
            Cancel
          </v-btn>
          <v-btn
            small
            depressed
            color="primary"
            class="white--text mb-1"
            @click="changeLogo"
          >
            Change
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
    <!-- edit logo -->
    <!-- edit company text -->
    <v-dialog v-model="isEditCompanyText" persistent max-width="400px">
      <v-card>
        <v-card-title class="mx-auto text--h6">Edit Company</v-card-title>
        <v-divider></v-divider>
        <v-card-text>
          <v-form ref="form" v-model="valid" lazy-validation>
            <v-text-field
              label="Company Name"
              clearable
              v-model="newName"
              :rules="[rules.required]"
            ></v-text-field>
            <v-text-field
              label="Industry"
              clearable
              v-model="newIndustry"
              :rules="[rules.required]"
            ></v-text-field>
            <v-text-field
              class="mt-2"
              v-model="newLocation"
              clearable
              label="Campany Location"
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
            @click="isEditCompanyText = false"
          >
            Cancel
          </v-btn>
          <v-btn
            :disabled="!valid"
            small
            depressed
            color="primary"
            class="white--text mb-1"
          >
            Change
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
    <!--  -->
  </section>
</template>
<script>
import axios from "../../axios-http.js";
export default {
  props: ["userEro"],
  data() {
    return {
      newName: null,
      newLocation: null,
      newIndustry: null,
      valid: false,
      imageUrl: "http://127.0.0.1:8000/storage/profiles/",
      companyLogo: null,
      imageFile: null,
      isEditLogo: false,
      companyDataToEdit: {
        id: null,
      },
      isEditCompanyText: false,
      existingEmails: null,
      percentage: 0,
      manages: ["company", "alumni", "ero"],
      alert: false,
      dialog: false,
      keySearch: "",
      eros: null,
      validatedAlumnisStored: null,
      invitedAlumnisStored: null,
      alumnisToDisplay: null,
      numberOfalumni: 0,
      numberOferos: 0,
      manageSelected: "alumni",
      selectedRoleForInvite: "alumni",
      inviteEmailList: [],
      notChipEmail: null,
      numberOfalumniInvited: 0,
      statusSelected: "validated",
      alertMessage: "",
      companyList: [],
      rules: {
        required: (value) => !!value || "Required",
      },
    };
  },
  methods: {
    openLogoEditDialog(id, logo) {
      this.isEditLogo = true;
      this.companyDataToEdit.id = id;
      this.companyLogo = 'http://127.0.0.1:8000/storage/profiles/' + logo;
    },
    fileChange(e) {
      this.imageFile = e.target.files[0];
      this.companyLogo = URL.createObjectURL(this.imageFile);
    },
    changeLogo() {
      if (this.imageFile !== null) {
        let imageFile = new FormData();
        imageFile.append("logo", this.imageFile);
        imageFile.append("_method", "PUT");
        axios.post("companies/updateLogos/" + this.companyDataToEdit.id, imageFile).then((res) => {
          this.isEditLogo = false;
          for(let company of this.companyList) {
            if(company.id === this.companyDataToEdit.id) {
              company.logo = res.data.companyLogo;
            }
          }
        });
      }
      
    },
    submitEmail() {
      this.numberOfalumniInvited += this.inviteEmailList.length;
      for (let invitedEmail of this.inviteEmailList) {
        let data = {
          email: invitedEmail,
          role: this.selectedRoleForInvite,
        };
        axios.post("invite", data).then((res) => {
          this.inviteEmailList = [];
          this.invitedAlumnisStored.unshift(res.data.user);
        });
      }
      this.existingEmails = [...this.existingEmails, ...this.inviteEmailList];
      this.alert = true;
      this.alertMessage = this.numberOfalumniInvited + " people invited";
      this.dialog = false;
      setTimeout(() => {
        this.alert = false;
        this.numberOfalumniInvited = 0;
        this.alertMessage = "";
      }, 5000);
    },
    showInvited() {
      this.statusSelected = "invited";
    },
    showValidated() {
      this.statusSelected = "validated";
    },
    removeUser(id, role, status) {
      axios.delete("users/" + id).then(() => {
        if (role === "alumni") {
          this.alumnisToDisplay = this.alumnisToDisplay.filter(
            (alumni) => alumni.user_id !== id
          );
          if (status === "invited") {
            this.invitedAlumnisStored = this.invitedAlumnisStored.filter(
              (alumni) => alumni.user_id !== id
            );
          } else if (status === "validated") {
            this.validatedAlumnisStored = this.validatedAlumnisStored.filter(
              (alumni) => alumni.user_id !== id
            );
          }
        } else if (role === "ero") {
          this.eros = this.eros.filter((ero) => ero.id !== id);
        }
      });
    },
    checkEmail() {
      if (this.notChipEmail !== null) {
        let emails = this.notChipEmail.split(/[?:\s\n]+/);
        for (let email of emails) {
          let isExist = this.existingEmails.includes(email);
          const regExOfEmail = RegExp(/^[a-zA-Z0-9.!#$%&`*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/);
          if (isExist || email === "" || !email.match(regExOfEmail)) {
            emails = emails.filter((e) => e !== email);
          }
        }
        this.inviteEmailList = [...new Set([...this.inviteEmailList, ...emails])];
        this.notChipEmail = null;
      }
    },
  },
  watch: {
    inviteEmailList: function (emails) {
      if(emails.length > 0) {
        let email = emails[emails.length - 1];
        let isExist = this.existingEmails.includes(email);
        const regExOfEmail = RegExp(/^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/);
        if (isExist || email === "" || !email.match(regExOfEmail)) {
          this.inviteEmailList.pop();
          this.notChipEmail = email;
          this.checkEmail();
        }
      }
    },
    isEditCompanyText: function (val) {
      if (val) {
        this.newName = null;
        this.newIndustry = null;
        this.newLocation = null;
      }
    },
    // will manage existing email when we invite
    statusSelected: function (val) {
      if (val === "invited") {
        this.alumnisToDisplay = this.invitedAlumnisStored;
      } else {
        this.alumnisToDisplay = this.validatedAlumnisStored;
      }
    },
    dialog: function (val) {
      if (!val) {
        this.inviteEmailList = [];
        this.selectedRoleForInvite = "alumni";
      }
    },
    keySearch: function (val) {
      let alumnisStored = this.validatedAlumnisStored;
      if (this.statusSelected === "invited") {
        alumnisStored = this.invitedAlumnisStored;
      }
      if (val === "" || val === null) {
        this.alumnisToDisplay = alumnisStored;
      } else if (this.statusSelected === "validated") {
        this.alumnisToDisplay = alumnisStored.filter(
          (alumni) =>
            alumni.firstname.toLowerCase().includes(val.toLowerCase()) ||
            alumni.lastname.toLowerCase().includes(val.toLowerCase()) ||
            alumni.batch.toLowerCase().includes(val.toLowerCase()) ||
            alumni.major.toLowerCase().includes(val.toLowerCase()) ||
            alumni.gender.includes(val) ||
            alumni.email.toLowerCase().includes(val.toLowerCase())
        );
      } else if (this.statusSelected === "invited") {
        this.alumnisToDisplay = alumnisStored.filter((alumni) =>
          alumni.email.toLowerCase().includes(val.toLowerCase())
        );
      }
    },
  },
  mounted() {
    axios.get("/users/email/all").then((res) => {
      this.existingEmails = res.data;
    });
    axios.get("/users/ero").then((res) => {
      this.eros = res.data;
      this.numberOferos = this.eros.length;
    });
    axios.get("/users/alumni").then((res) => {
      this.invitedAlumnisStored = res.data.filter(
        (alumni) => alumni.status === "invited"
      );
      this.validatedAlumnisStored = res.data.filter(
        (alumni) => alumni.status === "validated"
      );
      this.alumnisToDisplay = this.validatedAlumnisStored;
      this.percentage =
        (this.invitedAlumnisStored.length * 100) /
        (this.validatedAlumnisStored.length + this.invitedAlumnisStored.length);
    });
    this.removeUser();

    axios.get("/allcompanies").then((res) => {
      this.companyList = res.data;
    });
  },
};
</script>
<style scoped>
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
.companyLogo:hover .edit {
  display: block;
}
.companyLogo:hover .edit-text {
  display: block;
}
.edit {
  cursor: pointer;
  position: absolute;
  display: none;
  background-color: rgb(0, 0, 0); /* Fallback color */
  background-color: rgba(0, 0, 0, 0.7);
}
.edit-text {
  display: none;
  cursor: pointer;
}
.pointer {
  cursor: pointer;
}
.manageuser {
  width: 50%;
  margin: auto;
  background: none;
  color: white;
}
.name-card:hover {
  background: rgb(245, 245, 245);
}
.user.WEP {
  border-left: 4px solid #00a3ff;
}
.user.SNA {
  border-left: 4px solid #ff9800;
}
.user.invited {
  border-left: 4px solid #00a3ff;
}
.user.validated {
  border-left: 4px solid #ff9800;
}
.ero.invited {
  color: #00a3ff;
}
.ero.validated {
  color: #ff9800;
}
.major.WEP {
  color: #00a3ff;
}
.major.SNA {
  color: #ff9800;
}
.border-left {
  border-left: 4px solid #ff5858;
}
@media (max-width: 960px) {
  .manageuser {
    width: 90%;
  }
}
</style>
