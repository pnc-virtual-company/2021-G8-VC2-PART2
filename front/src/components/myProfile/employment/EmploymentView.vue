<template>
  <v-card class="mt-5 mb-4 pa-4 rounded-lg">
    <v-row class="mb-1">
      <v-col cols="8" sm="3" md="5">
        <h3>Employment</h3>
      </v-col>
      <v-col class="add-info">
        <div class="text-center">
          <!-- Dialog create new employment -->
          <v-form ref="empForm" v-model="validEmploymentData" lazy-validation>
            <v-dialog v-model="dialog" persistent width="500">
              <template v-slot:activator="{ on, attrs }">
                <v-btn
                  color="white"
                  fab
                  x-small
                  dark
                  elevation="1"
                  v-bind="attrs"
                  v-on="on"
                >
                  <v-icon color="black">mdi-plus</v-icon>
                </v-btn>
              </template>
              <v-card>
                <v-card-text v-if="!showAddCompanyForm">
                  <v-card-title>{{ formMode }} Employment</v-card-title>
                  <v-divider></v-divider>
                  <v-col md="12" sm="12">
                    <v-combobox
                      prepend-inner-icon="mdi-clipboard-account"
                      v-model="employmentDataToAdd.position"
                      :items="dataToDisplay.positions"
                      :search-input.sync="positionSearch"
                      hide-selected
                      label="Work Position"
                      persistent-hint
                      :rules="[rules.required]"
                    >
                    </v-combobox>
                    <v-combobox
                      v-model="employmentDataToAdd.company"
                      :items="dataToDisplay.companies"
                      label="Company"
                      prepend-inner-icon="mdi-domain"
                      :rules="[rules.required]"
                      :search-input.sync="companyDataToAdd.name"
                    >
                      <template v-slot:selection="data">
                        <template
                          v-bind="data.attrs"
                          :input-value="data.selected"
                          close
                        >
                          {{ data.item.company_name }}
                        </template>
                      </template>
                      <template v-slot:item="data">
                        <template>
                          <v-list-item-avatar>
                            <img :src="imageUrl + data.item.logo" />
                          </v-list-item-avatar>
                          <v-list-item-content>
                            <v-list-item-title
                              color="red"
                              v-html="data.item.company_name"
                            ></v-list-item-title>
                            <v-list-item-subtitle
                              v-html="data.item.location"
                            ></v-list-item-subtitle>
                          </v-list-item-content>
                        </template>
                      </template>
                      <template v-slot:no-data>
                        <v-list-item @click="createCompany">
                          <v-list-item-content>
                            <v-list-item-title>
                              <strong> ( {{ companyDataToAdd.name }} )</strong>
                              Create
                              <v-icon class="createCompany">mdi-new-box</v-icon>
                            </v-list-item-title>
                          </v-list-item-content>
                        </v-list-item>
                      </template>
                    </v-combobox>

                    <!-- date picker -->
                    <v-row>
                      <v-col cols="12" sm="12" md="12">
                        <v-dialog
                          ref="startDate"
                          v-model="startDateDialog"
                          :return-value.sync="employmentDataToAdd.startJobDate"
                          width="290px"
                        >
                          <template v-slot:activator="{ on, attrs }">
                            <v-text-field
                              v-model="employmentDataToAdd.startJobDate"
                              label="Select start date"
                              prepend-inner-icon="mdi-calendar"
                              readonly
                              v-bind="attrs"
                              v-on="on"
                            ></v-text-field>
                          </template>
                          <v-date-picker
                            v-model="employmentDataToAdd.startJobDate"
                            scrollable
                          >
                            <v-spacer></v-spacer>
                            <v-btn
                              text
                              color="primary"
                              @click="startDateDialog = false"
                              >Cancel</v-btn
                            >
                            <v-btn
                              text
                              color="primary"
                              @click="
                                $refs.startDate.save(
                                  employmentDataToAdd.startJobDate
                                )
                              "
                              >OK</v-btn
                            >
                          </v-date-picker>
                        </v-dialog>
                      </v-col>
                    </v-row>
                    <v-row>
                      <v-switch
                        v-model="isSelectingEndDate"
                        class="mt-0 ml-3"
                        color="primary lighten-2"
                        hide-details
                        label="Already Quit?"
                      ></v-switch>
                    </v-row>
                    <v-row>
                      <v-col cols="12" sm="12" md="12">
                        <v-dialog
                          ref="endDate"
                          v-model="endDateDialog"
                          :return-value.sync="employmentDataToAdd.endJobDate"
                          width="290px"
                        >
                          <template v-slot:activator="{ on, attrs }">
                            <v-text-field
                              :disabled="!isSelectingEndDate"
                              v-model="employmentDataToAdd.endJobDate"
                              label="Select end date"
                              prepend-inner-icon="mdi-calendar"
                              readonly
                              v-bind="attrs"
                              v-on="on"
                            ></v-text-field>
                          </template>
                          <v-date-picker
                            v-model="employmentDataToAdd.endJobDate"
                            :min="employmentDataToAdd.startJobDate"
                            scrollable
                          >
                            <v-spacer></v-spacer>
                            <v-btn
                              text
                              color="primary"
                              @click="endDateDialog = false"
                              >Cancel</v-btn
                            >
                            <v-btn
                              text
                              color="primary"
                              @click="
                                $refs.endDate.save(
                                  employmentDataToAdd.endJobDate
                                )
                              "
                              >OK</v-btn
                            >
                          </v-date-picker>
                        </v-dialog>
                      </v-col>
                    </v-row>
                    <!--  end date picker -->
                  </v-col>
                </v-card-text>
                <!-- end dialog create new company -->
                <!-- if no company matching -->
                <v-card-text v-if="showAddCompanyForm">
                  <v-card-title>Add Company</v-card-title>
                  <v-divider></v-divider>
                  <v-form ref="form" v-model="validCompanyData" lazy-validation>
                    <v-col md="12" sm="12" class="mt-2">
                      <v-row justify="center">
                        <div class="image-upload">
                          <label for="file-input">
                            <v-avatar size="90">
                              <v-img
                                class="companyImage"
                                :src="companyPic"
                              ></v-img>
                            </v-avatar>
                            <v-btn
                              color="white"
                              fab
                              height="30"
                              width="30"
                              dark
                              elevation="1"
                              class="camera"
                              for="file-input"
                            >
                              <v-icon color="black">mdi-camera</v-icon>
                            </v-btn>
                          </label>
                          <input
                            id="file-input"
                            type="file"
                            @change="companyLogoChange"
                          />
                        </div>
                      </v-row>
                      <v-text-field
                        prepend-inner-icon="mdi-domain"
                        hide-selected
                        label="Company name"
                        persistent-hint
                        :rules="[rules.required]"
                        v-model="companyDataToAdd.name"
                      ></v-text-field>
                      <v-text-field
                        class="ma-0"
                        hide-selected
                        label="Address"
                        persistent-hint
                        prepend-inner-icon="mdi-map-marker-radius"
                        :rules="[rules.required]"
                        v-model="companyDataToAdd.address"
                      ></v-text-field>
                      <v-select
                        class="mt-3"
                        :items="dataToDisplay.domains"
                        label="Select domain"
                        :rules="[rules.required]"
                        prepend-inner-icon="mdi-web"
                        v-model="companyDataToAdd.domain"
                      ></v-select>
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
                          :disabled="!validCompanyData"
                          small
                          depressed
                          color="blue"
                          class="white--text"
                          @click="addNewCompany"
                          >Add</v-btn
                        >
                      </v-card-actions>
                    </v-col>
                  </v-form>
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
                    >Cancel</v-btn
                  >
                  <v-btn
                    :disabled="!validEmploymentData"
                    small
                    depressed
                    color="blue"
                    class="white--text mb-3"
                    @click="addNewEmployment"
                    >{{ formMode }}</v-btn
                  >
                </v-card-actions>
              </v-card>
              <!-- end tag if no company matching -->
            </v-dialog>
          </v-form>
          <!--  -->
        </div>
      </v-col>
    </v-row>
    <employment-card
      v-for="(employment, index) of userData.employments"
      :key="index"
      :employment="employment"
      @deleteEmployment="deleteEmployment"
      @showEditForm="showEditForm"
    ></employment-card>
  </v-card>
