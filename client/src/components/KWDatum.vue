<template>
  <v-app-bar color="black" absolute dark>
    <!-- Vom Handy holen wenn wir PWA gelernt haben -->
    <!-- Kalenderwoche -->
    KW: {{ kw }}

    <v-spacer></v-spacer>

    <!-- Erster Tag der Kalenderwoche -->
    MO {{ start }} -
    <!-- Letzter Tag der Kalenderwoche -->
    SO {{ finish }}
  </v-app-bar>
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
