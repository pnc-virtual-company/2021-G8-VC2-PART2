<template>
  <section class="manageuser">
    <v-row class="mt-5">
      <v-col cols="12">
        <v-text-field
         v-model="search"
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
      <v-col cols="2">
        <v-card class="card-alumni text-center" width="100px">
          <v-icon color="blue" class="mt-3">mdi-account-check</v-icon>
          <p v-if="selectedRole === 'Alumni'">Alumni</p>
          <p v-if="selectedRole === 'ERO'">ERO</p>
          <p class="numOfAlumni" v-if="selectedRole === 'Alumni'">{{numberOfalumni}}</p>
          <p class="numOfAlumni" v-if="selectedRole === 'ERO'">{{numberOferos}}</p>
        </v-card>
      </v-col>
      <v-col cols="6">
        <v-card class="card-alumni text-center" width="100px">
          <v-icon color="blue" class="mt-3">mdi-account-plus</v-icon>
          <p>Invited</p>
          <p class="numOfAlumni" v-if="selectedRole === 'Alumni'">{{numberOfalumniNotValidated}}</p>
          <p class="numOfAlumni" v-if="selectedRole === 'ERO'">{{numberOferoNotValidated}}</p>
        </v-card>
      </v-col>
      <v-col cols="2">
        <v-flex class="d-flex justify-end">
          <v-select label="Role" dense solo :items="roles" v-model="selectedRole"></v-select>
        </v-flex>
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
                      :items="roles"
                      v-model="selectedRole"
                      label="Select role"
                      solo
                    ></v-select>
                    <v-text-field
                      prepend-inner-icon="mdi-email"
                      label="Email"
                      v-model="emailToInvite"
                      required
                    ></v-text-field>
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
                  @click="submit(emailToInvite, selectedRole)"
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
    <v-card class="card_contain mt-5 mb-5" v-if="selectedRole === 'Alumni'">
      <v-card flat class="name-card pa-3" v-for="user in alumnis" :key="user.id" :search="search">
        <v-layout row wrap class="border-left" :class="`pa-2 user ${user.major}`">
          <v-flex xs6 md2 sm4>
            <div class="caption grey--text">Name</div>
            <div v-if="user.status == 'invited'">Empty</div>
            <div v-else>{{ user.firstname }}{{" "}}{{ user.lastname }}</div>
          </v-flex>
          <v-flex xs6 md5 sm4>
            <div class="caption grey--text">Email</div>
            <div>{{ user.email }}</div>
          </v-flex>
          <v-flex xs6 md2 sm4>
            <div class="caption grey--text">Gender</div>
            <div v-if="user.status == 'invited'">Empty</div>
            <div v-else>{{ user.gender }}</div>
          </v-flex>
          <v-flex xs6 md2 sm4>
            <div class="caption grey--text">Major</div>
            <div v-if="user.status == 'invited'">Empty</div>
            <div :class="`major ${user.major}`" v-else>{{ user.major }}{{" "}}{{ user.batch }}</div>
          </v-flex>
          <v-flex xs6 md1 sm4>
            <div class="caption grey--text">Action</div>
            <v-icon>mdi-delete</v-icon>
          </v-flex>
        </v-layout>
      </v-card>
    </v-card>
    <v-card class="card_contain mt-5" v-if="selectedRole === 'ERO'">
      <v-card flat class="name-card pa-3" v-for="user in eros" :key="user.id" :search="search">
        <v-layout row wrap :class="`pa-2 user ${user.status}`">
          <v-flex xs6 md1 sm2>
            <div class="caption grey--text">ID</div>
            <div>{{ user.id }}</div>
          </v-flex>
          <v-flex xs6 md2 sm4>
            <div class="caption grey--text">Name</div>
            <div v-if="user.status == 'invited'">Empty</div>
            <div v-else>{{ user.firstname }}{{" "}}{{ user.lastname }}</div>
          </v-flex>
          <v-flex xs6 md6 sm4>
            <div class="caption grey--text">Email</div>
            <div>{{ user.email }}</div>
          </v-flex>
          <v-flex xs6 md2 sm4>
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
  data() {
    return {
      roles: ["ERO", "Alumni"],
      dialog: false,
      search: '',
      eros: null,
      alumnis: null,
      numberOfalumni: 0,
      numberOfalumniNotValidated: 0,
      numberOferoNotValidated: 0,
      numberOferos: 0,
      selectedRole: 'Alumni',
      newAlumniData: null
    };
  },
  computed: {
    searchAlumni(){
      return this.newAlumniData.filter((user)=>{
        return user.firstname.toLowerCase().match(this.search.toLowerCase());
      })
    }
  },
  methods: {
    submit(emailToInvite, selectedRole) {
      this.dialog = false;
      let data = {
        email: emailToInvite,
        role: selectedRole
      }
      this.$emit('invite', data);
    }
  },
  mounted() {
    axios.get('/users/ero')
    .then(res => {
      this.eros = res.data;
      this.numberOferos = this.eros.length;
      this.numberOferoNotValidated = this.eros.filter(user => user.status == "invited").length;
    })
    axios.get('/users/alumni')
    .then(res => {
      this.alumnis = res.data;
      this.numberOfalumni = this.alumnis.length;
      this.newAlumniData = this.alumnis;
      this.numberOfalumniNotValidated = this.alumnis.filter(user => user.status == "invited").length;
    })
  },
};
</script>
<style scoped>
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
  border-left: 4px solid #FF9800;
}
.user.invited {
  border-left: 4px solid #00a3ff;
}
.user.validated {
  border-left: 4px solid #FF9800;
}
.ero.invited {
  color: #00a3ff;
}
.ero.validated {
  color: #FF9800;
}
.major.WEP {
  color: #00a3ff;
}
.major.SNA {
  color: #FF9800;
}
.border-left {
  border-left: 4px solid #ff5858;
}
</style>
