<template>
  <section>
    <!-- profile -->
    <!-- persistent -->
    <v-dialog v-model="dialog" persistent max-width="760px">
      <v-card class="pa-4">
       <v-layout row wrap class="mt-0 pr-4 pl-4">
        <v-flex xs12 sm12 md12 lg11>
            <v-avatar size="100">
              <v-img :src="imageUrl + alumni.profile" alt=""></v-img>
            </v-avatar>
        </v-flex>
        <v-flex xs12 sm12 md12 lg1>
          <v-btn @click="dialog = false" elevation="0" class="close-btn mx-2" small color="error">
            <v-icon dark>
              mdi-close
            </v-icon>
          </v-btn>
        </v-flex>
        <v-flex xs12 sm7 md8 lg8 class="ma-0">
          <v-list-item class="ma-0 pa-0">
            <h3>{{alumni.firstname + " " + alumni.lastname}}</h3>
          </v-list-item>
          <v-list-item class="ma-0 pa-0">
           <div class="mr-3">
              <v-avatar size="30">
                <img src="../../assets/pn-logo.png" alt="John" />
              </v-avatar>
            </div>
            <v-list-item-title>{{ alumni.batch + "-" + alumni.major }}</v-list-item-title>
          </v-list-item>
        </v-flex>
        <v-flex xs12 sm5 md4 lg4 class="ma-0">
          <v-list-item class="ma-0 pa-0 d-flex justify-end">
            <div class="mr-3">
              <v-avatar v-if="alumni.gender=='Female'" size="30">
                <img
                  src="../../assets/female.png"
                  alt="John"
                >
              </v-avatar>
              <v-avatar v-if="alumni.gender=='Male'" size="30">
                <img
                  src="../../assets/male.png"
                  alt="John"
                >
              </v-avatar>
            </div>
            <v-list-item-title>{{ alumni.gender }}</v-list-item-title>
          </v-list-item>
          <v-list-item class="ma-0 pa-0 d-flex justify-end">
            <v-icon size="30" class="mr-3" color="#00A3FF">mdi-phone-in-talk</v-icon>
            <v-list-item-title>+855{{ alumni.phone }}</v-list-item-title>
          </v-list-item>
        </v-flex>
        <v-flex>
          <v-list-item class="ma-0 pa-0">
          <div class="mr-3">
              <v-avatar class="background-img" size="30">
                <img src="../../assets/mail-logo.png" alt="John" />
              </v-avatar>
            </div>
          <v-list-item-title>{{ alumni.email }}</v-list-item-title>
          </v-list-item>
        </v-flex>
      </v-layout>  
        <v-divider class="mt-3 mb-3"></v-divider>
        <!-- profile -->
        <!-- skill -->
        <v-layout row wrap class="mt-0">
          <v-col class="ma-0">
            <h3>Skills</h3>
            <div class="text-left">
              <v-chip class="ma-2" v-for="skill of alumni.skills" :key="skill">
                {{ skill }}
              </v-chip>
            </div>
          </v-col>
        </v-layout>
        <v-divider class="mt-5 mb-3"></v-divider>
        <!-- skill -->
        <!-- employment -->
        <v-layout row wrap class="mt-0 pr-4 pl-4">
          <v-flex>
            <h3>Employment</h3>
            <v-card
              class="ma-0 pa-2 elevation-0 rounded-lg alumni-card"
              v-for="employment of alumni.employments"
              :key="employment.id"
            >
              <v-list-item class="ma-0 pa-2">
                <v-avatar class="mr-5" size="70">
                  <v-img :src="imageUrl + employment.logo" alt=""></v-img>
                </v-avatar>
                <v-list-item-title>
                  <v-flex class="d-flex">
                    <v-list-item-title>
                      {{ employment.workPosition }}
                    </v-list-item-title>
                    <v-menu bottom left> </v-menu>
                  </v-flex>
                  <v-list-item-subtitle class="mt-2">
                    {{ employment.company_name }}
                  </v-list-item-subtitle>
                  <v-list-item-subtitle class="mt-1">
                    {{ getStartJobDate(employment.startJobDate) }} -
                    {{ employment.endJobDate }}.
                    {{ employment.location }}
                  </v-list-item-subtitle>
            <v-divider class="mt-2"></v-divider>
                </v-list-item-title>
              </v-list-item>
            </v-card>
          </v-flex>
        </v-layout>
        <!-- employment -->
      </v-card>
    </v-dialog>
    <v-card class="ma-0 pa-2 elevation-0 rounded-lg alumni-card">
      <v-row>
        <v-col>
          <v-list-item class="ma-0 pa-0">
            <v-avatar class="mr-3 mb-4" size="70">
              <v-img :src="imageUrl + alumni.profile"></v-img>
            </v-avatar>
            <v-list-item-title>
              <v-flex class="d-flex mt-2">
                <v-list-item-title class="text-title details">
                  <a @click="dialog = true">
                    {{ alumni.firstname }} {{ alumni.lastname }}
                  </a>
                </v-list-item-title>
                <v-list-item-title
                  class="text-title"
                  v-if="
                    alumni.employments.length > 0 &&
                    isWorking(
                      alumni.employments[0].startJobDate,
                      alumni.employments[0].endJobDate
                    )
                  "
                  >{{ alumni.employments[0].workPosition }}</v-list-item-title
                >
              </v-flex>
              <v-flex class="d-flex mt-2">
                <v-list-item-subtitle class="text mt-2">
                  {{ alumni.major }} {{ alumni.batch }}
                </v-list-item-subtitle>
                <v-list-item-subtitle
                  class="text"
                  v-if="
                    alumni.employments.length > 0 &&
                    isWorking(
                      alumni.employments[0].startJobDate,
                      alumni.employments[0].endJobDate
                    )
                  "
                >
                  <v-avatar size="35" class="mr-1">
                    <v-img :src="imageUrl + alumni.employments[0].logo"></v-img>
                  </v-avatar>
                  {{ alumni.employments[0].company_name }}
                </v-list-item-subtitle>
              </v-flex>
              <v-divider class="mt-2"></v-divider>
              <br />
            </v-list-item-title>
          </v-list-item>
        </v-col>
      </v-row>
    </v-card>
  </section>
