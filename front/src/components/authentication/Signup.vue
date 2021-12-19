<template>
  <section>
    <div class="row">
      <div class="left">
        <img src="../../assets/Alumni-Logo.png" alt="" />
      </div>
      <div class="right">
        <img src="../../assets/topright.png" alt="" />
        <form-step-one v-if="onForm === 1" @next="next"></form-step-one>
        <form-step-two v-else @back="back"></form-step-two>
      </div>
    </div>
  </section>
</template>

<script>
import Step1 from "./step1Form.vue";
import Step2 from "./step2Form.vue";
export default {
  components: {
    "form-step-one": Step1,
    "form-step-two": Step2,
  },
  data() {
    return {
      onForm: 1,
    }
  },
  methods: {
    next() {
      this.onForm = 2;
    },
    back() {
      this.onForm = 1;
    }
  },
};
</script>
<style scoped>
.row {
  width: 100%;
  display: flex;
}
.left {
  width: 50%;
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
}
.left > img {
  width: 70vh;
}
.right {
  width: 50%;
  height: 100vh;
}
.right > img {
  position: absolute;
  right: 0;
  top: 0;
  width: 51.2%;
  height: 20vh;
}
</style>
