<template>
  <section>
    <!-- <v-row justify="center"> -->
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
              <v-list-item-title>WEB Trainer</v-list-item-title>
              <small>Passerelles numériques Cambodia</small>
              <br />
              <small>Jan 15 2020 - Feb 30 2021 Phnom Penh</small>
            </v-list-item-title>
          </v-list-item>
        </v-col>
        <v-col cols-4 class="option mt-0">
          <div class="mr-2">
            <v-icon size="20px">mdi-dots-horizontal</v-icon>
          </div>
        </v-col>
      </v-row>
      <v-divider></v-divider>
    </v-card>
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
              <v-list-item-title>WEB Trainer</v-list-item-title>
              <small>Passerelles numériques Cambodia</small>
              <br />
              <small>Jan 15 2020 - Feb 30 2021 Phnom Penh</small>
            </v-list-item-title>
          </v-list-item>
        </v-col>
        <v-col cols-4 class="option mt-0">
          <div class="mr-2">
            <v-icon size="20px">mdi-dots-horizontal</v-icon>
          </div>
        </v-col>
      </v-row>
      <v-divider></v-divider>
    </v-card>
    <!-- </v-row> -->
  </section>
</template>

<script>
export default {
  data: () => ({
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
  justify-content: end;
}
.v-card:hover {
  background: #f3f2ef;
}
</style>