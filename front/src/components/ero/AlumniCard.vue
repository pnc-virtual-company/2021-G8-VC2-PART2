<template>
  <section>
    <v-card  v-for="(item, index) in items"
      :key="index"
      class="ma-0 pa-2 elevation-0 rounded-lg"
    >
      <v-row>
        <v-col>
          <v-list-item class="ma-0 pa-0">
            <v-avatar class="mr-3" size="70">
              <img :src="item.avatar" alt="" />
            </v-avatar>
            <v-list-item-title>
              <v-list-item-title>{{ item.title }}</v-list-item-title>
              <small>{{ item.subtitle }}</small>
              <br />
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
  </section>
</template>

<script>
export default {
  data: () => ({
    items: [
      {
        avatar:
          "https://cdn.icon-icons.com/icons2/1879/PNG/512/iconfinder-8-avatar-2754583_120515.png",
        title: "Thon Theng",
        subtitle: "thon@gmail.com",
      },
      {
        avatar:
          "https://cdn.icon-icons.com/icons2/1879/PNG/512/iconfinder-8-avatar-2754583_120515.png",
        title: "Thon Theng",
        subtitle: "thon@gmail.com",
      },
      {
        avatar:
          "https://cdn.icon-icons.com/icons2/1879/PNG/512/iconfinder-8-avatar-2754583_120515.png",
        title: "Thon Theng",
        subtitle: "thon@gmail.com",
      },
      {
        avatar:
          "https://cdn.icon-icons.com/icons2/1879/PNG/512/iconfinder-8-avatar-2754583_120515.png",
        title: "Thon Theng",
        subtitle: "thon@gmail.com",
      },
      {
        avatar:
          "https://cdn.icon-icons.com/icons2/1879/PNG/512/iconfinder-8-avatar-2754583_120515.png",
        title: "Thon Theng",
        subtitle: "thon@gmail.com",
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
  background: #f5f4f3;
}
.v-card {
  cursor: pointer;
  border-radius: 10px;
}
</style>
