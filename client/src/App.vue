<template>
  <v-app>
    <!-- Header -->
    <v-app-bar app color="black" fixed absolute dark>
      <div class="d-flex align-center">
        <v-img
          alt="Vuetify Logo"
          class="shrink mr-2 my-2"
          contain
          src="logo.svg"
          transition="scale-transition"
          width="55"
          height="55"
        />
      </div>

      <v-spacer></v-spacer>

      <!-- Projekte hinzufügen -->
      <v-dialog
        transition="dialog-top-transition"
        v-model="dialog"
        persistent
        max-width="600px"
      >
        <!-- Create Icon -->
        <template v-slot:activator="{ on, attrs }">
          <v-btn color="black" dark v-bind="attrs" v-on="on">
            <v-icon color="#009D2B">{{ mdiCalendarPlus }}</v-icon>
          </v-btn>
        </template>
        <!--  -->

        <template v-slot:default="dialog">
          <v-card>
            <!-- Header -->
            <v-card-title>
              <v-toolbar class="elevation-0 text-h6 font-weight-bold" light
                >Training hinzufügen</v-toolbar
              >
            </v-card-title>
            <!--  -->

            <v-card-text>
              <v-container>
                <v-row>
                  <!-- Datum aus Kalender wählen -->
                  <v-col cols="12" sm="6" md="4">
                    <v-menu
                      ref="menu"
                      v-model="menu"
                      :close-on-content-click="false"
                      :return-value.sync="tbDate"
                      transition="scale-transition"
                      offset-y
                      min-width="auto"
                    >
                      <template v-slot:activator="{ on, attrs }">
                        <v-text-field
                          v-model="tbDate"
                          label="Datum"
                          prepend-icon="mdi-calendar"
                          readonly
                          v-bind="attrs"
                          v-on="on"
                        ></v-text-field>
                      </template>
                      <v-date-picker v-model="tbDate" no-title scrollable>
                        <v-spacer></v-spacer>
                        <v-btn text color="primary" @click="menu = false">
                          Cancel
                        </v-btn>

                        <v-btn
                          text
                          color="primary"
                          @click="$refs.menu.save(tbDate)"
                        >
                          OK
                        </v-btn>
                      </v-date-picker>
                    </v-menu>
                  </v-col>

                  <!-- Uhrzeit -->
                  <!-- Trainingsbeginn & Trainingsende -->

                  <v-col cols="11" sm="5">
                    <v-menu
                      ref="menu2"
                      v-model="menu2"
                      :close-on-content-click="false"
                      :nudge-right="40"
                      :return-value.sync="tbaTime"
                      transition="scale-transition"
                      offset-y
                      max-width="290px"
                      min-width="290px"
                    >
                      <template v-slot:activator="{ on, attrs }">
                        <v-text-field
                          v-model="tbaTime"
                          label="Trainingsbeginn"
                          prepend-icon="mdi-clock-time-four-outline"
                          readonly
                          v-bind="attrs"
                          v-on="on"
                        ></v-text-field>
                      </template>
                      <v-time-picker
                        v-if="menu2"
                        v-model="tbaTime"
                        full-width
                        format="24hr"
                        @click:minute="$refs.menu2.save(tbaTime)"
                      ></v-time-picker>
                    </v-menu>
                  </v-col>

                  <!-- Trainingsende  -->
                  <!-- <v-col cols="11" sm="5">
                    <v-menu
                      ref="menu2"
                      v-model="menu2"
                      :close-on-content-click="false"
                      :nudge-right="40"
                      :return-value.sync="tbeTime"
                      transition="scale-transition"
                      offset-y
                      max-width="290px"
                      min-width="290px"
                    >
                      <template v-slot:activator="{ on, attrs }">
                        <v-text-field
                          v-model="tbeTime"
                          label="Trainingsende"
                          prepend-icon="mdi-clock-time-four-outline"
                          readonly
                          v-bind="attrs"
                          v-on="on"
                        ></v-text-field>
                      </template>
                      <v-time-picker
                        v-if="menu2"
                        v-model="tbeTime"
                        full-width
                        format="24hr"
                        @click:minute="$refs.menu2.save(tbeTime)"
                      ></v-time-picker>
                    </v-menu>
                  </v-col> -->

                  <!-- Anmeldefrist  -->
                  <v-col cols="12" sm="6" md="4">
                    <v-menu
                      ref="menu3"
                      v-model="menu3"
                      :close-on-content-click="false"
                      :return-value.sync="anDate"
                      transition="scale-transition"
                      offset-y
                      min-width="auto"
                    >
                      <template v-slot:activator="{ on, attrs }">
                        <v-text-field
                          v-model="anDate"
                          label="Anmeldefrist"
                          prepend-icon="mdi-calendar"
                          readonly
                          v-bind="attrs"
                          v-on="on"
                        ></v-text-field>
                      </template>
                      <v-date-picker v-model="anDate" no-title scrollable>
                        <v-spacer></v-spacer>
                        <v-btn text color="primary" @click="menu3 = false">
                          Cancel
                        </v-btn>
                        <v-btn
                          text
                          color="primary"
                          @click="$refs.menu3.save(anDate)"
                        >
                          OK
                        </v-btn>
                      </v-date-picker>
                    </v-menu>
                  </v-col>

                  <v-col cols="12">
                    <v-text-field
                      label="Ort"
                      prepend-inner-icon="mdi-map-marker"
                      v-model="ort"
                    ></v-text-field>
                  </v-col>

                  <v-col cols="12" sm="6">
                    <v-text-field
                      label="Min. Teilnehmer"
                      v-model="minPax"
                      type="number"
                    ></v-text-field>
                  </v-col>

                  <v-col cols="12" sm="6">
                    <v-text-field
                      label="Max. Teilnehmer"
                      v-model="maxPax"
                      type="number"
                    ></v-text-field>
                  </v-col>

                  <v-col cols="12" sm="6">
                    <v-text-field
                      label="Kosten"
                      v-model="kosten"
                      type="number"
                    ></v-text-field>
                  </v-col>
                </v-row>
              </v-container>
            </v-card-text>

            <v-card-actions class="justify-end">
              <v-btn color="green darken-1" text @click="createTraining()"
                >Hinzufügen</v-btn
              >
              <v-btn text @click="dialog.value = false">Close</v-btn>
            </v-card-actions>
          </v-card>
        </template>
      </v-dialog>
    </v-app-bar>
    <!-- Header ENDE -->

    <!-- Main -->
    <v-main>
      <router-view :trainings="trainings" @refreshTraining="getTrainings()" />
    </v-main>
    <!-- MAIN ENDE -->

    <!-- Bottom NAV -->
    <!-- Bottom nav ist nicht fix da die trainings mehr platz einnehmen und das unterhalb ist 
    ich muss es fixieren das man die trainings scrollen kann -->
    <v-bottom-navigation class=".align-self-center" outlned>
      <!-- Termine -->
      <v-btn class="my-auto" :to="'/'">
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
    <!-- BOTTOM NAV ENDE -->
  </v-app>
