<template>
  <section class="eroview">
    <v-text-field
      class="mt-7"
      v-model="keySearch"
      prepend-inner-icon="mdi-magnify"
      clearable
      placeholder="Search"
      solo
    ></v-text-field>

    <div class="filter-container">
      <div class="filter">
        <v-select label="Company" dense solo :items="companyLists" v-model="filterData.companySelected"></v-select>
      </div>
      <div class="filter">
        <v-select label="Batch" dense solo :items="batches" v-model="filterData.batchSelected"></v-select>
      </div>
      <div class="filter">
        <v-select label="Major" dense solo :items="majors" v-model="filterData.majorSelected"></v-select>
      </div>
      <div class="filter">
        <v-select label="Gender" dense solo :items="genders" v-model="filterData.genderSelected"></v-select>
      </div>
      <div class="filter">
        <v-btn depressed color="white" width="100%" @click="clearFilter">
          <v-icon color="error">mdi-close</v-icon>
        </v-btn>
      </div>
    </div>

    <v-card class="mt-2 pa-4 rounded-lg">
      <v-card class="pa-10 text-center" v-if="alumnisToDisplay.length === 0">No People Found</v-card>
      <ero-card
        v-for="alumni of alumnisToDisplay"
        :key="alumni.id"
        :alumni="alumni"
      ></ero-card>
    </v-card>
  </section>
</template>

<script>
import EroCard from "../ero/AlumniCard.vue";
import axios from "../../axios-http.js";
export default {
  components: {
    EroCard,
  },
  data: () => ({
    filterData: {
      companySelected: '',
      batchSelected: '',
      majorSelected: '',
      genderSelected: '',
    },
    keySearch: "",
    alumnisStored: null,
    alumnisToDisplay: null,
    alumnisFilter: null,
    companies: [],
    companyLists: [],
    batches: [],
    majors: ["SNA", "WEP", "DMO"],
    genders: ["Female", "Male", "Other"],
  }),
  watch: {
    keySearch: function (val) {
      if (val === "" || val === null) {
        this.alumnisToDisplay = this.alumnisFilter;
      } else {
        let key = val.toLowerCase();
        this.alumnisToDisplay = this.alumnisFilter.filter(
          (alumni) =>
            alumni.firstname.toLowerCase().includes(key) ||
            alumni.lastname.toLowerCase().includes(key) ||
            alumni.batch.toLowerCase().includes(key) ||
            alumni.major.toLowerCase().includes(key) ||
            alumni.gender.includes(val) ||
            alumni.email.toLowerCase().includes(key)
        );
      }
    },
    filterData: {
      handler(val){
        if(
          val.companySelected === '' &&
          val.batchSelected === '' &&
          val.majorSelected === '' &&
          val.genderSelected === ''
        ) {
          this.alumnisFilter = this.alumnisStored;
        } else {
          if(val.companySelected === '') {
            this.alumnisFilter = this.alumnisStored;
          } else {
            this.alumnisFilter = this.alumnisStored.filter(alumni => alumni.employments.length > 0);  
            this.alumnisFilter = this.alumnisFilter.filter(alumni => this.isInPresent(alumni.employments[0].startJobDate, alumni.employments[0].endJobDate) && alumni.employments[0].company_name === val.companySelected)
          }
          this.alumnisFilter = this.alumnisFilter.filter(alumni => 
            alumni.gender.includes(val.genderSelected) &&
            alumni.batch.includes(val.batchSelected) &&
            alumni.major.includes(val.majorSelected)
          );
        }
        this.alumnisToDisplay = this.alumnisFilter;
      },
      deep: true
  }
  },
  methods: {
    clearFilter() {
      this.filterData = {
        companySelected: '',
        batchSelected: '',
        majorSelected: '',
        genderSelected: '',
      }
    },
    isInPresent(startDate, endDate) {
      let start = startDate.split('-');
      let end = endDate.split('-');
      start = startDate[0]*365 + startDate[1]*30 + startDate[2];
      end = endDate[0]*365 + endDate[1]*30 + endDate[2];
      return end <= start;
    },
    submit(emailToInvite, selectedRole) {
      this.dialog = false;
      let data = {
        email: emailToInvite,
        role: selectedRole,
      };
      this.$emit("invite", data);
    },
    /*get companies*/
    getCompanies() {
      axios.get("companies").then((res) => {
        this.companies = res.data;
        for (let company of this.companies) {
          this.companyLists.push(company.company_name);
        }
      });
    },
    /*get batches*/
    getBatches() {
      axios.get("batches").then((res) => {
        this.batches = res.data;
      });
    },
    /* get all of explore alumni */
    getExploreAlumniData() {
      axios.get("users/alumni").then((res) => {
        this.alumnisStored = res.data.filter(
          (alumni) => alumni.status === "validated"
        );
        for(let alumni of this.alumnisStored) {
          alumni.employments.sort(function (a, b) {
            var dateA = new Date(a.startJobDate), dateB = new Date(b.startJobDate)
            return dateB - dateA
          });
        }
        this.alumnisFilter = this.alumnisStored;
        this.alumnisToDisplay = this.alumnisFilter;
      });
    },
  },
  mounted() {
    this.getExploreAlumniData();
    this.getCompanies();
    this.getBatches();
  },
};
</script>

<style>
.v-sheet.v-card {
  border-radius: 5px;
}
.invite-btn {
  border-radius: 5px;
}

.v-select {
  border-radius: 5px;
}

.filter-container {
  display: flex;
  justify-content: space-between;
}

.filter {
  width: 18%;
}
.v-sheet.v-card:not(.v-sheet--outlined) {
  box-shadow: none;
}
.v-text-field {
  border-radius: 5px;
}

.eroview {
  width: 50%;
  margin: auto;
}
@media (max-width: 960px) {
  .eroview {
    width: 90%;
  }
}
</style>