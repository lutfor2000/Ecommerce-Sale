<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-7 animated fadeIn col-lg-4 center-screen">
                <div class="card w-100">
                    <div class="card-header bg-success text-light"><h4>SIGN IN</h4></div>
                    <form @submit.prevent="submit">
                        <div class="card-body">
                            <br/>
                            <input id="email" v-model="form.email"  placeholder="User Email" class="form-control" type="email"/>
                            <br/>
                            <input id="password" v-model="form.password" placeholder="User Password" class="form-control" type="password"/>
                            <br/>
                            <button type="submit" class="btn w-100 btn-success">Login</button>
                            <hr/>
                            <div class="float-end mt-3 pb-4">
                            <span>
                                <Link class="text-center ms-3 h6 text-d" href="/registration">Sign Up </Link>
                                <span class="ms-1">|</span>
                                <Link class="text-center ms-3 h6 text-d" href="send-otp">Forget Password</Link>
                            </span>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
  import { Link, useForm, usePage, router } from "@inertiajs/vue3";
  import { createToaster } from "@meforma/vue-toaster";

  const toaster = createToaster({ position: "top-right" });

  const form = useForm({  email: "",password: "" });
  const page = usePage();

    function submit(){
        if (form.email.length === 0) {
            toaster.warning("Email is required")
        }
        else if(form.password.length === 0){
            toaster.warning("password is required")
        }
        else{
            form.post("/user-login", {
                onSuccess: () => {
                    if(page.props.flash.status === true){
                        router.get('/DashboardPage');
                        toaster.success("Login successful");
                    }else{
                        toaster.error(page.props.flash.message);
                    }
                }
            });
        }
    }


</script>



<style scoped>
.text-d{
    text-decoration: none !important;
}
.card{
    box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px 6px;
}

</style>