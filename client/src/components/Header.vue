<template>
  <v-card color="black" absolute dark>
    <!-- LOGO -->
    <img src="../../public/img/logo.svg" width="55" height="55" class="my-1" />

    <v-spacer></v-spacer>

    <!-- Soll nur der Trainer sehen + on click soll ein neues Fenster geöfnet werden wo man Termine erstellen kann -->
    <v-icon color="#009D2B" @click="createTraining()">{{
      mdiCalendarPlus
    }}</v-icon>
  </v-card>
</template>

<script>
// ICON
import { mdiCalendarPlus } from '@mdi/js';

export default {
  data() {
    return {
      mdiCalendarPlus: mdiCalendarPlus,
    };
  },

  methods: {
    createTraining() {
      return alert('In Progress');
    },
  },
};
</script>

<style lang="scss" scoped></style>
