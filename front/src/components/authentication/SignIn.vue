<template>
  <section>
    <div class="row">
      <div class="left">
        <img src="../../assets/Alumni-Logo.png" alt="" />
      </div>
      <div class="right">
        <img src="../../assets/topright.png" alt="" />
        <form-step-one
          v-if="onForm === 1"
          :invalidEmail="invalidEmail"
          @next="next"
          @submitFirstStep="submitStep1"
          @clearErrorMessage="$emit('clearErrorMessage')"
        ></form-step-one>
        <form-step-two
          v-else
          :role="role"
          :status="status"
          :invalidEmailOrPassword="invalidEmailOrPassword"
          @back="back"
          @submitSecondStep="submitStep2"
        ></form-step-two>
      </div>
    </div>
  </section>
</template>

<script>
import Step1 from "./step1Form.vue";
import Step2 from "./step2Form.vue";
export default {
  props: ["status", "invalidEmail", "invalidEmailOrPassword", 'role'],
  components: {
    "form-step-one": Step1,
    "form-step-two": Step2,
  },
  data() {
    return {
      onForm: 1,
    };
  },
  watch: {
    status: function (newStatus) {
      if (newStatus !== null) {
        this.next();
      }
    },
  },
  methods: {
    next() {
      this.onForm = 2;
    },
    back() {
      this.onForm = 1;
      this.$emit("clearSignInData");
    },
    submitStep1(email) {
      this.$emit("submitFirstStep", email);
    },
    submitStep2(data) {
      this.$emit("submitSecondStep", data);
    },
  },
  mounted() {
    this.$emit("clearSignInData");
  },
};
</script>
<style scoped>
.row {
  width: 100%;
  padding: 0px;
}
.left {
  background: white;
  width: 50%;
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  position: absolute;
  left: 0;
  top: 0;
}
.left > img {
  width: 70vh;
}
.right {
  background: white;
  width: 50%;
  height: 100vh;
  position: absolute;
  right: 0;
  top: 0;
}
.right > img {
  position: absolute;
  right: 0;
  top: 0;
  width: 100%;
  height: 20%;
}
@media (max-width: 600px) {
  .right {
    width: 100%;
  }
  .right > img {
    width: 100%;
    height: 15%;
  }
  .left {
    display: none;
  }
}
@media (min-width: 600px) and (max-width: 768px) {
  .right {
    width: 60%;
  }
  .right > img {
    width: 100%;
    height: 20%;
  }
  .left {
    width: 40%;
  }
  .left > img {
    width: 60vh;
  }
}
</style>
