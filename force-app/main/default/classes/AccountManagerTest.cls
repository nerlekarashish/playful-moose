@IsTest
public class AccountManagerTest {
    @isTest static void testGetAccount() {
     
        String testAccountId = createTestRecord(2);
     
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://playful-moose-wh9di3-dev-ed.my.salesforce.com/services/apexrest/Accounts/'
            + testAccountId+'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAccount = AccountManager.getAccount();
        // Verify results
        System.assert(thisAccount != null);
        System.assertEquals('Test Record 1.1', thisAccount.Name);
    }  
    
    static public ID createTestRecord(Integer sCount){
        
        ID sId;
        Account sAc1 = new Account(Name = 'Test Record 1.1');
        Insert sAc1;
        sId = sAc1.Id;
        
        List <Contact> sCon = new List<Contact>();
        For (Integer i = 0; i<sCount; i++){
            sCon.add(new Contact(FirstName = 'Test'+i, LastName = 'Freud', AccountId = sId));
            	System.Debug('Test - Contact['+i+'] record add.');
        }
        Insert sCon;
        
        return sId;
    }
}