<template>
  <v-bottom-navigation class=".align-self-center" outlned>
    <!-- Termine -->
    <v-btn class="my-auto" :to="'/'" >
      <span>Termine</span>

      <v-icon>{{ mdiCalendarText }}</v-icon>
    </v-btn>

    <!-- Kalender -->
    <v-btn class="my-auto" :to="'/kalender'">
      <span>Kalender</span>

      <v-icon>{{ mdiCalendarMonth }}</v-icon>
    </v-btn>

    <!-- Profil -->
    <v-btn class="my-auto" :to="'/profil'">
      <span>Profil</span>

      <v-icon>{{ mdiAccountCircleOutline }}</v-icon>
    </v-btn>
  </v-bottom-navigation>

  <!-- <v-icon width="24px" height="24px">{{ mdiCalendarMonth }}</v-icon>
  <v-icon large>{{ mdiCalendarText }}</v-icon>
  <v-icon large>{{ mdiAccountCircleOutline }}</v-icon> -->
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
