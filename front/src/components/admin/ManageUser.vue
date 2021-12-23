<template>
  <section class="mageuser">
    <div class="mt-15">
      <v-data-table
        dense
        :headers="headers"
        :items="desserts"
        item-key="name"
        class="elevation-1"
      >
      </v-data-table>
    </div>
  </section>
</template>
<script>
export default {
  data: () => ({
    desserts: [
      {
        firstname: "Lyheang",
        lastname: "Chhem",
        batch: 2021,
        major: "WEB",
        remove: "remove",
      },
      {
        firstname: "Lyheang",
        lastname: "Chhem",
        batch: 2021,
        major: "WEB",
        remove: "remove",
      },
      {
        firstname: "Lyheang",
        lastname: "Chhem",
        batch: 2021,
        major: "WEB",
        remove: "remove",
      },
      {
        firstname: "Lyheang",
        lastname: "Chhem",
        batch: 2021,
        major: "WEB",
        remove: "remove",
      },
      {
        firstname: "Lyheang",
        lastname: "Chhem",
        batch: 2021,
        major: "WEB",
        remove: "remove",
      },
    ],
    headers: [
      { text: "First Name", value: "firstname" },
      { text: "Last Name", value: "lastname" },
      { text: "Batch", value: "batch" },
      { text: "Major", value: "major" },
      { text: "Action", value: "remove" },
    ],
  }),
};
</script>
<style scoped>
.mageuser {
  width: 70%;
  margin: auto;
}
</style>
