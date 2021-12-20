<template>
    <section>
        <profile></profile>
        <employemt-view></employemt-view>
    </section>
</template>

<script>
import Profile from '../myProfile/Profile.vue';
import EmploymentView from '../myProfile/employment/EmploymentView.vue';

export default ({
    components: {
        'profile': Profile,
        'employemt-view': EmploymentView,
    }
})
</script>

<style scoped>
section {
    width: 50%;
    margin: auto;
    background: #F3F2EF;
}
@media (max-width:1070px){
    section{
        width: 90%;
    }
}
</style>