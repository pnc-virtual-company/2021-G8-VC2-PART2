<template>
  <section class="eroview">
    <search-filter></search-filter>
    <ero-container></ero-container>
  </section>
</template>

<script>
import EroContainer from "../ero/AlumniContainer.vue";
import SearchFilter from '../ero/SearchFilter.vue';
export default {
  components: { EroContainer, SearchFilter },
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
