<template>
  <section class="myProfileView">
    <profile
      :userData="userData"
      @changeProfile="changeProfile"
      @changeAlumniInfo="changeAlumniInfo"
    ></profile>
    <skill-view
      :skills="skills"
      @new-skill="addNewSkill"
    >
    </skill-view>
    <employemt-view></employemt-view>
  </section>
</template>

<script>
import Profile from "../myProfile/Profile.vue";
import Skill from "../myProfile/Skill.vue";
import EmploymentView from "../myProfile/employment/EmploymentView.vue";
import axios from '../../axios-http';
export default {
  props: ['userData'],
  components: {
    profile: Profile,
    "employemt-view": EmploymentView,
    "skill-view": Skill,
  },
  data() {
    return {
      skills: [],
      lastId:0,
    };
  },
  methods: {
    changeProfile(profile) {
      this.$emit('changeProfile', profile);
    },
    changeAlumniInfo(newEmail, newPhone) {
      this.$emit('changeAlumniInfo', newEmail, newPhone);
    },
    addNewSkill(skillName) {
      let newSkill = {};
      newSkill.id = this.lastId+1,
      newSkill.skill_name = skillName,
      axios.post('skills',newSkill).then(res=>{
        console.log(res.data);
      })
    },
    getAllSkills(){
      axios.get("skills").then(res=>{
     for(let skill of res.data){
       this.skills.push(skill.skill_name);
       this.lastId = skill.id;
     }
   })
    }
  },
  mounted() {
    this.getAllSkills();
  }
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