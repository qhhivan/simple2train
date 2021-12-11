<template>
  <v-container>
    <v-row>
      <v-card color="green" dark width="100%" height="100">
        <!-- Vom Handy holen wenn wir PWA gelernt haben -->
        <!-- Kalenderwoche -->
        <v-col>KW: {{ kw }}</v-col>

        <v-col>
          <!-- Erster Tag der Kalenderwoche -->
          MO {{ start }} -
          <!-- Letzter Tag der Kalenderwoche -->
          SO {{ finish }}
        </v-col>
      </v-card>
    </v-row>
  </v-container>
</template>

<script>
export default {
  data() {
    return {
      kw: '45',
      start: ' 08.11.2021',
      finish: '14.11.2021',
    };
  },
};
</script>

<style lang="scss" scoped></style>
