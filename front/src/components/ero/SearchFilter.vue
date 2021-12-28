<template>
  <section>
    <v-text-field
      class="mt-5"
      prepend-inner-icon="mdi-magnify"
      clearable
      placeholder="Search"
      solo
    ></v-text-field>
  </section>
</template>

<script>
export default {};
</script>

<style scoped>
.v-text-field {
  border-radius: 5px;
}
.v-text-field.v-text-field--solo:not(.v-text-field--solo-flat) > .v-input__control > .v-input__slot {
  box-shadow: none;
}
</style>