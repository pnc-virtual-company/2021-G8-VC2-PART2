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
                    multiple
                  ></v-combobox>
                </v-col>
              </v-row>
            </v-card-text>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="white" v-if="leave" @click="cancel"> Cancel </v-btn>
              <v-btn color="primary" v-if="leave" @click="addSkill" > Create </v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
      </v-col>
    </v-row>

    <div class="text-left" >
      <v-chip class="ma-2" v-for="(skill,index) in added_skill" :key="index" close @click:close="removed(index)">
        {{skill}}
      </v-chip>
      
    </div>
  </v-card>
</template>
<script>
export default {
  props:["skills"],
  data: () => ({
    leave: false,
    added_skill: [],
    getInputSkill: "",
  }),
  methods: {
    removed(index){
      this.added_skill.splice(index,1);
    },
    addSkill(){
      if(this.getInputSkill != ""){
        for(let n in this.getInputSkill){
          this.added_skill.push(this.getInputSkill[n]);
        }
        for(let s in this.added_skill){
          this.skills.push(this.added_skill[s]);
        }
        this.leave = false;
      }
    },
    cancel(){
       this.leave = false;
    },
    
    
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