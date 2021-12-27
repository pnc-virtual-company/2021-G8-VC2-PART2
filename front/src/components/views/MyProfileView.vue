<template>
  <section class="myProfileView">
    <profile
      :userData="userData"
      @changeProfile="changeProfile"
    ></profile>
    <skill-view
      :skills="skills"
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
    };
  },
  methods: {
    changeProfile(profile) {
      this.$emit('changeProfile', profile);
    }
  },
  mounted() {
    axios.get("skills").then(res=>{
     for(let skill of res.data){
       this.skills.push(skill.skill_name);
     }
   })
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