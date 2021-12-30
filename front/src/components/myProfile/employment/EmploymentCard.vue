<template>
  <section>
    <v-card class="ma-0 pa-2 elevation-0 rounded-lg emp-card">
      <!-- confirm delete -->
      <v-dialog
        persistent
        v-model="confirmDeleteialog"
        :max-width="options.width"
        :style="{ zIndex: options.zIndex }"
      >
        <v-card>
          <v-card-title class="mx-auto text--h6"
            >Are you sure want to delete this record?</v-card-title
          >
          <v-divider></v-divider>

          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn
              color="grey--text"
              small
              text
              @click="confirmDeleteialog = false"
            >
              Cancel
            </v-btn>
            <v-btn
              color="red"
              small
              text
              @click="deleteEmployment(employment.id)"
            >
              Ok
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
      <!-- end confirm dialog -->
      <v-row>
        <v-col>
          <v-list-item class="ma-0 pa-0">
            <v-avatar class="mr-3" size="50px">
              <img :src="imageUrl + employment.logo" alt="Company Logo" />
            </v-avatar>
            <v-list-item-title>
              <v-flex class="d-flex">
                <v-list-item-title>{{
                  employment.workPosition
                }}</v-list-item-title>
                <v-menu bottom left>
                  <template v-slot:activator="{ on, attrs }">
                    <v-btn icon v-bind="attrs" v-on="on">
                      <v-icon>mdi-dots-vertical</v-icon>
                    </v-btn>
                  </template>

                  <v-list>
                    <v-list-item>
                      <div>
                        <small class="options1" @click="showForm(employment.id)">
                          <v-icon color="primary">mdi-pencil-circle</v-icon>
                          EDIT
                        </small>
                        <br />
                        <v-divider></v-divider>
                        <small
                          class="options2"
                          color="red"
                          @click="confirmDeleteialog = true"
                        >
                          <v-icon color="red">mdi-delete-circle</v-icon>
                          DELETE
                        </small>
                      </div>
                    </v-list-item>
                  </v-list>
                </v-menu>
              </v-flex>

              <small>{{ employment.company_name }}</small>
              <br />
              <small
                >{{ getStartJobDate }} - {{ getEndJobDate }}.
                {{ employment.location }}</small
              >
            </v-list-item-title>
          </v-list-item>
        </v-col>
      </v-row>
      <v-divider class="mt-2"></v-divider>
    </v-card>
  </section>
</template>

<script>
import axios from "../../../axios-http.js";
export default {
  props: ["employment"],
  data: () => ({
    imageUrl: "http://127.0.0.1:8000/storage/profiles/",
    confirmDeleteialog: false,
    options: {
      color: "grey lighten-3",
      width: 400,
      zIndex: 200,
      noconfirm: false,
    },
  }),
  watch: {
    model(val) {
      if (val.length > 5) {
        this.$nextTick(() => this.model.pop());
      }
    },
  },
  computed: {
    getEndJobDate() {
      if (this.employment.startJobDate === this.employment.endJobDate) {
        return "Present";
      }
      return this.employment.endJobDate.replace("-", "/").replace("-", "/");
    },
    getStartJobDate() {
      return this.employment.startJobDate.replace("-", "/").replace("-", "/");
    },
  },
  methods: {
    createCompa() {
      this.showAddCompanyForm = true;
    },
    fileChange(e) {
      let file = e.target.files[0];
      this.companyPic = URL.createObjectURL(file);
    },

    deleteEmployment(id) {
      axios.delete("employments/" + id).then((res) => {
        console.log(res.data.massage);
        this.confirmDeleteialog = false;
        this.$emit("deleteEmployment", id);
      });
    },
    showForm(id) {
      this.$emit('showEditForm', id);
    }
  },
};
</script>

<style scoped>
.v-dialog > .v-card > .v-card__title {
  font-size: 17px;
  font-weight: 200;
  letter-spacing: 0.0125em;
  padding: 16px 24px 10px;
}
.option {
  display: flex;
  justify-content: flex-end;
}
.emp-card:hover {
  background: #f5f4f3;
}
.options1,
.options2 {
  cursor: pointer;
}
.options1:hover {
  color: #00a3ff;
}
.options2:hover {
  color: red;
}
.companyImage {
  width: 100px;
  cursor: pointer;
  border-radius: 50%;
}
.image-upload > input {
  display: none;
}
.createCompany {
  cursor: pointer;
}
</style>
