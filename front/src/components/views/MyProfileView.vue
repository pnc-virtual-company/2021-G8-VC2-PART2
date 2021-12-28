<template>
  <section class="myProfileView">
    <profile
      :userData="userData"
      @changeProfile="changeProfile"
      @changeAlumniInfo="changeAlumniInfo"
    ></profile>
    <skill-view></skill-view>
    <employemt-view></employemt-view>
  </section>
</template>

<script>
import Profile from "../myProfile/Profile.vue";
import Skill from "../myProfile/Skill.vue";
import EmploymentView from "../myProfile/employment/EmploymentView.vue";

export default {
  props: ['userData'],
  components: {
    profile: Profile,
    "employemt-view": EmploymentView,
    "skill-view": Skill,
  },
  methods: {
    changeProfile(profile) {
      this.$emit('changeProfile', profile);
    },
    changeAlumniInfo(newEmail, newPhone) {
      this.$emit('changeAlumniInfo', newEmail, newPhone);
    }
  },
};
</script>

<style scoped>
.myProfileView {
  width: 50%;
  margin: auto;
}
@media (max-width: 1070px) {
  .myProfileView {
    width: 90%;
  }
}
</style>