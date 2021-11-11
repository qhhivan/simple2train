<template>
  <div>
    Trainings überblick
    <v-icon>{{ termin.icon }}</v-icon>
  </div>
</template>

<script>
// Icons
import { mdiVlc } from '@mdi/js';
export default {
  data() {
    return {
      termin: {
        icon: mdiVlc,
        date: '25.10.2021',
        day: 'MO',
        time: '20:00',
        tp: '19:45',
        deadlineTime: '19:45',
        deadlineDate: '24.10.2021',
      },
    };
  },
};
</script>

<style lang="scss" scoped></style>
