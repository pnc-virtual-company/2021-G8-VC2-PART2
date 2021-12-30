<template>
  <section class="myProfileView">
    <profile
      :userData="userData"
      @changeProfile="changeProfile"
      @changeAlumniInfo="changeAlumniInfo"
    ></profile>
    <skill-view
      :userData="userData"
      :skills="skills"
      @new-skill="addNewSkill"
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
import Profile from "../myProfile/Profile.vue";
import Skill from "../myProfile/Skill.vue";
import EmploymentView from "../myProfile/employment/EmploymentView.vue";
import axios from "../../axios-http";
export default {
  props: ["userData"],
  components: {
    profile: Profile,
    "employemt-view": EmploymentView,
    "skill-view": Skill,
  },
  data() {
    return {
      skills: [],
    };
  },
  methods: {
    changeProfile(profile) {
      this.$emit("changeProfile", profile);
    },
    changeAlumniInfo(newEmail, newPhone) {
      this.$emit("changeAlumniInfo", newEmail, newPhone);
    },
    addNewSkill(skillName) {
      let newSkill = {};
      newSkill.skill_name = skillName,
        axios.post("skills", newSkill);
    },
    getAllSkills() {
      axios.get("skills").then((res) => {
        for (let skill of res.data) {
          this.skills.push(skill.skill_name);
        }
      });
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
  },
  mounted() {
    this.getAllSkills();
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