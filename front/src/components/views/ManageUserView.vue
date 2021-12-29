<template>
  <section class="mageuser">
    <v-flex class="d-flex justify-end mt-5">
      <v-dialog v-model="dialog" max-width="500px">
        <template v-slot:activator="{ on, attrs }">
          <v-btn depressed color="primary invite-btn" v-bind="attrs" v-on="on">
            Invite
          </v-btn>
        </template>
        <v-card>
          <v-card-title>
            <span class="text-h5">Invite People</span>
          </v-card-title>
          <v-divider></v-divider>
          <v-card-text>
            <v-row class="pa-0">
              <v-col cols="12 mt-0">
                <v-select
                  class="mt-5"
                  prepend-inner-icon="mdi-account-box-outline"
                  :items="roles"
                  v-model="selectedRole"
                  label="Select role"
                  :rules="[rules.required]"
                ></v-select>
                <v-combobox
                  class="mt-3"
                  prepend-inner-icon="mdi-email"
                  label="Email"
                  v-model="emailToInvite"
                  small-chips
                  multiple
                  clearable
                  :rules="[rules.required]"
                ></v-combobox>
              </v-col>
            </v-row>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn
              class="mb-3"
              color="blue darken-1"
              text
              @click="dialog = false"
            >
              Close
            </v-btn>
            <v-btn
              class="mb-3"
              color="primary"
              @click="submitEmail(inviteEmailList, selectedRole)"
            >
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
    roles: ["ero", "alumni"],
    selectedRole: null,
    emailToInvite: null,
    inviteEmailList: [],
    rules: {
      required: (value) => !!value || "Required",
    },
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
    submitEmail() {
      this.inviteEmailList.push(this.emailToInvite);
      this.dialog = false;
      for (let invitedEmail of this.inviteEmailList) {
        for (let email of invitedEmail) {
          let role = this.selectedRole;
          let data = {
            email: email,
            role: role,
          };
          axios.post("invite", data);
        }
      }
    },
  },
};
</script>
<style scoped>
.mageuser {
  width: 70%;
  margin: auto;
}
</style>
