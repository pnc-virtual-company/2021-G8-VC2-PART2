<template>
  <section class="myProfileView">
    <profile
      :userData="userData"
      @changeProfile="changeProfile"
      @changeAlumniInfo="changeAlumniInfo"
    ></profile>
    <skill-view
      :userData="userData"
      @deleteSkill="deleteSkill"
      @addSkills="addSkills"
    >
    </skill-view>
    <employemt-view
      :userData="userData"
      @addNewEmployment="addNewEmployment"
      @deleteEmployment="deleteEmployment"
      @updateEmployment="updateEmployment"
    ></employemt-view>
  </section>
</template>
<script>
import axios from "../../axios-http";
import Profile from "../myProfile/Profile.vue";
import Skill from "../myProfile/Skill.vue";
import EmploymentView from "../myProfile/employment/EmploymentView.vue";
export default {
  props: ["userData"],
  components: {
    profile: Profile,
    "employemt-view": EmploymentView,
    "skill-view": Skill,
  },
  methods: {
    changeProfile(profile) {
      this.$emit("changeProfile", profile);
    },
    changeAlumniInfo(newEmail, newPhone) {
      this.$emit("changeAlumniInfo", newEmail, newPhone);
    },
    addNewEmployment(data) {
      this.$emit("addNewEmployment", data);
    },
    updateEmployment(data) {
      this.$emit("updateEmployment", data);
    },
    deleteEmployment(id) {
      this.$emit('deleteEmployment', id);
    },
    deleteSkill(alumni_id, skill){
      let dataToDelete = {
        'alumni_id': alumni_id,
        'skillName': skill
      }
      axios.post("alumniskills/remove", dataToDelete)
        .then(res => {
          if(res.data === 1) {
            this.$emit('deleteSkill', skill);
          }
        });
    },
    addSkills(data) {
      this.$emit('addSkills', data);
    }
  },
};
</script>

<style scoped>
.myProfileView {
  width: 50%;
  margin: auto;
}
@media (max-width: 960px) {
  .myProfileView {
    width: 90%;
  }
}
</style>