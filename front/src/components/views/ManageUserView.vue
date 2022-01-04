<template>
  <section class="manageuser">
    <v-row class="mt-5">
      <v-col cols="12">
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
        <v-text-field
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
    <v-row>
      <v-col cols="5">
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
          <div class="pointer"
            @click="showInvited"
          >
            <v-icon color="grey darken-2">mdi-checkbox-blank</v-icon>
            Invited {{ invitedAlumnisStored.length }}
          </div><br>
          <div class="pointer"
            @click="showValidated"
          >
            <v-icon color="grey lighten-2">mdi-checkbox-blank</v-icon>
            Validated {{ validatedAlumnisStored.length }}
          </div>
        </div>
        </v-card>
      </v-col>
      <v-col cols="2"></v-col>
      <v-col cols="3">
        <v-select
          label="Role"
          dense
          solo
          :items="roles"
          v-model="selectedRole"
        ></v-select>
      </v-col>
      <v-col cols="2">
        <v-flex class="d-flex justify-end">
          <v-dialog v-model="dialog" max-width="500px">
            <template v-slot:activator="{ on, attrs }">
              <v-btn
                class="white--text"
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
                      :items="roles"
                      v-model="selectedRoleForInvite"
                      label="Select role"
                      :rules="[rules.required]"
                    ></v-select>
                    <v-combobox
                      class="mt-3"
                      type="email"
                      prepend-inner-icon="mdi-email"
                      label="Email"
                      v-model="inviteEmailList"
                      :search-input.sync="notChipEmail"
                      small-chips
                      multiple
                      clearable
                      :rules="[rules.required]"
                    ></v-combobox>
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
    <v-card class="card_contain mt-5 mb-5" v-if="selectedRole === 'alumni'">
      <v-card class="pa-10 text-center" v-if="alumnisToDisplay.length === 0">No People Found</v-card>
      <v-card
        flat
        class="name-card pa-3"
        v-for="user in alumnisToDisplay"
        :key="user.id"
      >
        <v-layout
          row
          wrap
          class="border-left"
          :class="`pa-2 user ${user.major}`"
        >
          <v-flex xs6 md3 sm4>
            <div class="caption grey--text mb-1">Name</div>
            <div>{{ user.status == 'invited' ? 'Empty' : user.firstname + ' ' + user.lastname}}</div>
          </v-flex>
          <v-flex xs6 md4 sm4>
            <div class="caption grey--text mb-1">Email</div>
            <div>{{ user.email }}</div>
          </v-flex>
          <v-flex xs6 md2 sm4>
            <div class="caption grey--text mb-1">Gender</div>
            <div>{{ user.status == 'invited' ? 'Empty' : user.gender }}</div>
          </v-flex>
          <v-flex xs6 md2 sm4>
            <div class="caption grey--text mb-1">Major</div>
            <div :class="`major ${user.major}`">{{ user.status == 'invited' ? 'Empty' : user.major + " " +  user.batch}}</div>
          </v-flex>
          <v-flex xs6 md1 sm4>
            <div class="caption grey--text mb-1">Action</div>
            <v-icon>mdi-delete</v-icon>
          </v-flex>
        </v-layout>
      </v-card>
    </v-card>
    <v-card class="card_contain mt-5" v-if="selectedRole === 'ero'">
      <v-card
        flat
        class="name-card pa-3"
        v-for="user in eros"
        :key="user.id"
      >
        <v-layout row wrap :class="`pa-2 user ${user.status}`">
          <v-flex xs6 md1 sm2>
            <div class="caption grey--text">ID</div>
            <div>{{ user.id }}</div>
          </v-flex>
          <v-flex xs6 md3 sm4>
            <div class="caption grey--text">Name</div>
            <div>{{ user.status == 'invited' ? 'Empty' : user.firstname + " "  + user.lastname }}</div>
          </v-flex>
          <v-flex xs6 md4 sm4>
            <div class="caption grey--text">Email</div>
            <div>{{ user.email }}</div>
          </v-flex>
          <v-flex xs6 md3 sm4>
            <div class="caption grey--text">Status</div>
            <div :class="`ero ${user.status}`">{{ user.status }}</div>
          </v-flex>
          <v-flex xs6 md1 sm4>
            <div class="caption grey--text">Action</div>
            <v-icon>mdi-delete</v-icon>
          </v-flex>
        </v-layout>
      </v-card>
    </v-card>
  </section>
