<template>
  <section>
    <v-card class="ma-0 pa-2 elevation-0 rounded-lg emp-card">
      <!-- confirm delete -->
        <v-dialog
          v-model="dialog"
          :max-width="options.width"
          :style="{ zIndex: options.zIndex }"
        >
          <v-card>
            <v-card-title class="mx-auto text--h6"
              >Are you sure want to delete this record?</v-card-title
            >
            <v-divider></v-divider>

            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="grey--text" small text @click="dialog = false">
                Cancel
              </v-btn>
              <v-btn color="red" small text @click="dialog = false"> Ok </v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
        <!-- end confirm dialog -->
      
        <div class="text-center">
          <v-dialog v-model="editDialog" width="500">
            <!-- Dialog create new employment -->
            <v-card>
              <v-card-title>Edit Employment</v-card-title>
              <v-divider></v-divider>
              <v-card-text>
                <v-col md="12" sm="12" v-if="!showAddCompanyForm">
                  <v-combobox
                    prepend-inner-icon="mdi-clipboard-account"
                    v-model="position"
                    :items="items1"
                    :search-input.sync="search1"
                    hide-selected
                    label="Work Position"
                    persistent-hint
                    small-chips
                    :rules="[rules.required]"
                  >
                    <template v-slot:no-data>
                      <v-list-item>
                        <v-list-item-content>
                          <v-list-item-title>
                            No Position matching"
                            <strong>{{ search1 }}</strong
                            >". Press <kbd>enter</kbd> to create
                          </v-list-item-title>
                        </v-list-item-content>
                      </v-list-item>
                    </template>
                  </v-combobox>
                  <!--  -->
                  <v-combobox
                    v-model="company"
                    :items="items2"
                    :search-input.sync="search2"
                    hide-selected
                    label="Company"
                    persistent-hint
                    small-chips
                    prepend-inner-icon="mdi-domain"
                    :rules="[rules.required]"
                  >
                    <template v-slot:no-data>
                      <v-list-item @click="createCompa">
                        <v-list-item-content>
                          <v-list-item-title>
                            <strong> ( {{ search2 }} )</strong
                            > Create
                            <v-icon class="createCompany"
                              >mdi-new-box</v-icon
                            >
                          </v-list-item-title>
                        </v-list-item-content>
                      </v-list-item>
                    </template>
                  </v-combobox>
                  <!-- date picker -->
                  <v-row class="mt-2">
                    <v-spacer></v-spacer>
                    <v-col cols="12" sm="12" md="6">
                      <v-dialog
                        ref="dialog"
                        v-model="modal"
                        :return-value.sync="date1"
                        persistent
                        width="290px"
                      >
                        <template v-slot:activator="{ on, attrs }">
                          <v-text-field
                            v-model="date1"
                            label="Picker in dialog"
                            prepend-inner-icon="mdi-calendar"
                            readonly
                            v-bind="attrs"
                            v-on="on"
                          ></v-text-field>
                        </template>
                        <v-date-picker v-model="date1" scrollable>
                          <v-spacer></v-spacer>
                          <v-btn text color="primary" @click="modal = false"
                            >Cancel</v-btn
                          >
                          <v-btn
                            text
                            color="primary"
                            @click="$refs.dialog.save(date)"
                            >OK</v-btn
                          >
                        </v-date-picker>
                      </v-dialog>
                    </v-col>
                    <v-col cols="12" sm="12" md="6">
                      <v-dialog
                        ref="dialog"
                        v-model="modal"
                        :return-value.sync="date2"
                        persistent
                        width="290px"
                      >
                        <template v-slot:activator="{ on, attrs }">
                          <v-text-field
                            v-model="date2"
                            label="Picker in dialog"
                            prepend-inner-icon="mdi-calendar"
                            readonly
                            v-bind="attrs"
                            v-on="on"
                          ></v-text-field>
                        </template>
                        <v-date-picker v-model="date2" scrollable>
                          <v-spacer></v-spacer>
                          <v-btn text color="primary" @click="modal = false"
                            >Cancel</v-btn
                          >
                          <v-btn
                            text
                            color="primary"
                            @click="$refs.dialog.save(date)"
                            >OK</v-btn
                          >
                        </v-date-picker>
                      </v-dialog>
                    </v-col>
                    <v-spacer></v-spacer>
                  </v-row>
                  <!--  end date picker -->
                </v-col>
              </v-card-text>
              <!-- end dialog create new company -->
              <!-- if no company matching -->
              <v-card-text>
                <v-col md="12" sm="12" v-if="showAddCompanyForm">
                  <v-row justify="center">
                    <div class="image-upload">
                      <label for="file-input">
                        <v-avatar size="90">
                          <v-img class="companyImage" :src="companyPic"></v-img>
                        </v-avatar>
                      </label>

                      <input id="file-input" type="file" @change="fileChange" />
                    </div>
                  </v-row>
                  <v-text-field
                    prepend-inner-icon="mdi-domain"
                    hide-selected
                    label="Company"
                    persistent-hint
                    :rules="[rules.required]"
                  ></v-text-field>
                  <v-text-field
                    :items="items2"
                    hide-selected
                    label="Address"
                    persistent-hint
                    prepend-inner-icon="mdi-google-maps"
                    :rules="[rules.required]"
                  ></v-text-field>
                  <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn
                      small
                      depressed
                      color="primary"
                      text
                      @click="showAddCompanyForm = false"
                      >Cancel</v-btn
                    >
                    <v-btn
                      small
                      depressed
                      color="blue"
                      class="white--text"
                      @click="showAddCompanyForm = false"
                      >Add</v-btn
                    >
                  </v-card-actions>
                </v-col>
              </v-card-text>
              <v-card-actions v-if="!showAddCompanyForm">
                <v-spacer></v-spacer>
                <v-btn
                  class="mb-3"
                  small
                  depressed
                  color="primary"
                  text
                  @click="editDialog = false"
                  >Cancel</v-btn
                >
                <v-btn
                  small
                  depressed
                  color="blue"
                  class="white--text mb-3"
                  @click="editDialog = false"
                  >Change</v-btn
                >
              </v-card-actions>
            </v-card>
            <!-- end tag if no company matching -->
          </v-dialog>
          <!--  -->
        </div>
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
              <v-flex class="d-flex">
                <v-list-item-title>Position</v-list-item-title>
                <v-menu bottom left>
                  <template v-slot:activator="{ on, attrs }">
                    <v-btn icon v-bind="attrs" v-on="on">
                      <v-icon>mdi-dots-vertical</v-icon>
                    </v-btn>
                  </template>

                  <v-list>
                    <v-list-item>
                      <div>
                        <small
                          class="options1"
                          @click="editDialog = true"
                        >
                        <v-icon color="primary">mdi-pencil-circle</v-icon>
                          EDIT
                        </small>
                        <br />
                        <v-divider></v-divider>
                        <small
                          class="options2"
                          color="red"
                          @click="dialog = true"

                        >
                        <v-icon color="red">mdi-delete-circle</v-icon>
                          DELETE
                        </small>
                      </div>
                    </v-list-item>
                  </v-list>
                </v-menu>
              </v-flex>

              <small>Company</small>
              <br />
              <small>Job-StartDate -> Job-EndDate Location</small>
            </v-list-item-title>
          </v-list-item>
        </v-col>
      </v-row>
      <v-divider class="mt-2"></v-divider>
    </v-card>
  </section>
