<template>
  <v-app>
    <Header />
  <!-- <v-spacer></v-spacer> -->
    <v-main class="mt-8">
      <router-view />
    </v-main>
    <menubar fixed/>
  </v-app>
</template>

<script>
import Menubar from '@/components/Menubar.vue';
import Header from '@/components/Header.vue';

export default {
  name: 'App',
  components: {
    Menubar,
    Header,
  },
  data: () => ({
    //
  }),
};
</script>
