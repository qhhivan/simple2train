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
      selected-items-text="// Jetziger Monat"
    ></v-date-picker>

<!-- Trainings -->
<!-- Alle Trainings anzeigen und on click filtern -->
    <!-- Vorzeige -->
    <v-card class="mx-auto mt-8" max-width="344" outlined v-for="t in termine" v-bind:key="t.date">
      <v-list-item three-line>
        <v-list-item-content>
          <v-list-item-title class="text-h6 mb-1">
            <!-- Trainings Logo -->
            <v-icon class="mr-3" color="orange darken-2">{{ icon }}</v-icon>
            <!-- Tag Datum -->
            {{ t.day }} {{ t.date }}
          </v-list-item-title>
          <div class="text--primary mt-1 ml-11">
            <span class="font-weight-bold"> Treffpunkt: </span>
            {{ t.time }}
          </div>
          <div class="text--primary mt-1 ml-11">
            <span class="font-weight-bold"> Anmeldefrist: </span>
            {{ t.deadlineTime }} - {{ t.deadlineDate }}
          </div>
          <div class="text--primary mt-1 ml-11">
            <span class="font-weight-bold"> Kosten: </span>
            {{ t.kosten }}
          </div>
        </v-list-item-content>
      </v-list-item>
    </v-card>
  </v-container>
</template>

<script>
import { mdiVlc } from '@mdi/js';

export default {
  data: () => ({
    dates: ['2021-12-15', '2021-12-20', '2021-12-01', '2021-12-29', '2021-12-24'],

    icon: mdiVlc,
    text: 'JA',

    termine: [
      {
        date: '15.12.2021',
        day: 'Montag - ',
        time: '20:00',
        tp: '19:45',
        deadlineTime: '19:45',
        deadlineDate: '24.10.2021',
        kosten: '2 €',
      },
    ],
  }),

  methods: {
    filterTraining(date) {
      alert(`Hier wird ein Training vom: ${date} gefiltert`);
    },
    allowedDates() {
      // Hier kann ich Datums erlauben oder nicht
      return ['2018-09-15', '2018-09-20'];
    },
  },
};
</script>
