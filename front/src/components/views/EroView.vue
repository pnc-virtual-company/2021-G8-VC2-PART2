<template>
  <section class="eroview">
    <search-filter></search-filter>
    <alumni-container></alumni-container>
  </section>
</template>

<script>
import AlumniContainer from "../ero/AlumniContainer.vue";
import SearchFilter from '../ero/SearchFilter.vue';
import axios from "../../axios-http";
export default {
  components: { AlumniContainer, SearchFilter },
  methods: {
    getAlumnis(){
      axios.get('users/alumni').then(res=>{
        console.log(res.data);
      })
    }
  },
};
</script>

<style scoped>
.eroview {
  width: 50%;
  margin: auto;
}
@media (max-width: 600px) {
  .eroview {
    width: 90%;
  }
}
@media (min-width: 600px) and (max-width: 800px) {
  .eroview {
    width: 60%;
  }
}
</style>