<template>
  <v-card class="mt-5 mb-4 pa-4 rounded-lg">
    <v-row class="mb-1">
      <v-col cols="8" sm="3" md="5">
        <h3>Skills</h3>
      </v-col>
      <v-col class="add-info">
        <v-btn
              color="white"
              fab
              x-small
              dark
              elevation="1"
              class="mr-2"
              @click="showSkill = !showSkill"
            >
              <v-icon color="black">mdi-pencil</v-icon>
            </v-btn>
        <v-dialog v-model="showSkillDialog" persistent max-width="400px">
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
                    :items="skills"
                    v-model="selectedSkills"
                    prepend-inner-icon="mdi-checkbox-multiple-marked"
                    label="Skill"
                    :search-input.sync="keySearch"
                    multiple
                    small-chips
                    hide-selected
                    clearable
                  >
                    <template v-slot:selection="{ attrs, item, parent, selectedSkills }">
                      <v-chip v-bind="attrs" :input-value="selectedSkills" small>
                        <span class="pr-2">{{ item }}</span>
                        <v-icon small @click="parent.selectItem(item)">$delete</v-icon>
                      </v-chip>
                    </template>
                  </v-combobox>
                </v-col>
              </v-row>
            </v-card-text>
            <v-card-actions class="btn-upload">
              <v-spacer></v-spacer>
              <v-btn class="mb-1" small depressed color="primary" text @click="cancel">Cancel</v-btn>
              <v-btn small depressed color="primary" class="white--text mb-1" @click="addSkill">ADD</v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
      </v-col>
    </v-row>
    <div class="text-left" v-if="showSkill">
      <v-chip
        class="ma-2"
        v-for="(skill, index) in userData.skills"
        :key="index"
        @click:close="removed(userData.user_id, skill)"
      >
        {{ skill }}
      </v-chip>
    </div>
    <div class="text-left" v-else>
      <v-chip
        class="ma-2"
        v-for="(skill, index) in userData.skills"
        :key="index"
        close
        @click:close="removed(userData.user_id, skill)"
      >{{ skill }}</v-chip>
    </div>
  </v-card>
</template>
<script>
import axios from "../../axios-http";
export default {
  props: ["userData"],
  data: () => ({
    showSkillDialog: false,
    keySearch: null,
    model: "",
    skills: [],
    selectedSkills: [],
    showSkill: true,
  }),
  methods: {
    removed(alumni_id, skill) {
      this.$emit("deleteSkill", alumni_id, skill);
      this.skills.unshift(skill);
    },
    addSkill() {
      // this is the skills that we already have in database, and we want add it into alumni
      let validSkills = [];

      // this is the skills that we dont have in database, and we want add it into alumni and database
      let notExistSkills = [];
      if (
        this.keySearch !== null &&
        !this.selectedSkills.includes(this.keySearch)
      ) {
        this.selectedSkills.push(this.keySearch);
      }
      for (let skill of this.selectedSkills) {
        if (
          !this.userData.skills.includes(skill) &&
          this.skills.includes(skill)
        ) {
          validSkills.push(skill);
        } else if (
          !this.userData.skills.includes(skill) &&
          !this.skills.includes(skill)
        ) {
          validSkills.push(skill);
          notExistSkills.push(skill);
        }
      }
      let data = {
        alumni_id: this.userData.user_id,
        validSkills: validSkills,
        notExistSkills: notExistSkills,
      };
      axios.post("alumniskills/add", data).then(() => {
        this.showSkillDialog = false;
        this.keySearch = null;
        this.selectedSkills = [];
        this.$emit("addSkills", validSkills);
        this.skills = this.skills.filter(
          (skill) => !this.userData.skills.includes(skill)
        );
      });
    },
    cancel() {
      this.showSkillDialog = false;
      this.selectedSkills = null;
      this.keySearch = null;
    },
  },
  mounted() {
    axios.get("skills").then((res) => {
      this.skills = res.data.filter(
        (skill) => !this.userData.skills.includes(skill)
      );
    });
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
.createSkill {
  cursor: pointer;
}
</style>