</template>
<script>
import axios from "../../axios-http.js";
export default {
  props: ["userEro"],
  data() {
    return {
      existingEmails: null,
      percentage: 0,
      roles: ["ero", "alumni"],
      alert: false,
      dialog: false,
      keySearch: "",
      eros: null,
      validatedAlumnisStored: null,
      invitedAlumnisStored: null,
      alumnisToDisplay: null,
      numberOfalumni: 0,
      numberOferos: 0,
      selectedRole: "alumni",
      selectedRoleForInvite: "alumni",
      inviteEmailList: [],
      notChipEmail: null,
      numberOfalumniInvited: 0,
      statusSelected: 'validated',
      alertMessage: '',
      rules: {
        required: (value) => !!value || "Required",
      },
    };
  },
  methods: {
    submitEmail() {
      if(this.notChipEmail !== null && !this.inviteEmailList.includes(this.notChipEmail)) {
        this.inviteEmailList.push(this.notChipEmail);
      }
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
      this.alert = true;
      this.alertMessage = this.numberOfalumniInvited + " people invited";
      this.dialog = false;
      setTimeout(() => {
        this.alert = false;
        this.numberOfalumniInvited = 0;
        this.alertMessage = '';
      }, 5000);
    },
    showInvited() {
      this.statusSelected = 'invited';
    },
    showValidated() {
      this.statusSelected = 'validated';
    },
  },
  watch: {
    // will manage existing email when we invite
    statusSelected: function(val) {
      if(val === 'invited') {
        this.alumnisToDisplay = this.invitedAlumnisStored;
      } else {
        this.alumnisToDisplay = this.validatedAlumnisStored;
      }
    },
    dialog: function(val) {
      if (!val) {
        this.inviteEmailList = [];
        this.selectedRoleForInvite = "alumni";
      }
    },
    keySearch: function(val) {
      let alumnisStored = this.validatedAlumnisStored;
      if(this.statusSelected === 'invited') {
        alumnisStored = this.invitedAlumnisStored;
      }
      if(val === '') {
        this.alumnisToDisplay = alumnisStored;
      } else if(this.statusSelected === 'validated') {
        this.alumnisToDisplay = alumnisStored.filter(alumni => 
          alumni.firstname.toLowerCase().includes(val.toLowerCase()) ||
          alumni.lastname.toLowerCase().includes(val.toLowerCase()) ||
          alumni.batch.toLowerCase().includes(val.toLowerCase()) ||
          alumni.major.toLowerCase().includes(val.toLowerCase()) ||
          alumni.gender.includes(val) ||
          alumni.email.toLowerCase().includes(val.toLowerCase())
        )
      } else if(this.statusSelected === 'invited') {
        this.alumnisToDisplay = alumnisStored.filter(alumni => 
          alumni.email.toLowerCase().includes(val.toLowerCase())
        )
      }
    }
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
      this.invitedAlumnisStored = res.data.filter(alumni => alumni.status === 'invited');
      this.validatedAlumnisStored = res.data.filter(alumni => alumni.status === 'validated');
      this.alumnisToDisplay = this.validatedAlumnisStored;
      this.percentage = (this.invitedAlumnisStored.length * 100)/(this.validatedAlumnisStored.length + this.invitedAlumnisStored.length);
    });
  },
};
</script>
<style scoped>
.pointer{
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
</style>
