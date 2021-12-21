<template>
  <section>
    <profile
      v-for="alumniInfo in alumniData"
      :key="alumniInfo.email"
      :alumniData="alumniInfo"
    ></profile>
    <employemt-view
      v-for="alumniInfo in alumniData"
      :key="alumniInfo.email"
      :alumniData="alumniInfo"
    ></employemt-view>
  </section>
</template>

<script>
import Profile from "../myProfile/Profile.vue";
import EmploymentView from "../myProfile/employment/EmploymentView.vue";

export default {
  components: {
    profile: Profile,
    "employemt-view": EmploymentView,
  },
  data() {
    return {
      alumniData: [
        {
          name: "Thon Theng",
          email: "g@g.com",
          batch: "Batch 2021",
          skill: "WEB",
          phone: "09876543",
          gender: "Male",
          employment: [
            {
              position: "Developer",
              company: "Passerelles numériques Cambodia",
              workStart: "15 06 2006",
              workLeave: "14 08 2010",
              location: "Phnom Penh",
            },
            {
              position: "Manager",
              company: "Passerelles numériques Cambodia",
              workStart: "15 06 2006",
              workLeave: "14 08 2010",
              location: "Phnom Penh",
            },
            {
              position: "Mobile Dev",
              company: "Passerelles numériques Cambodia",
              workStart: "15 06 2006",
              workLeave: "14 08 2010",
              location: "Phnom Penh",
            },
          ],
        },
      ],
    };
  },
};
</script>

<style scoped>
section {
  width: 50%;
  margin: auto;
}
@media (max-width: 600px) {
  section {
    width: 80%;
  }
}
@media (min-width: 600px) and (max-width: 800px) {
  section {
    width: 70%;
  }
}
</style>