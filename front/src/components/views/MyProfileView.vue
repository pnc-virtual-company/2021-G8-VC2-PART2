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
      @add-alumniSkill="addSkillForAlumni"
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
      lastId: 0,
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
      newSkill.id = this.lastId + 1,
      newSkill.skill_name = skillName,
        axios.post("skills", newSkill).then((res) => {
          console.log(res.data);
        });
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
    addSkillForAlumni(skill) {
      let alumni_skill = {};
      alumni_skill.alumni_id = this.userData.user_id,
      alumni_skill.skillName = skill
      axios.post('alumniskills',alumni_skill).then(res=>{
        console.log(res.data);
      })
      
    }
  },
  mounted() {
    this.getAllSkills();
    this.addSkillForAlumni();
    
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