</template>

<script>
import axios from 'axios';

import {
  mdiCalendarMonth,
  mdiCalendarText,
  mdiAccountCircleOutline,
  mdiCalendarPlus,
} from '@mdi/js';

export default {
  name: 'App',

  data() {
    return {
      // KA
      dialog: '',
      trainings: [],

      tbDate: '',
      tbaTime: '',
      tbeTime: '',
      anDate: '',
      ort: '',
      minPax: '',
      maxPax: '',
      kosten: '',
      tbFrist: '',

      menu: '',
      menu2: '',
      menu3: '',

      mdiCalendarMonth: mdiCalendarMonth,
      mdiCalendarText: mdiCalendarText,
      mdiAccountCircleOutline: mdiAccountCircleOutline,
      mdiCalendarPlus: mdiCalendarPlus,
    };
  },
  created() {
    this.getTrainings();
  },
  methods: {
    async getTrainings() {
      const { data } = await axios({
        url: 'http://localhost:3000/trainings',
        method: 'GET',
        contentType: 'application/json',
        data: {
          datum: this.tbDate,
          beginn: this.tbaTime,
          ort: this.ort,
          kosten: this.kosten,
          minimum: this.minPax,
          maximum: this.maxPax,
          ende: this.tbeTime,
          eintragungsfrist: this.tbFrist,
        },
      });
      this.trainings = data;
      console.log('Andere');
      console.log(data);
    },
    async createTraining() {
      let data = {
      tbDate: this.tbDate,
      tbaTime: this.tbaTime,
      tbeTime: this.tbeTime,
      anDate: this.anDate,
      ort: this.ort,
      minPax: this.minPax,
      maxPax: this.maxPax,
      kosten: this.kosten,
      tbFrist: this.tbFrist,
    }
      // const { data } = await axios({
      //   url: 'http://localhost:3000/trainings',
      //   method: 'POST',
      // });
      // this.trainings = data;
      console.log('Andere');
      console.log(data);
    },
  },
};
</script>