</template>

<script>
export default {
  data: () => ({
    showAddCompanyForm: false,
    editDialog: false,
    dialog: false,
    menu: true,
    modal: false,
    menu2: false,
    items1: ["Gaming", "Programming", "Vue", "Vuetify"],
    items2: ["Gaming", "Programming", "Vue", "Vuetify"],
    position: null,
    company: null,
    search1: null,
    search2: null,
    date1: new Date(Date.now() - new Date().getTimezoneOffset() * 60000)
        .toISOString()
        .substr(0, 10),
      date2: new Date(Date.now() - new Date().getTimezoneOffset() * 60000)
        .toISOString()
        .substr(0, 10),
    companyPic:
      "https://www.passerellesnumeriques.org/wp-content/uploads/2016/03/pn-logo.png",
    rules: {
      required: (value) => !!value || "Required",
    },
    options: {
      color: "grey lighten-3",
      width: 400,
      zIndex: 200,
      noconfirm: false,
    },
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
  watch: {
    model(val) {
      if (val.length > 5) {
        this.$nextTick(() => this.model.pop());
      }
    },
  },
  methods: {
    createCompa() {
      this.showAddCompanyForm = true;
    },
    fileChange(e) {
      let file = e.target.files[0];
      this.companyPic = URL.createObjectURL(file);
    },
  },
};
</script>

<style scoped>
.v-dialog > .v-card > .v-card__title {
  font-size: 17px;
  font-weight: 200;
  letter-spacing: 0.0125em;
  padding: 16px 24px 10px;
}
.option {
  display: flex;
  justify-content: end;
}
.emp-card:hover {
  background: #f5f4f3;
}
.options1, .options2 {
  cursor: pointer;
}
.options1:hover {
  color: #00A3FF;
}
.options2:hover {
  color: red;
}
.companyImage {
  width: 100px;
  cursor: pointer;
  border-radius: 50%;
}
.image-upload > input {
  display: none;
}
.createCompany {
  cursor: pointer;
}
</style>
