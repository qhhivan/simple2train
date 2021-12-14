<template>
  <v-container white>
    <template v-slot:header>
      <v-toolbar class="mb-2" color="indigo darken-5" dark flat>
        <v-toolbar-title>This is a header</v-toolbar-title>
      </v-toolbar>
    </template>
    <v-card
      class="mx-auto ma-5"
      style="border: 3px solid black; background: none"
      max-width="1500"
      max-height="1000"
      oulined
    >
      <v-row text-center>
        <v-col cols="12" md="4">
          <v-subheader> Trainingsdeteils </v-subheader>

          <v-divider width="100%"></v-divider>
          <v-card-text>
            <div class="text-h6 font-weight-light">
              Training am: <b>{{ getTraining.datum.substring(0, 10) }}</b>
            </div>
            <div class="text-h6 font-weight-light">
              Beginn & Ende:
              <b>{{ getTraining.beginn.substring(0, 5) }} - {{ getTraining.ende.substring(0, 5) }}</b>
            </div>

            <div class="text-h6 font-weight-light">
              Frist: <b>{{ getTraining.eintragefrist.substring(0, 10) }}</b>
            </div>
            <div class="text-h6 font-weight-light">
              Ort: <b>{{ getTraining.ort }}</b>
            </div>
            <div class="text-h6 font-weight-light">
              Kosten: <b>{{ getTraining.kosten }} €</b>
            </div>
          </v-card-text>
        </v-col>
        <v-col>
          <v-subheader> Spieler </v-subheader>

          <v-divider width="100%"></v-divider>
          <v-card-text>
            <p class="text-h6">
              Eingeladene Spieler: <b>{{ teilnehmer.length }}</b>
            </p>

            <v-data-iterator :items="teilnehmer" hide-default-footer>
              <v-row>
                <v-col v-for="item of anzahlundStatus" :key="item.status">
                  <v-card height="100%" outlined>
                    <v-card-title
                      :class="`font-weight-light ${item.status == 'zugesagt' ? 'green' : 'none'} ${
                        item.status == 'abgelehnt' ? 'red' : 'none'
                      } ${item.status == 'ausstehend' ? 'blue' : 'none'}`"
                    >
                      {{ item.status.charAt(0).toUpperCase() + item.status.slice(1) }}:<b class="ml-1">{{
                        item.anzahl
                      }}</b>
                    </v-card-title>

                    <v-divider></v-divider>

                    <v-list class="pa-3">
                      <div v-for="s of teilnehmer" :key="s.teilnehmer_id">
                        <v-list-item v-if="s.status == item.status">
                          <v-list-item-content>{{ s.vorname }} {{ s.nachname }}</v-list-item-content>
                        </v-list-item>
                      </div>
                    </v-list>
                  </v-card>
                </v-col>
              </v-row>
            </v-data-iterator>
          </v-card-text>
        </v-col>
      </v-row>
      <v-card-actions>
        <v-btn text color="green accent-4" to="/"> Zurück </v-btn>
        <v-spacer></v-spacer>

        <v-dialog transition="dialog-top-transition" max-width="600">
          <template v-slot:activator="{ on, attrs }">
            <v-btn icon v-bind="attrs" v-on="on"><v-icon> mdi-delete </v-icon></v-btn>
          </template>
          <template v-slot:default="dialog">
            <v-card>
              <v-toolbar class="elevation-0 font-weight-bold" light>Bestätigung</v-toolbar>
              <v-card-text>
                <div class="pa-12 font-weight-light black--text text-h5 text-center">
                  Möchten Sie dieses Training wirklich löschen? Diesen Vorgang können Sie nicht rückgängig
                  machen. Möchten Sie fortfahren?
                </div>
              </v-card-text>
              <v-card-actions class="justify-end">
                <v-btn color="red darken-4" text @click="deleteTraining()">Delete</v-btn>
                <v-btn text @click="dialog.value = false">Close</v-btn>
              </v-card-actions>
            </v-card>
          </template>
        </v-dialog>
        <!-- <v-btn color="red darken-4" class="white--text" @click="deleteTraining()"> Training löschen </v-btn> -->
        <v-btn text color="green accent-4" :to="`/${getTraining.trainings_id}/details`"> Einladen </v-btn>
      </v-card-actions>
    </v-card>
  </v-container>
</template>

<script>
import axios from 'axios';

export default {
  props: {
    trainingsID: {
      type: String,
    },
    trainings: {
      type: Array,
    },
  },
  data() {
    return {
      teilnehmer: [],
      anzahlundStatus: [],
    };
  },
  created() {
    this.getDetailsOfId();
    this.getAnzahlUndStatus();
  },
  methods: {
    async getDetailsOfId() {
      try {
        const { data } = await axios({
          url: 'http://localhost:3000/training/' + this.trainingsID,
          method: 'GET',
        });
        this.teilnehmer = data;
      } catch (error) {
        console.error(error)
      }
    },
    async getAnzahlUndStatus() {
      try {
        const { data } = await axios({
          url: 'http://localhost:3000/trainingteilnehmer/' + this.trainingsID,
          method: 'GET',
        });
        this.anzahlundStatus = data;
      } catch (error) {
        console.error(error)
      }
    },
    async deleteTraining() {
      try {
        const { data } = await axios({
          url: 'http://localhost:3000/training/' + this.trainingsID,
          method: 'DELETE',
        });
        this.$emit('refreshTraining');
        this.$router.push('/');
        console.log(data);
      } catch (error) {
        console.error(error)
      }
    },
  },
  computed: {
    getTraining() {
      return this.trainings.find((el) => el.trainings_id == this.trainingsID);
    },
  },
};
</script>

<style lang="scss" scoped></style>
