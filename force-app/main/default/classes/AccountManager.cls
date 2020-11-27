@RestResource(urlMapping='/Accounts/*')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        // grab the accountId from the end of the URL
        String accountId = request.requestURI.substringBetween('Accounts/', '/contacts');

        Account result = [SELECT ID, Name, (SELECT ID, Name FROM Contacts)
                        FROM Account
                        WHERE Id = :accountId];

        System.debug(result);
               
        return result;
        
    }
}