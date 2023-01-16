public class LightningForgotPasswordControllerCustom {
    @AuraEnabled
    public static String forgotPassowordCustom(String username, String checkEmailUrl) {
        try {
            List<user> u = [select id from user where username =:username];
            
            //Site.forgotPassword(username);
            ApexPages.PageReference checkEmailRef = new PageReference(checkEmailUrl);
            if(!Site.isValidUsername(username)) {
                return Label.Site.invalid_email;
            }
            if(u.size()>0){
                System.resetPassword(u[0].Id, true);
            }
            //aura.redirect(checkEmailRef);
            
            return null;
        }
        catch (Exception ex) {
            return ex.getMessage();
        }
    }
}