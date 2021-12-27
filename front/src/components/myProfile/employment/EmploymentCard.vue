<template>
  <section>
    <v-card class="ma-0 pa-2 elevation-0 rounded-lg">
      <v-row>
        <v-col>
          <v-list-item class="ma-0 pa-0">
            <v-avatar class="mr-3" size="50px">
              <img
                src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Circle-icons-profile.svg/1024px-Circle-icons-profile.svg.png"
                alt=""
              />
            </v-avatar>
            <v-list-item-title>
              <v-list-item-title>Position</v-list-item-title>
              <small>Company</small>
              <br />
              <small>Job-StartDate -> Job-EndDate Location</small>
            </v-list-item-title>
          </v-list-item>
        </v-col>
      </v-row>
      <v-divider class="mt-2"></v-divider>
    </v-card>
  </section>
</template>

<script>
export default {
  data: () => ({
    dialog: false,
    messages: [
      {
        avatar: "https://avatars0.githubusercontent.com/u/9064066?v=4&s=460",
        name: "John Leider",
      },
      {
        avatar: "mdi-account-multiple",
        name: "Social",
      },
      {
        avatar: "mdi-tag",
        name: "Promos",
      },
    ],
  }),
};
</script>

<style scoped>
.option {
  display: flex;
  justify-content: flex-end;
}
.v-card:hover {
  background: #f5f4f3;
}
</style>