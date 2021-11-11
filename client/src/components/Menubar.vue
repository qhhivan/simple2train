<template>
  <v-app-bar color="black" absolute dark>
    <!-- Terminübersicht / Home -->
    <!-- Kalender -->
    <!-- Profil -->
    <v-icon width="24px" height="24px">{{ mdiCalendarMonth }}</v-icon>
    <v-icon large>{{ mdiCalendarText }}</v-icon>
    <v-icon large>{{ mdiAccountCircleOutline }}</v-icon>
  </v-app-bar>
</template>

<script>
import {
  mdiCalendarMonth,
  mdiCalendarText,
  mdiAccountCircleOutline,
} from '@mdi/js';
export default {
  data() {
    return {
      mdiCalendarMonth: mdiCalendarMonth,
      mdiCalendarText: mdiCalendarText,
      mdiAccountCircleOutline: mdiAccountCircleOutline,
    };
  },
};
</script>

<style lang="scss" scoped></style>
