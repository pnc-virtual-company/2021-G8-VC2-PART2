<template>
  <section class="eroview">
    <search-filter></search-filter>
    <alumni-container @invite="invite"></alumni-container>
  </section>
</template>

<script>
import axios from "../../axios-http.js";
import AlumniContainer from "../ero/AlumniContainer.vue";
import SearchFilter from '../ero/SearchFilter.vue';
export default {
  components: { AlumniContainer, SearchFilter },
  methods: {
    invite(data) {
      axios.post('invite', data)
      .then(res => {
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
    width: 80%;
  }
}
@media (min-width: 600px) and (max-width: 800px) {
  .eroview {
    width: 70%;
  }
}
</style>