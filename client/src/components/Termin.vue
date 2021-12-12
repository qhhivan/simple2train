<template>
  <div>
    <!-- Headline -->
    <v-card
      class="mx-auto my-5"
      max-width="344"
      outlined
      v-for="t in termine"
      v-bind:key="t.date"
    >
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
      <!-- Button zum entscheiden ob man kommt oder nicht -->
      <v-card-actions class="justify-center mt-2">
        <v-btn outlined rounded text>
          Ja
        </v-btn>
        <v-btn outlined rounded text>
          Vlt
        </v-btn>

        <!-- Vorzeige Farbe -->
        <v-btn outlined rounded text>
          Nein
        </v-btn>
      </v-card-actions>
    </v-card>
  </div>
</template>

<script>
// Icons
import { mdiVlc } from '@mdi/js';
export default {
  data() {
    return {
      icon: mdiVlc,
      text: 'JA',

      // termin: {
      //   date: '25.10.2021',
      //   day: 'Montag - ',
      //   time: '20:00',
      //   tp: '19:45',
      //   deadlineTime: '19:45',
      //   deadlineDate: '24.10.2021',
      //   kosten: '2€',
      // },
      termine: [
        {
          date: '25.10.2021',
          day: 'Montag - ',
          time: '20:00',
          tp: '19:45',
          deadlineTime: '19:45',
          deadlineDate: '24.10.2021',
          kosten: '2€',
        },
        {
          date: '28.10.2021',
          day: 'Samstag - ',
          time: '19:30',
          tp: '19:15',
          deadlineTime: '19:15',
          deadlineDate: '27.10.2021',
          kosten: '0€',
        },
        {
          date: '29.10.2021',
          day: 'Sonntag - ',
          time: '11:00',
          tp: '10:45',
          deadlineTime: '10:45',
          deadlineDate: '28.10.2021',
          kosten: '7€',
        },
      ],
    };
  },
};
</script>

<style lang="scss" scoped></style>
