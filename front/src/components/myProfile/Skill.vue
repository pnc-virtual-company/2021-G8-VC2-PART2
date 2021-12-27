<template>
  <v-card class="mt-5 mb-4 pa-4 rounded-lg">
    <v-row class="mb-1">
      <v-col cols="8" sm="3" md="5">
        <h3>Skills</h3>
      </v-col>

      <v-col class="add-info">
        <v-dialog v-model="addSkill" persistent max-width="400px">
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
                  <v-autocomplete
                    prepend-inner-icon="mdi-checkbox-multiple-marked"
                    :items="[
                      'Skiing',
                      'Ice hockey',
                      'Soccer',
                      'Basketball',
                      'Hockey',
                      'Reading',
                      'Writing',
                      'Coding',
                      'Basejump',
                    ]"
                    label="Interests"
                    multiple
                  ></v-autocomplete>
                </v-col>
              </v-row>
            </v-card-text>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="white" @click="addSkill = false"> Cancel </v-btn>
              <v-btn color="primary" @click="addSkill = false"> Create </v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
      </v-col>
    </v-row>

    <div class="text-left" v-for="skill in skills" :key="skill.id">
      <v-chip class="ma-2" close @click="removed(skill)">
        {{skill.name}}
      </v-chip>
      
    </div>
  </v-card>
</template>
<script>
export default {
  data: () => ({
    editSkill: false,
    addSkill: false,
    skills:[
      { id: 1 , name: "Mobile Developer"},
      { id: 2 , name: "Web Developer"},
      { id: 3 , name: "IT Admin"},
      { id: 4 , name: "IT support"},
      { id: 5, name: "Tester"}
    ]
    
  }),
  methods: {
    removed(skill){
      this.skills.splice(skill);
      console.log(this.skills);
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
</style>