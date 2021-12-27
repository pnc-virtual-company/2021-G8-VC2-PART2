<template>
  <section>
    <v-card class="ma-0 pa-2 elevation-0 rounded-lg">
      <v-row>
        <v-col>
          <v-list-item class="ma-0 pa-0">
            <v-avatar class="mr-3" size="50px">
              <img
                src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Circle-icons-profile.svg/1024px-Circle-icons-profile.svg.png"
                alt=""
              />
            </v-avatar>
            <v-list-item-title>
              <v-list-item-title>Position</v-list-item-title>
              <small>Company</small>
              <br />
              <small>Job-StartDate -> Job-EndDate Location</small>
            </v-list-item-title>
          </v-list-item>
        </v-col>
        <!-- <v-col cols-4 class="option mt-0">
          <v-dialog v-model="dialog" persistent max-width="600px">
            <template v-slot:activator="{}">
            <div class="mr-2">
              <v-icon size="20px">mdi-dots-horizontal</v-icon>
            </div>
            </template>
            <v-card>
              <v-card-title>
                <span class="text-h5">User Profile</span>
              </v-card-title>
              <v-card-text>
                  <v-row>
                    <v-col cols="12" sm="6" md="4">
                      <v-text-field
                        label="Legal first name*"
                        required
                      ></v-text-field>
                    </v-col>
                    <v-col cols="12" sm="6" md="4">
                      <v-text-field
                        label="Legal middle name"
                        hint="example of helper text only on focus"
                      ></v-text-field>
                    </v-col>
                    <v-col cols="12" sm="6" md="4">
                      <v-text-field
                        label="Legal last name*"
                        hint="example of persistent helper text"
                        persistent-hint
                        required
                      ></v-text-field>
                    </v-col>
                    <v-col cols="12">
                      <v-text-field label="Email*" required></v-text-field>
                    </v-col>
                    <v-col cols="12">
                      <v-text-field
                        label="Password*"
                        type="password"
                        required
                      ></v-text-field>
                    </v-col>
                    <v-col cols="12" sm="6">
                      <v-select
                        :items="['0-17', '18-29', '30-54', '54+']"
                        label="Age*"
                        required
                      ></v-select>
                    </v-col>
                    <v-col cols="12" sm="6">
                      <v-autocomplete
                        :items="[
                          'Skiing',
                          'Ice hockey',
                          'Soccer',
                          'Basketball',
                          'Hockey',
                          'Reading',
                          'Writing',
                          'Coding',
                          'Basejump',
                        ]"
                        label="Interests"
                        multiple
                      ></v-autocomplete>
                    </v-col>
                  </v-row>
                <small>*indicates required field</small>
              </v-card-text>
              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn color="blue darken-1" text @click="dialog = false">
                  Close
                </v-btn>
                <v-btn color="blue darken-1" text @click="dialog = false">
                  Save
                </v-btn>
              </v-card-actions>
            </v-card>
          </v-dialog>
        </v-col> -->
      </v-row>
      <v-divider class="mt-2"></v-divider>
    </v-card>
  </section>
</template>

<script>
export default {
  data: () => ({
    dialog: false,
    messages: [
      {
        avatar: "https://avatars0.githubusercontent.com/u/9064066?v=4&s=460",
        name: "John Leider",
      },
      {
        avatar: "mdi-account-multiple",
        name: "Social",
      },
      {
        avatar: "mdi-tag",
        name: "Promos",
      },
    ],
  }),
};
</script>

<style scoped>
.option {
  display: flex;
  justify-content: end;
}
.v-card:hover {
  background: #f5f4f3;
}
</style>