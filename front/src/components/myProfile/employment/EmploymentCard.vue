<template>
  <v-container>
    <v-card justify="center">

      <v-expansion-panels>
        <v-expansion-panel
          v-for="(message, i) in messages"
          :key="i"
        >
          <v-expansion-panel-header>
            <v-row
              align="center"
              class="spacer"
            >
              <v-col
                cols="4"
                sm="2"
                md="1"
              >
                <v-avatar
                  size="36px"
                >
                  <img
                    alt="Avatar"
                    src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFJFVGbYZEtuty-p4ll8fevPzLvv7MOK9vJA&usqp=CAU"
                  >
                 
                </v-avatar>
              </v-col>
              <v-col
                class="hidden-xs-only"
                sm="5"
                md="3"
              >
                <strong v-html="message.name"></strong>
              </v-col>
            </v-row>
          </v-expansion-panel-header>
        </v-expansion-panel>
      </v-expansion-panels>
    </v-card>
  </v-container>
</template>

<script>
  export default {
    data: () => ({
      messages: [
        {
          avatar: 'https://avatars0.githubusercontent.com/u/9064066?v=4&s=460',
          name: 'John Leider',
          
        },
        {
          avatar: 'mdi-account-multiple',
          name: 'Social',
          
        },
        {
          
          avatar: 'mdi-tag',
          name: 'Promos',
        },
      ],
    }),
  }
</script>

<style scoped>

</style>