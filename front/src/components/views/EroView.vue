<template>
  <section class="eroview">
    <search-filter></search-filter>
    <ero-container @invite="invite"></ero-container>
  </section>
</template>

<script>
import axios from "../../axios-http.js";
import EroContainer from "../ero/AlumniContainer.vue";
import SearchFilter from '../ero/SearchFilter.vue';
export default {
  components: { EroContainer, SearchFilter },
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
@media (max-width: 1070px) {
  section {
    width: 90%;
  }
}
</style>