</template>
<script>
import axios from "../../../axios-http.js";
import EmploymentCard from "./EmploymentCard.vue";

export default {
  props: ["userData"],
  components: {
    "employment-card": EmploymentCard,
  },
  data() {
    return {
      formMode: 'Add',
      imageUrl: "http://127.0.0.1:8000/storage/profiles/",
      validCompanyData: true,
      isSelectingEndDate: false,
      validEmploymentData: true,
      showAddCompanyForm: false,
      dialog: false,
      startDate: false,
      startDateDialog: false,
      endDateDialog: false,
      dataToDisplay: {
        positions: null,
        domains: null,
        companies: null,
      },
      companyDataToAdd: {
        name: null,
        address: null,
        domain: null,
        logo: null,
      },
      employmentDataToAdd: {
        id: null,
        position: null,
        company: null,
        startJobDate: new Date(
          Date.now() - new Date().getTimezoneOffset() * 60000
        )
          .toISOString()
          .substr(0, 10),
        endJobDate: new Date(
          Date.now() - new Date().getTimezoneOffset() * 60000
        )
          .toISOString()
          .substr(0, 10),
      },
      positionSearch: null,
      companyPic:
        "https://foroalfa.org/imagenes/ilustraciones/logotipo-y-logo.jpg",
      rules: {
        required: (value) => !!value || "Required",
      },
    };
  },
  methods: {
    createCompany() {
      this.showAddCompanyForm = true;
    },
    companyLogoChange(e) {
      this.companyDataToAdd.logo = e.target.files[0];
      this.companyPic = URL.createObjectURL(this.companyDataToAdd.logo);
    },
    addNewCompany() {
      this.$refs.form.validate();
      let data = new FormData();
      data.append("domain_company", this.companyDataToAdd.domain);
      data.append("company_name", this.companyDataToAdd.name);
      data.append("location", this.companyDataToAdd.address);
      data.append("logo", this.companyDataToAdd.logo);

      axios.post("companies", data).then((res) => {
        this.dataToDisplay.companies.unshift(res.data.data);
        this.showAddCompanyForm = false;
      });
    },
    addNewEmployment() {
      this.$refs.empForm.validate();
      let data = {
        startJobDate: this.employmentDataToAdd.startJobDate,
        endJobDate: this.employmentDataToAdd.startJobDate,
        alumni_id: this.userData.user_id,
        workPosition: this.employmentDataToAdd.position,
        company_id: this.employmentDataToAdd.company.id,
      };
      if(this.isSelectingEndDate) {
        data.endJobDate = this.employmentDataToAdd.endJobDate;
      }
      if(this.formMode === "Add") {
        axios.post("employments", data).then((res) => {
          this.$emit("addNewEmployment", res.data.data[0]);
          this.dialog = false;
        });
      } else {
        axios.put("employments/" + this.employmentDataToAdd.id, data).then((res) => {
          this.$emit("updateEmployment", res.data.data);
          this.dialog = false;
        });
      }
    },
    deleteEmployment(id) {
      this.$emit('deleteEmployment', id);
    },
    showEditForm(id) {
      this.dialog = true;
      let dataToEdit = this.userData.employments.filter(emp => emp.id === id)[0];
      this.employmentDataToAdd.position = dataToEdit.workPosition;
      this.employmentDataToAdd.company = this.dataToDisplay.companies.filter(company => company.id === dataToEdit.company_id)[0];
      this.employmentDataToAdd.startJobDate = dataToEdit.startJobDate;
      this.employmentDataToAdd.endJobDate = dataToEdit.endJobDate;
      this.employmentDataToAdd.id = dataToEdit.id;
      if(dataToEdit.startJobDate !== dataToEdit.endJobDate) {
        this.isSelectingEndDate = true;
      }
      this.formMode = "Update"
    }
  },
  watch: {
    showAddCompanyForm: function (val) {
      if (!val) {
        this.companyDataToAdd.name = null;
        this.companyDataToAdd.address = null;
        this.companyDataToAdd.logo = null;
        this.companyDataToAdd.domain = null;
        this.companyPic =
          "https://foroalfa.org/imagenes/ilustraciones/logotipo-y-logo.jpg";
      }
    },
    dialog: function (val) {
      if (!val) {
        this.employmentDataToAdd.position = null;
        this.employmentDataToAdd.company = null;
        this.employmentDataToAdd.startJobDate = new Date(
          Date.now() - new Date().getTimezoneOffset() * 60000
        )
          .toISOString()
          .substr(0, 10);
        this.employmentDataToAdd.endJobDate = new Date(
          Date.now() - new Date().getTimezoneOffset() * 60000
        )
          .toISOString()
          .substr(0, 10);
        this.isSelectingEndDate = false;
      }
    },
  },
  mounted() {
    axios.get("workPositions").then((res) => {
      this.dataToDisplay.positions = res.data;
    });
    axios.get("domain_companies").then((res) => {
      this.dataToDisplay.domains = res.data;
    });
    axios.get("companies").then((res) => {
      this.dataToDisplay.companies = res.data;
    });
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
.camera {
  position: absolute;
  top: 130px;
  left: 270px;
}
</style>