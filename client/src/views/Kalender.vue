<template>
  <v-container fluid>
    <!-- Bei Doppelklick auf ein Datum bekommt Die Infos angezeigt -->
    <v-spacer></v-spacer>

    <v-date-picker
      class="mt-5"
      width="100%"
      v-model="dates"
      :allowed-dates="allowedDates"
      multiple
      @click:date="filterTraining"
      readonly
      header-color="green"
      color="green lighten-1"
      show-adjacent-months
      show-current
      picker-date
      selected-items-text="Monat"
    ></v-date-picker>

    <!-- Trainings -->
    <!-- Alle Trainings anzeigen und on click filtern -->
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

      <!-- Details vorerst weg weil beim Close man auf die Startseite kommt -->
      <!-- <v-card-actions>
        <v-btn text color="green accent-4" :to="`/${t.trainings_id}/details`"> Details </v-btn>
      </v-card-actions> -->

      <!-- <v-card-actions class="justify-center">
        Button zum entscheiden ob man kommt oder nicht
        <v-btn outlined rounded text> Ja </v-btn>
        <v-btn outlined rounded text> Vlt </v-btn>
        <v-btn outlined rounded text> Nein </v-btn>
      </v-card-actions> -->
    </v-card>
    <!-- ENDE -->
  </v-container>
</template>

<script>
import { mdiVlc } from '@mdi/js';

export default {
  name: 'Kalender',
  props: {
    trainings: {
      type: Array,
    },
  },

  data() {
    return {
      dates: [
        '2022-02-15',
        '2022-02-20',
        '2022-02-01',
        '2022-02-27',
        '2022-02-24',
      ],
      trainingsTermine: [],

      icon: mdiVlc,
      text: 'JA',
    };
  },
  created() {
    this.filterTraining();
  },
  methods: {
    filterTraining() {
      console.log('this.trainings');
      console.log(this.trainings);
      for (var i = 0; i < this.trainings.length; i++) {
        this.trainingsTermine.push(this.trainings[i].datum);
      }
      console.log('this.trainings[i].datum');
      console.log(this.trainings);
      // this.dates = this.trainingsTermine;
      // console.log('this.dates');
      // console.log(this.dates);
    },
    allowedDates() {
      // Hier kann ich Datums erlauben oder nicht
      return ['2018-09-15', '2018-09-20'];
    },
  },
};
</script>
