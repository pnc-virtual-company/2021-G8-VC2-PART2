<template>
  <section class="mageuser">
    <v-flex class="d-flex justify-end mt-5">
      <v-dialog v-model="dialog" max-width="500px">
        <template v-slot:activator="{ on, attrs }">
          <v-btn depressed color="primary invite-btn" v-bind="attrs" v-on="on"> Invite </v-btn>
        </template>
        <v-card>
          <v-card-title>
            <span class="text-h5">Invite People</span>
          </v-card-title>
          <v-card-text>
              <v-row class="pa-0">
                <v-col cols="12 mt-0">
                  <v-select :items="roles" v-model="selectedRole" label="Select role" solo></v-select>
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
            <v-btn color="blue darken-1" text @click="submit(emailToInvite, selectedRole)">
              Submit
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
    </v-flex>
    <div class="mt-5">
      <v-data-table
        dense
        :headers="headers"
        :items="desserts"
        item-key="name"
        class="elevation-1"
      >
      </v-data-table>
    </div>
  </section>
</template>
<script>
import axios from "../../axios-http.js";
export default {
  data: () => ({
    dialog: false,
    roles: ['ero', 'alumni'],
    selectedRole: null,
    emailToInvite: null,
    desserts: [
      {
        firstname: "Lyheang",
        lastname: "Chhem",
        batch: 2021,
        major: "WEB",
        remove: "remove",
      },
      {
        firstname: "Lyheang",
        lastname: "Chhem",
        batch: 2021,
        major: "WEB",
        remove: "remove",
      },
      {
        firstname: "Lyheang",
        lastname: "Chhem",
        batch: 2021,
        major: "WEB",
        remove: "remove",
      },
      {
        firstname: "Lyheang",
        lastname: "Chhem",
        batch: 2021,
        major: "WEB",
        remove: "remove",
      },
      {
        firstname: "Lyheang",
        lastname: "Chhem",
        batch: 2021,
        major: "WEB",
        remove: "remove",
      },
    ],
    headers: [
      { text: "First Name", value: "firstname" },
      { text: "Last Name", value: "lastname" },
      { text: "Batch", value: "batch" },
      { text: "Major", value: "major" },
      { text: "Action", value: "remove" },
    ],
  }),
  watch: {
    dialog: function (val) {
      if (val) {
        this.selectedRole = null;
        this.emailToInvite = null;
      }
    },
  },
  methods: {
    submit(emailToInvite, selectedRole) {
      this.dialog = false;
      let data = {
        email: emailToInvite,
        role: selectedRole
      }
      axios.post('invite', data);
    }
  },
};
</script>
<style scoped>
.mageuser {
  width: 70%;
  margin: auto;
}
</style>
