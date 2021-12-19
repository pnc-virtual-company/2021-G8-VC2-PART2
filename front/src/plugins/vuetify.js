import Vue from 'vue';
import Vuetify from 'vuetify/lib/framework';
import colors from "vuetify/lib/util/colors";

Vue.use(Vuetify);

export default new Vuetify({
  theme: {
    themes: {
      light: {
        primary: "#00A3FF", // #E53935
        secondary: "#1E88E5", // #FFCDD2
        accent: colors.indigo.base, // #3F51B5
      },
    },
  },
});
