<template>
  <div>
    <!-- Headline -->
    <v-card
      class="mx-auto my-5"
      max-width="344"
      outlined
      v-for="t in trainings"
      v-bind:key="t.date"
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
            >{{ t.beginn.substring(0, 5) }} - {{ t.ende.substring(0, 5) }}</span
          >
        </div>
        <div class="text--primary mt-1 ml-9">
          <span class="font-weight-bold"> Anmeldefrist: </span>
          <v-chip class="red white--text">{{
            t.eintragefrist.substring(0, 10)
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
      <!-- Button zum entscheiden ob man kommt oder nicht -->
      <v-card-actions class="justify-center mt-2">
        <v-btn-toggle>
          <v-btn
            outlined
            rounded
            text
            color="green"
            @click="status('JA')"
            active
          >
            Ja
          </v-btn>
          <v-btn outlined rounded text color="orange" @click="status('VLT')"
            >?</v-btn
          >
          <v-btn outlined rounded text color="red" @click="status('NEIN')">
            Nein
          </v-btn>
        </v-btn-toggle>
      </v-card-actions>
    </v-card>
  </div>
</template>

<script>
// Icons
import { mdiVlc } from '@mdi/js';
export default {
  props: {
    trainings: {
      type: Array,
    },
  },

  data() {
    return {
      icon: mdiVlc,
      text: 'JA',
    };
  },
  methods: {
    status(anws) {
      console.log(anws);
      // Schauen ob das schon angekreutzt ist
      // Wenn nicht löschen aus der Datenbank
      // Neues einfügen
    },
  },
};
</script>

<style lang="scss" scoped></style>
