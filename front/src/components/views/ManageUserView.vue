<template>
  <section class="manageuser">
    <v-row class="mt-5">
      <v-col cols="8">
        <v-text-field
         v-model="search"
          prepend-inner-icon="mdi-magnify"
          placeholder="Search"
          label="Search"
          hide-details
          clearable
          single-line
          solo
        ></v-text-field>
      </v-col>
      <v-col cols="2">
        <div class="filter">
          <v-select label="Role" dense solo :items="roles"></v-select>
        </div>
      </v-col>
      <v-col cols="2">
        <v-flex class="d-flex justify-end">
          <v-dialog v-model="dialog" max-width="500px">
            <template v-slot:activator="{ on, attrs }">
              <v-btn
                class="white--text"
                depressed
                color="blue invite-btn"
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
    <v-card class="card_contain mt-5">
      <v-card flat class="name-card pa-3" v-for="user in searchFilter" :key="user.id" :search="search">
        <v-layout row wrap :class="`pa-2 user ${user.major}`">
          <v-flex xs6 md2 sm4>
            <div class="caption grey--text">First name</div>
            <div>{{ user.firstname }}</div>
          </v-flex>
          <v-flex xs6 md3 sm4>
            <div class="caption grey--text">Last name</div>
            <div>{{ user.lastname }}</div>
          </v-flex>
          <v-flex xs6 md2 sm4>
            <div class="caption grey--text">Gender</div>
            <div>{{ user.gender }}</div>
          </v-flex>
          <v-flex xs6 md2 sm4>
            <div class="caption grey--text">Batch</div>
            <div>{{ user.batch }}</div>
          </v-flex>
          <v-flex xs6 md2 sm4>
            <div class="caption grey--text">Major</div>
            <div :class="`major ${user.major}`">{{ user.major }}</div>
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
export default {
  data() {
    return {
      roles: ["ERO", "Alumni"],
      dialog: false,
      search: '',
      users: [
        {
          id: 1,
          firstname: "Lyheang",
          lastname: "Chhem",
          batch: "2018",
          major: "WEB",
          roles: "ERO",
          gender: "Male",
        },
        {
          id: 2,
          firstname: "Thon",
          lastname: "Theng",
          batch: "2021",
          major: "SNA",
          remove: "remove",
          gender: "Female",
        },
        {
          id: 3,
          firstname: "Kunthy",
          lastname: "Sen",
          batch: "2020",
          major: "SNA",
          gender: "Male",
        },
        {
          id: 4,
          firstname: "Sreyngit",
          lastname: "Doeurm",
          batch: "2019",
          major: "WEB",
          gender: "Female",
        },
        {
          id: 5,
          firstname: "Lyhuoy",
          lastname: "In",
          batch: "2023",
          major: "SNA",
          gender: "Male",
        },
      ],
    };
  },
  computed: {
    searchFilter(){
      return this.users.filter((user)=>{
        return user.firstname.toLowerCase().match(this.search.toLowerCase()) 
        || user.lastname.match(this.search) || user.batch.match(this.search) 
        || user.gender.match(this.search) || user.major.toLowerCase().match(this.search.toLowerCase());
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
};
</script>
<style scoped>
.manageuser {
  width: 60%;
  margin: auto;
  background: none;
  color: white;
}
.name-card:hover {
  background: rgb(245, 245, 245);
}
.user.WEB {
  border-left: 4px solid #00a3ff;
}
.user.SNA {
  border-left: 4px solid #FF9800;
}
.major.WEB {
  color: #00a3ff;
}
.major.SNA {
  color: #FF9800;
}
</style>
