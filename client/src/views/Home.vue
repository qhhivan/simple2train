<template>
  <v-container class="d-flex flex-wrap">
    <TerminTrainer :trainings="trainings" class="mx-auto" />
    <!-- <TerminSpieler :trainings="trainings" class="mx-auto"/> -->
  </v-container>
</template>

<script>
import { mdiVlc } from '@mdi/js';
// import TerminSpieler from '@/components/TerminSpieler.vue';
import TerminTrainer from '@/components/TerminTrainer.vue';

export default {
  name: 'Home',
  props: {
    trainings: {
      type: Array,
    },
  },
  components: {
    TerminTrainer,
    // TerminSpieler
  },

  data() {
    return {
      icon: mdiVlc,
    };
  },
};
</script>
