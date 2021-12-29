<template>
  <v-card class="mt-5 mb-4 pa-4 rounded-lg">
    <v-row class="mb-1">
      <v-col cols="8" sm="3" md="5">
        <h3>Employment</h3>
      </v-col>
      <v-col class="add-info">
        <div class="text-center">
          <v-dialog v-model="dialog" persistent width="500">
            <template v-slot:activator="{ on, attrs }">
              <v-btn color="white" fab x-small dark elevation="1" v-bind="attrs" v-on="on">
                <v-icon color="black">mdi-plus</v-icon>
              </v-btn>
            </template>
            <!-- Dialog create new employment -->
            <v-card>
              <v-card-text v-if="!showAddCompanyForm">
                <v-card-title>Add Employment</v-card-title>
                <v-divider></v-divider>
                <v-col md="12" sm="12" >
                  <v-combobox
                    prepend-inner-icon="mdi-clipboard-account"
                    v-model="position"
                    :items="items1"
                    :search-input.sync="search1"
                    hide-selected
                    label="Work Position"
                    persistent-hint
                    :rules="[rules.required]"
                  >
                    <template v-slot:no-data>
                      <v-list-item>
                        <v-list-item-content>
                          <v-list-item-title>
                            <strong>({{ search1 }}) </strong>
                            <kbd>enter</kbd> to create
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
                  <v-row>
                    <v-col cols="12" sm="12" md="6">
                      <v-dialog
                        ref="dialog1"
                        v-model="modal1"
                        :return-value.sync="date1"
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
                        <v-date-picker v-model="date" scrollable>
                          <v-spacer></v-spacer>
                          <v-btn text color="primary" @click="modal1 = false">Cancel</v-btn>
                          <v-btn text color="primary" @click="$refs.dialog1.save(date)">OK</v-btn>
                        </v-date-picker>
                      </v-dialog>
                    </v-col>
                    <v-col cols="12" sm="12" md="6">
                      <v-dialog
                        ref="dialog2"
                        v-model="modal"
                        :return-value.sync="date2"
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
                        <v-date-picker v-model="date" scrollable>
                          <v-spacer></v-spacer>
                          <v-btn text color="primary" @click="modal2 = false">Cancel</v-btn>
                          <v-btn text color="primary" @click="$refs.dialog2.save(date)">OK</v-btn>
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
              <v-card-text v-if="showAddCompanyForm">
                <v-card-title>Add Company</v-card-title>
                <v-divider></v-divider>
                <v-col md="12" sm="12" class="mt-2">
                  <v-row justify="center">
                    <div class="image-upload">
                      <label for="file-input">
                        <v-avatar size="90">
                          <v-img class="companyImage" :src="companyPic"></v-img>
                        </v-avatar>
                        <v-btn
                          color="white"
                          fab
                          height="30"
                          width="30"
                          dark
                          elevation="1"
                          class="camera"
                          for="file-input">
                          <v-icon color="black">mdi-camera</v-icon>
                        </v-btn>
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
                    class="ma-0"
                    :items="items2"
                    hide-selected
                    label="Address"
                    persistent-hint
                    prepend-inner-icon="mdi-google-maps"
                    :rules="[rules.required]"
                  ></v-text-field>
                  <v-select
                  class="mt-3"
                    :items="items"
                    label="Select doman"
                    solo
                  ></v-select>
                  <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn
                      small
                      depressed
                      color="primary"
                      text
                      @click="showAddCompanyForm = false"
                    >Cancel</v-btn>
                    <v-btn
                      small
                      depressed
                      color="blue"
                      class="white--text"
                      @click="showAddCompanyForm = false"
                    >Add</v-btn>
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
                  @click="dialog = false"
                >Cancel</v-btn>
                <v-btn
                  small
                  depressed
                  color="blue"
                  class="white--text mb-3"
                  @click="dialog = false"
                >Change</v-btn>
              </v-card-actions>
            </v-card>
            <!-- end tag if no company matching -->
          </v-dialog>
          <!--  -->
        </div>
      </v-col>
    </v-row>
    <employment-card></employment-card>
  </v-card>
</template>
<script>
import EmploymentCard from "./EmploymentCard.vue";

export default {
  components: {
    "employment-card": EmploymentCard,
  },
  data() {
    return {
      showAddCompanyForm: false,
      dialog: false,
      dialog1: false,
      dialog2: false,
      date: new Date(Date.now() - new Date().getTimezoneOffset() * 60000)
        .toISOString()
        .substr(0, 10),
      date1: new Date(Date.now() - new Date().getTimezoneOffset() * 60000)
        .toISOString()
        .substr(0, 10),
      date2: new Date(Date.now() - new Date().getTimezoneOffset() * 60000)
        .toISOString()
        .substr(0, 10),
      menu: true,
      modal: false,
      menu2: false,
      items1: ["Gaming", "Programming", "Vue", "Vuetify"],
      items2: ["Gaming", "Programming", "Vue", "Vuetify"],
      position: null,
      company: null,
      search1: null,
      search2: null,
      companyPic:
        "https://www.passerellesnumeriques.org/wp-content/uploads/2016/03/pn-logo.png",
      rules: {
        required: (value) => !!value || "Required",
      },
    };
  },
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
.add-info {
  display: flex;
  justify-content: flex-end;
}
.camera{
  position: absolute;
  top: 130px;
  left: 270px;
}
</style>