<template>
  <section>
    <v-card class="ma-0 pa-2 elevation-0 rounded-lg">
      <v-row>
        <v-col>
          <v-list-item class="ma-0 pa-0">
            <v-avatar class="mr-3 mb-4" size="70">
              <img :src="imageUrl+alumni.profile" alt />
            </v-avatar>
            <v-list-item-title>
              <v-flex class="d-flex mt-2">
                <v-list-item-title class="text-title">
                  {{
                  alumni.firstname
                  }} {{alumni.lastname}}
                </v-list-item-title>
                <v-list-item-title
                  class="text-title"
                   v-if="alumni.employments.length > 0 && alumni.employments[0].startJobDate === alumni.employments[0].endJobDate"
                >{{ alumni.employments[0].workPosition }}</v-list-item-title>
              </v-flex>
              <v-flex class="d-flex mt-2">
                <v-list-item-subtitle class="text mt-2">
                  {{
                  alumni.major
                  }} {{ alumni.batch }} ({{ alumni.gender }})
                </v-list-item-subtitle>
                <v-list-item-subtitle class="text" v-if="alumni.employments.length > 0 && alumni.employments[0].startJobDate === alumni.employments[0].endJobDate">
                  <v-avatar size="30">
                    <v-img :src="imageUrl+alumni.employments[0].logo"></v-img>
                  </v-avatar>
                  {{ alumni.employments[0].company_name }}
                </v-list-item-subtitle>
              </v-flex>
              <br>
            </v-list-item-title>
          </v-list-item>
          <v-divider></v-divider>
        </v-col>
      </v-row>
    </v-card>
  </section>
</template>

<script>
export default {
  props: ["alumni"],
  data: () => ({
    imageUrl: "http://127.0.0.1:8000/storage/profiles/",
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
.v-card {
  cursor: pointer;
  border-radius: 10px;
}
.text {
  font-size: 13px;
}
.text-title {
  font-size: 18px;
}
.v-text-field.v-text-field--solo:not(.v-text-field--solo-flat)
  > .v-input__control
  > .v-input__slot {
  box-shadow: none;
}
</style>
