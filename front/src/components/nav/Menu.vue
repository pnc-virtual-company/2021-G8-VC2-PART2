<template>
  <v-list nav dense>
    <v-list-item :to="{ path: '/myProfile' }">
      <v-list-item-icon>
        <v-icon>mdi-account</v-icon>
      </v-list-item-icon>
      <v-list-item-title>My Profile</v-list-item-title>
    </v-list-item>

    <v-list-item>
      <v-list-item-icon>
        <v-icon>mdi-calendar-today</v-icon>
      </v-list-item-icon>
      <v-list-item-title>Events</v-list-item-title>
    </v-list-item>

    <v-list-item>
      <v-list-item-icon>
        <v-icon>mdi-account-search</v-icon>
      </v-list-item-icon>
      <v-list-item-title>Explore Alumni</v-list-item-title>
    </v-list-item>
    <v-list-item>
      <v-list-item-icon>
        <v-icon>mdi-account-multiple</v-icon>
      </v-list-item-icon>
      <v-list-item-title>Manage Users</v-list-item-title>
    </v-list-item>
    <hr />
    <v-list-item>
      <v-list-item-icon>
        <v-icon>mdi-export</v-icon>
      </v-list-item-icon>
      <v-list-item-title>Logout</v-list-item-title>
    </v-list-item>
  </v-list>
</template>