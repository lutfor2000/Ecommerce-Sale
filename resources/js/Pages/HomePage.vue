<script setup>
    import { Link } from '@inertiajs/vue3';
    import NavLayout from '../Layout/NavLayout.vue';
</script>

<template>
    <NavLayout>
        <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-7 col-lg-6 center-screen">
                <div class="card animated fadeIn w-90  p-4">
                    <div class="card-body">
                        <h4>Sales Inventory </h4>
                        <Link href="/login" class="btn w-100 btn-success">Start </Link>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </NavLayout>
</template>

<style scoped>
    .card{
    box-shadow: rgba(43, 245, 161, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px 6px;
}
</style>
