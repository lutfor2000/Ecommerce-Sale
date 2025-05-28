<template>
    <div class="container-fluid">
        <div class="row d-flex justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <div class="float-end">
                            <Link href="/CustomerPage" class="btn btn-success mx-3 btn-sm">
                                Back
                            </Link>
                        </div>
                        <form @submit.prevent="submit">
                            <div class="card-body">
                                <h4>Save Customer</h4>
                                <input id="name" v-model="form.name" name="name"  placeholder="Customer Name"
                                    class="form-control" type="text" />
                                <br />
                                <input id="email" v-model="form.email" name="email"  placeholder="Customer Email"
                                    class="form-control" type="email" />
                                <br />
                                <input id="mobile" v-model="form.mobile" name="phone"  placeholder="Customer Phone"
                                    class="form-control" type="text" />
                                <br />
                                <button type="submit" class="btn w-100 btn-success">Save Change</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
    import { Link, useForm, usePage, router } from "@inertiajs/vue3";
    import { createToaster } from "@meforma/vue-toaster";
    const toaster = createToaster({ position: "top-right" });
    import {ref } from "vue";

    const urlParams = new URLSearchParams(window.location.search);
    let id = ref(parseInt(urlParams.get("id")));

    const form = useForm({name: "",email:"",mobile:"",id: id})
    const page = usePage()

    let URL = "/create-customer"
    let list = page.props.customer

    if(id.value !== 0 && list !== null){
        URL = "update-customer";
        form.name = list['name']
        form.id = list['id']
        form.email = list['email']
        form.mobile = list['mobile']
    }


    function submit(){
        if (form.name.length === 0) {
            toaster.warning("Name is required");
        }
        else if(form.email.length === 0){
            toaster.warning("Email is required");
        }
        else if(form.mobile.length === 0){
            toaster.warning("Phone Number is required");
        }else{

            form.post(URL,{
                onSuccess: () =>{

                    if (page.props.flash.status === true) {

                        setTimeout(()=>{
                            router.get('/CustomerPage'); 
                        },500)

                        toaster.success(page.props.flash.message);
                    } else {
                        toaster.error(page.props.flash.message);
                    }
                }

            });//end form

        }

    }

</script>

<style>

</style>