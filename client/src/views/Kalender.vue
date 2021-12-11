<template>
  <v-row justify="center">
    <!-- Bei Doppelklick auf ein Datum bekommt Die Infos angezeigt -->
    <v-date-picker
      v-model="dates"
      :allowed-dates="allowedDates"
      multiple
      @click:date="dblClick"
      readonly
      header-color="green"
      color="green lighten-1"
    ></v-date-picker>
  </v-row>
</template>
<script>
export default {
  data: () => ({
    dates: [],
    
  }),

  methods: {
    dblClick(date) {
      alert(`You have just double clicked the following date: ${date}`);
    },
    allowedDates(){
        // Hier kann ich Datums erlauben oder nicht
        return ['2018-09-15', '2018-09-20']
    }
  },
};
</script>