</template>

<script>
export default {
  props: ["alumni"],
  data: () => ({
    imageUrl: "http://127.0.0.1:8000/storage/profiles/",
    dialog: false,
    skills: [],
  }),
  methods: {
    isWorking(startDate, endDate) {
      let start = startDate.split("-");
      let end = endDate.split("-");
      start = startDate[0] * 365 + startDate[1] * 30 + startDate[2];
      end = endDate[0] * 365 + endDate[1] * 30 + endDate[2];
      return end <= start;
    },
    getEndJobDate(start, end) {
      if (this.isWorking(start, end)) {
        return "Present";
      }
      return end.replace("-", "/").replace("-", "/");
    },
    getStartJobDate(start) {
      return start.replace("-", "/").replace("-", "/");
    },
  },
};
</script>

<style scoped>
.close-btn {
  position: fixed;
}
.option {
  display: flex;
  justify-content: flex-end;
}
.alumni-detail:hover {
  background: #f5f4f3;
}
.alumni-card:hover {
  background: #f5f4f3;
}
.v-card {
  border-radius: 10px;
}
.text {
  font-size: 15px;
}
.text-title {
  font-size: 18px;
}
.details {
  cursor: pointer;
}
.v-text-field.v-text-field--solo:not(.v-text-field--solo-flat)
  > .v-input__control
  > .v-input__slot {
  box-shadow: none;
}

.alumniDetail {
  width: 50%;
  margin: auto;
  background: none;
  color: white;
}
</style>
