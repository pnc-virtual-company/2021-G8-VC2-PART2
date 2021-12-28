<template>
  <v-card class="mt-5 mb-4 pa-4 rounded-lg">
    <v-row class="mb-1">
      <v-col cols="8" sm="3" md="5">
        <h3>Skills</h3>
      </v-col>

      <v-col class="add-info">
        <v-dialog v-model="leave" persistent max-width="400px">
          <template v-slot:activator="{ on, attrs }">
            <v-btn
              color="white"
              fab
              x-small
              dark
              elevation="1"
              class="mr-2"
              v-bind="attrs"
              v-on="on"
            >
              <v-icon color="black">mdi-plus</v-icon>
            </v-btn>
          </template>
          <v-card>
            <v-card-title>
              <span class="text-h5">Add new skill</span>
            </v-card-title>
            <v-divider></v-divider>
            <v-card-text>
              <v-row class="pa-0">
                <v-col cols="12 mt-0">
                  <v-combobox
                    v-model="getInputSkill"
                    prepend-inner-icon="mdi-checkbox-multiple-marked"
                    :items="skills"
                    label="Skill"
                    :search-input.sync="search"
                    multiple
                    small-chips
                    clearable
                  >
                    <template v-slot:no-data>
                    <v-list-item @click="createNewSkill">
                      <v-list-item-content>
                        <v-list-item-title>
                          <strong> ( {{ search }} )</strong> Create
                          <v-icon class="createNewSkill">mdi-new-box</v-icon>
                        </v-list-item-title>
                      </v-list-item-content>
                    </v-list-item>
                  </template>
                  </v-combobox>
                </v-col>
              </v-row>
            </v-card-text>
            <v-card-actions class="btn-upload">
              <v-spacer></v-spacer>
              <v-btn
                class="mb-1"
                small
                depressed
                color="primary"
                text
                @click="leave = false"
              >
                Cancel
              </v-btn>
              <v-btn
                small
                depressed
                color="primary"
                class="white--text mb-1"
                @click="addSkill"
              >
                ADD
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
      </v-col>
    </v-row>

    <div class="text-left">
      <v-chip
        class="ma-2"
        v-for="(skill, index) in skills"
        :key="index"
        close
        @click:close="removed(index)"
      >
        {{ skill }}
      </v-chip>
    </div>
  </v-card>
</template>
<script>
export default {
  emits: ["new-skill"],
  props: ["skills"],
  data: () => ({
    leave: false,
    skillId: null,
    search: null,
  }),
  methods: {
    addSkill() {
      this.leave = false;
    },
    cancel() {
      this.leave = false;
    },
    createNewSkill(){
      this.$emit("new-skill", this.search);
    }
  },
};
</script>
<style>
.add-info {
  display: flex;
  justify-content: flex-end;
}
.row-info {
  display: flex;
  justify-content: flex-end;
}
.createNewSkill {
  cursor: pointer;
}
</style>
