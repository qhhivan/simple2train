<template>
  <v-card width="100%">
    <!-- Hintergrundbild -->
    <v-img height="264px" src="../../public/profil/fb-platz.jpg">
      <v-card-title class="white--text my-8 mx-2">
        <!-- Avatar -->
        
        <v-avatar size="100" class="my-2">
          <img alt="user" src="../../public/profil/pb.jpg"/>
        </v-avatar>
      </v-card-title>
    </v-img>
    <!-- Name -->

    <!-- TEXT -->
    <v-list three-line>
      <!-- Vorname -->
      <v-list-item>
        <v-list-item-icon> </v-list-item-icon>

        <v-list-item-content>
          <v-list-item-title>John</v-list-item-title>
          <v-list-item-subtitle>Vorname</v-list-item-subtitle>
        </v-list-item-content>
      </v-list-item>

      <v-divider inset></v-divider>

      <!-- Nachname -->
      <v-list-item>
        <v-list-item-icon> </v-list-item-icon>

        <v-list-item-content>
          <v-list-item-title>Doe</v-list-item-title>
          <v-list-item-subtitle>Nachname</v-list-item-subtitle>
        </v-list-item-content>
      </v-list-item>

      <v-divider inset></v-divider>

      <!-- MAIL -->
      <v-list-item>
        <v-list-item-icon>
          <v-icon color="green">
            {{ mdiCakeVariant }}
          </v-icon>
        </v-list-item-icon>

        <v-list-item-content>
          <v-list-item-title>15.04.1975</v-list-item-title>
          <v-list-item-subtitle>Geburtstag</v-list-item-subtitle>
        </v-list-item-content>
      </v-list-item>

      <v-divider inset></v-divider>

      <!-- Mail -->
      <v-list-item>
        <v-list-item-icon>
          <v-icon color="green">
            mdi-email
          </v-icon>
        </v-list-item-icon>

        <v-list-item-content>
          <v-list-item-title>doe.j75@htlwienwest.at</v-list-item-title>
          <v-list-item-subtitle>E-Mail</v-list-item-subtitle>
        </v-list-item-content>
      </v-list-item>

      <v-divider inset></v-divider>

      <v-list-item>
        <v-list-item-icon>
          <v-icon color="green">
            {{ mdiAccount }}
          </v-icon>
        </v-list-item-icon>

        <v-list-item-content>
          <v-list-item-title>Trainer</v-list-item-title>
          <v-list-item-subtitle>Rolle</v-list-item-subtitle>
        </v-list-item-content>
      </v-list-item>
    </v-list>
  </v-card>
</template>

<script>
import { mdiCakeVariant, mdiAccount } from '@mdi/js';

export default {
  data() {
    return {
      mdiCakeVariant: mdiCakeVariant,
      mdiAccount: mdiAccount,
    };
  },
};
</script>

<style lang="scss" scoped></style>
