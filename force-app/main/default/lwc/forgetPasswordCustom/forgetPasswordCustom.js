import { api, LightningElement, track, wire } from 'lwc';
import forgotPassword from '@salesforce/apex/LightningForgotPasswordControllerCustom.forgotPassowordCustom';
import { NavigationMixin } from 'lightning/navigation';

export default class ForgotPassword extends NavigationMixin(LightningElement) {
    username='';
    resetPassword;
    @api checkEmailUrl="./CheckPasswordResetEmail";
    @api submitButtonLabel="Reset Password";
    @api usernameLabel="Username";
    expid;
    showError='false';
    errorMessage;
    baseUrl;


    handlechange(event){
        this.username=event.detail.value;
    }
    handleForgotPassword(event) {
        
       forgotPassword({username:this.username,checkEmailUrl:this.checkEmailUrl})
       .then(result => {
            if(result!=null){
                this.errorMessage = result;
            }else{
                window.location.href = window.location.origin+'/s/login/CheckPasswordResetEmail';
            }
        })
    .catch((error)=> {
        this.error = error; 
        this.errorMessage = error.body.message;
    });
    } 
}