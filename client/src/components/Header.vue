<template>
  <v-app-bar color="black" absolute dark>
    <!-- LOGO -->
    <img src="../../public/img/logo.svg" width="55" height="55" class="my-1" />

    <v-spacer></v-spacer>

    <!-- Soll nur der Trainer sehen + on click soll ein neues Fenster geöfnet werden wo man Termine erstellen kann -->
    <v-dialog v-model="dialog" persistent max-width="600px">
      <template v-slot:activator="{ on, attrs }">
        <!-- Button -->
        <v-btn color="black" dark v-bind="attrs" v-on="on">
          <v-icon color="#009D2B">{{ mdiCalendarPlus }}</v-icon>
        </v-btn>

        <!--  -->
      </template>
      <v-card>
        <v-card-title>
          <span class="text-h5">User Profile</span>
        </v-card-title>
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
              <!-- Trainingsbeginn -->

              <v-col cols="11" sm="5">
                <v-menu
                  ref="menu2"
                  v-model="menu2"
                  :close-on-content-click="false"
                  :nudge-right="40"
                  :return-value.sync="tbTime"
                  transition="scale-transition"
                  offset-y
                  max-width="290px"
                  min-width="290px"
                >
                  <template v-slot:activator="{ on, attrs }">
                    <v-text-field
                      v-model="tbTime"
                      label="Uhrzeit"
                      prepend-icon="mdi-clock-time-four-outline"
                      readonly
                      v-bind="attrs"
                      v-on="on"
                    ></v-text-field>
                  </template>
                  <v-time-picker
                    v-if="menu2"
                    v-model="tbTime"
                    full-width
                    format="24hr"
                    @click:minute="$refs.menu2.save(tbTime)"
                  ></v-time-picker>
                </v-menu>
              </v-col>

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

              <!-- Ort -->
              <v-col cols="12">
                <v-text-field
                  label="Ort"
                  prepend-inner-icon="mdi-map-marker"
                  v-model="ort"
                ></v-text-field>
              </v-col>

              <!-- min PAX -->
              <v-col cols="12" sm="6">
                <v-text-field
                  label="Min. Teilnehmer"
                  v-model="minPax"
                ></v-text-field>
              </v-col>

              <!-- max PAX  -->
              <v-col cols="12" sm="6">
                <v-text-field
                  label="Max. Teilnehmer"
                  v-model="maxPax"
                ></v-text-field>
              </v-col>

              <!-- Trainingskosten -->
              <v-col cols="12" sm="6">
                <v-text-field label="Kosten" v-model="kosten"></v-text-field>
              </v-col>
            </v-row>
          </v-container>
          <!--  -->

          <!-- Vorerst ausblenden -->
          <!-- <small>*indicates required field</small> -->
        </v-card-text>
        <v-card-actions>
          <!-- CARD ENDE -->

          <v-spacer></v-spacer>
          <!-- On Click Close -> dialog = false-->
          <v-btn color="blue darken-1" text>
            Close
          </v-btn>
          <v-btn color="blue darken-1" text @click="createTraining()">
            Save
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-app-bar>
</template>

<script>
// ICON
import { mdiCalendarPlus } from '@mdi/js';

export default {
  data() {
    return {
      // ICON
      mdiCalendarPlus: mdiCalendarPlus,

      // MENU
      menu: '',
      menu2: '',
      menu3: '',

      // DIALOG
      dialog: false,

      // DATA
      tbDate: '',
      tbTime: '',
      anDate: '',
      ort: '',
      minPax: '',
      maxPax: '',
      kosten: '',
    };
  },

  methods: {
    createTraining() {
      console.log(this.tbDate);
      console.log(this.tbTime);
      console.log(this.anDate);
      console.log(this.ort);
      console.log(this.minPax);
      console.log(this.maxPax);
      console.log(this.kosten);

      this.dialog = false;

      return alert('In Progress');
    },
  },
};
</script>

<style lang="scss" scoped></style>
