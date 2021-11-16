<template>
  <div class="container-fluid">
    <v-row><Header /></v-row>
    <v-row> <KWDatum /></v-row>

    <!-- <termin /> -->
    <!-- <menubar /> -->
  </div>
</template>

<script>
import Header from '@/components/Header';
import KWDatum from '@/components/KWDatum.vue';
// import Termin from '@/components/Termin.vue';
// import Menubar from '@/components/Menubar.vue';

export default {
  name: 'Home',

  components: {
    Header,
    KWDatum,
    // Termin,
    // Menubar,
  },
};
</script>
