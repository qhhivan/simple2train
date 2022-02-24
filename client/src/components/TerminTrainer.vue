<template>
  <v-container>
    <!-- Termin Card -->
    <v-card
      class="mx-auto ma-3"
      max-width="500"
      width="350"
      v-for="t of trainings"
      :key="t.trainings_id"
    >
      <v-card-text>
        <div>
          <v-icon class="mr-3" color="orange darken-2">{{ icon }}</v-icon>
          <span class="text-h6 black--text"
            >Training am: {{ t.datum.substring(0, 10) }}</span
          >
        </div>
        <div class="text--primary mt-5 ml-9">
          <v-icon small>mdi-clock-time-nine-outline</v-icon
          ><span class="ml-2"
            >{{ t.beginn.substring(0, 5) }}</span
          >
        </div>
        <div class="text--primary mt-1 ml-9">
          <span class="font-weight-bold"> Anmeldefrist: </span>
          <v-chip class="red white--text">{{
            t.anmeldefrist.substring(0, 10)
          }}</v-chip>
        </div>
        <div class="text--primary mt-1 ml-9">
          <span class="font-weight-bold"> Kosten: </span>
          {{ t.kosten }} €
        </div>
        <div class="text--primary mt-1 ml-9">
          <span class="font-weight-bold"> Ort: </span>
          {{ t.ort }}
        </div>
      </v-card-text>
      <v-card-actions>
        <v-btn text color="green accent-4" :to="`/${t.trainings_id}/details`">
          Details
        </v-btn>
      </v-card-actions>

      <!-- <v-card-actions class="justify-center">
        Button zum entscheiden ob man kommt oder nicht
        <v-btn outlined rounded text> Ja </v-btn>
        <v-btn outlined rounded text> Vlt </v-btn>
        <v-btn outlined rounded text> Nein </v-btn>
      </v-card-actions> -->
    </v-card>
  </v-container>
</template>

<script>
// Icons
import { mdiVlc } from '@mdi/js';

export default {
  name: 'Home',
  props: {
    trainings: {
      type: Array,
    },
  },

  data() {
    return {
      icon: mdiVlc,
    };
  },
};
</script>

<style lang="scss" scoped></style>
