@isTest
public class EI_EWI_RestAuthUtilityV2_Test {
    @isTest static void method1(){
        QueryLimits__c quryLimit = EI_EWI_TestDataFactory.createQueryLimit()[0];
        quryLimit.CheckOn__c=false;
        insert quryLimit;
        
        list<Scheme__c> scm =  EI_EWI_TestDataFactory.createScheme();
        //insert scm;
        API_Account__c ApAcc = EI_EWI_TestDataFactory.createAPIAccount();
        insert ApAcc;
        
        EWI_Dispute_API_Object__c dispApiObj = EI_EWI_TestDataFactory.createDisputeAPIObject('dispute');
        insert dispApiObj; 
        list<EWI_Dispute_API_Mapping__c> dispApiMapp = EI_EWI_TestDataFactory.createDisputeAPIMappings(dispApiObj.id);
        insert dispApiMapp;  
        
        EWI_Dispute_API_Object__c agentApiObjj = EI_EWI_TestDataFactory.createDisputeAPIObject('agent');
        insert agentApiObjj; 
        list<EWI_Dispute_API_Mapping__c> agentApiMapp = EI_EWI_TestDataFactory.createAgentAPIMappings(agentApiObjj.id);
        insert agentApiMapp; 
        
        EWI_Dispute_API_Object__c landlordApiObjj = EI_EWI_TestDataFactory.createDisputeAPIObject('landlord');
        insert landlordApiObjj; 
        list<EWI_Dispute_API_Mapping__c> landlordApiMapp = EI_EWI_TestDataFactory.createLandloarAPIMappings(landlordApiObjj.id);
        insert landlordApiMapp; 
        
        EWI_Dispute_API_Object__c tenancyApiObjj = EI_EWI_TestDataFactory.createDisputeAPIObject('tenancy');
        insert tenancyApiObjj; 
        list<EWI_Dispute_API_Mapping__c> tenancyApiMapp = EI_EWI_TestDataFactory.createTenancyAPIMappings(tenancyApiObjj.id);
        insert tenancyApiMapp; 
        
        EWI_Dispute_API_Object__c tenantApiObjj = EI_EWI_TestDataFactory.createDisputeAPIObject('tenant');
        insert tenantApiObjj; 
        list<EWI_Dispute_API_Mapping__c> tenantApiMapp = EI_EWI_TestDataFactory.createTenantAPIMappings(tenantApiObjj.id);
        insert tenantApiMapp;
        
        EWI_Dispute_API_Object__c memberApiObjj = EI_EWI_TestDataFactory.createDisputeAPIObject('member');
        insert memberApiObjj; 
        list<EWI_Dispute_API_Mapping__c> MemberApiMapp = EI_EWI_TestDataFactory.createMemberAPIMappings(memberApiObjj.id);
        insert MemberApiMapp;
        
        EWI_Dispute_API_Object__c approveBodyApiObjj = EI_EWI_TestDataFactory.createDisputeAPIObject('approved_bodies');
        insert approveBodyApiObjj; 
        list<EWI_Dispute_API_Mapping__c> AppBodyApiMapp = EI_EWI_TestDataFactory.createApproveBodyAPIMappings(approveBodyApiObjj.id);
        insert AppBodyApiMapp;
        
        EWI_Dispute_API_Object__c userApiObjj = EI_EWI_TestDataFactory.createDisputeAPIObject('user');
        insert userApiObjj; 
        list<EWI_Dispute_API_Mapping__c> userApiMapp = EI_EWI_TestDataFactory.createUserAPIMappings(userApiObjj.id);
        insert userApiMapp;
        
        EWI_Dispute_API_Object__c branchApiObjj = EI_EWI_TestDataFactory.createDisputeAPIObject('branch');
        insert branchApiObjj; 
        list<EWI_Dispute_API_Mapping__c> branchApiMapp = EI_EWI_TestDataFactory.createBranchAPIMappings(branchApiObjj.id);
        insert branchApiMapp;
        
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();
        req.requestURI = '/services/apexrest/ewidisputeapi/v1.1/';  
        req.httpMethod = 'POST';
        req.addHeader('AccessToken', 'zd_espire-1626283768936-621d26a380f374d95c0ae6580941f48ef73fde84'); 
        
        req.requestBody = Blob.valueOf('{"Objects":{"dispute":{"applicant":"Tenant","dispute_id":"DEV:jwdjdjEWI00000072","user":{"user_id":"156807","email":"testtenant89@ico3.com,xyz@gmail.com","firstname":"testtenant89","surname":"Test"}},"landlord":{"landlord_type":"Independent","landlord_id":"8421::10871::13681","ll_id":"LL010871","branch":{"branch_id":"8421::10871","branch_name":"mranilghai","branch_status":"open"}}},"FormData":{"landlord":{"firstname":"anil","surname":"ghai","country":"UnitedKingdom"},"tenancy":{"end_date":"2022-12-27","start_date":"2012-09-22","deposit_amount":"200.00","tenancy_type":"Independent-Landlord","street":"CroydonRoad","town":"NewcastleuponTyne","country":"UnitedKingdom","postcode":"NE45LQ","number_of_tenants":1,"unique_id":"gRGeJpTU","tenancy_id":"DEV:842djjl1::10871::13681::935341"},"tenant":{"tenant_1":{"email":"testtenant89@ico3.com","title":"Mr.","firstname":"testtenant89","surname":"Test","country":"UnitedKingdom"}}}}');
        //req.requestBody = blob.valueOf('{"landlord": {"external_id": "landlordId2012","email": "test1@test.com","lastname": "Landlord","firstname": "jan19","phone_number": "07401655677","birth_date": "1990-01-13","postcode": "EC3M5DJ","street": "fenchurch","city": "london","country": "UK"}}');
        RestContext.request = req;
        RestContext.response = res;
        
        Test.startTest();
         //EI_ZD_DisputeAPI.calculateWorkingDaysBetweenTwoDates(system.today(), 5);
         //EI_ZD_DisputeAPI.calculateWorkingDaysBetweenTwoDates1(system.today(), 10);
         
        EI_EWI_DisputeAPIv2.postMethod();
         RestRequest req1 = new RestRequest(); 
        RestResponse res1 = new RestResponse();
        req1.requestURI = '/services/apexrest/ewidisputeapi/v1.1/';  
        req1.httpMethod = 'POST';
        req1.addHeader('AccessToken', 'fdfdf'); 
        
        //req.requestBody = Blob.valueOf('{"landlord": {"external_id": "landlordId2012", "email": "test1@test.com", "lastname": "Landlord", "firstname": "jan19", "phone_number": "07401655677","birth_date": "1990-01-13","postcode": "EC3M5DJ","street": "fenchurch","city": "london","country": "UK"},"Tenancy": {"end_date": "2019-12-23","start_date": "2019-12-23","deposit_amount": 2500.00,"country": "UK","city": "London","street": "Faringford Road","postcode": "E15 4DG","customer_id": "landlordId20","reference": "1111333","external_id": "tenancyshhh6j676701","customer_type" :"landlord","rent_protection": "false"},"tenant": [{"email": "test8@test8.com","lastname": "Tenant","firstname": "jan18","external_id": "t8","phone_number": "07899855677","birth_date": "1999-08-23"},{"email": "test9@test9.com","lastname": "Tenant","firstname": "Jan18-2","external_id": "t9","phone_number": "07899855677","birth_date": "1999-08-23"},{"email": "test10@test10.com","lastname": "Tenant","firstname": "jan18-3","external_id": "t10","phone_number": "07899855677","birth_date": "1999-08-23"}],"dispute": {"initiated_by": "Landlord","tenancy_id": "tenancy68","lead_landlord_id": "landlordId20","total_claim_amount": 2000.00,"dispute_reasons": "tenant left house in a mess","external_id": "disputedhh6h8112011","deposit_owner_id":"landlordId20"},"agent": {"external_id": "agent20","firstname": "Joe","lastname": "Bloggs Jan18","email": "joe@bloggs.com","mobile": "07501655678","job_title": "CFO"}}');
        req1.requestBody = blob.valueOf('{"landlord": "fddfd"}');
        RestContext.request = req1;
        RestContext.response = res1;
          
        EI_EWI_DisputeAPIv2.postMethod();
        
        RestRequest req3 = new RestRequest(); 
        RestResponse res3 = new RestResponse();
        req3.requestURI = '/services/apexrest/ewiupdatedisputeapi/v1.1';  
        req3.httpMethod = 'POST';
        req3.addHeader('AccessToken', 'zd_espire-1626283768936-621d26a380f374d95c0ae6580941f48ef73fde84'); 
        
        req3.requestBody = Blob.valueOf('{"dispute_id":"Test-EWI00000315","type":"tenant","user_id":"156807","firstname":"Alice","surname":"Lavender","email":"abc@gmail.com"}');
        RestContext.request = req3;
        RestContext.response = res3;
        EI_EWI_UpdateDisputeAPIV2.postMethod();
        
        RestRequest req4 = new RestRequest(); 
        RestResponse res4 = new RestResponse();
        req4.requestURI = '/services/apexrest/ewiupdatedisputeapi/v1.1';  
        req4.httpMethod = 'POST';
        req4.addHeader('AccessToken', 'zd_espire-1626283768936-621d26a380f374d95c0ae6580941f48ef73fde84'); 
        
        req4.requestBody = Blob.valueOf('{"dispute_id":"Test-EWI00000315","type":"tenant","user_id":"156807","firstname":"Alice","surname":"Lavender","email":"abc@gmail.com"}');
        RestContext.request = req4;
        RestContext.response = res4;
        EI_EWI_UpdateDisputeAPIV2.postMethod();
        Test.stopTest();    
    }
    @isTest static void method2(){
        QueryLimits__c quryLimit = EI_EWI_TestDataFactory.createQueryLimit()[0];
        quryLimit.CheckOn__c=false;
        insert quryLimit;
        
        list<Scheme__c> scm =  EI_EWI_TestDataFactory.createScheme();
        //insert scm;
        API_Account__c ApAcc = EI_EWI_TestDataFactory.createAPIAccount();
        insert ApAcc;
        
        EWI_Dispute_API_Object__c dispApiObj = EI_EWI_TestDataFactory.createDisputeAPIObject('dispute');
        insert dispApiObj; 
        list<EWI_Dispute_API_Mapping__c> dispApiMapp = EI_EWI_TestDataFactory.createDisputeAPIMappings(dispApiObj.id);
        insert dispApiMapp;  
        
        EWI_Dispute_API_Object__c agentApiObjj = EI_EWI_TestDataFactory.createDisputeAPIObject('agent');
        insert agentApiObjj; 
        list<EWI_Dispute_API_Mapping__c> agentApiMapp = EI_EWI_TestDataFactory.createAgentAPIMappings(agentApiObjj.id);
        insert agentApiMapp; 
        
        EWI_Dispute_API_Object__c landlordApiObjj = EI_EWI_TestDataFactory.createDisputeAPIObject('landlord');
        insert landlordApiObjj; 
        list<EWI_Dispute_API_Mapping__c> landlordApiMapp = EI_EWI_TestDataFactory.createLandloarAPIMappings(landlordApiObjj.id);
        insert landlordApiMapp; 
        
        EWI_Dispute_API_Object__c tenancyApiObjj = EI_EWI_TestDataFactory.createDisputeAPIObject('tenancy');
        insert tenancyApiObjj; 
        list<EWI_Dispute_API_Mapping__c> tenancyApiMapp = EI_EWI_TestDataFactory.createTenancyAPIMappings(tenancyApiObjj.id);
        insert tenancyApiMapp; 
        
        EWI_Dispute_API_Object__c tenantApiObjj = EI_EWI_TestDataFactory.createDisputeAPIObject('tenant');
        insert tenantApiObjj; 
        list<EWI_Dispute_API_Mapping__c> tenantApiMapp = EI_EWI_TestDataFactory.createTenantAPIMappings(tenantApiObjj.id);
        insert tenantApiMapp;
        
        EWI_Dispute_API_Object__c memberApiObjj = EI_EWI_TestDataFactory.createDisputeAPIObject('member');
        insert memberApiObjj; 
        list<EWI_Dispute_API_Mapping__c> MemberApiMapp = EI_EWI_TestDataFactory.createMemberAPIMappings(memberApiObjj.id);
        insert MemberApiMapp;
        
        EWI_Dispute_API_Object__c approveBodyApiObjj = EI_EWI_TestDataFactory.createDisputeAPIObject('approved_bodies');
        insert approveBodyApiObjj; 
        list<EWI_Dispute_API_Mapping__c> AppBodyApiMapp = EI_EWI_TestDataFactory.createApproveBodyAPIMappings(approveBodyApiObjj.id);
        insert AppBodyApiMapp;
        
        EWI_Dispute_API_Object__c userApiObjj = EI_EWI_TestDataFactory.createDisputeAPIObject('user');
        insert userApiObjj; 
        list<EWI_Dispute_API_Mapping__c> userApiMapp = EI_EWI_TestDataFactory.createUserAPIMappings(userApiObjj.id);
        insert userApiMapp;
        
        EWI_Dispute_API_Object__c branchApiObjj = EI_EWI_TestDataFactory.createDisputeAPIObject('branch');
        insert branchApiObjj; 
        list<EWI_Dispute_API_Mapping__c> branchApiMapp = EI_EWI_TestDataFactory.createBranchAPIMappings(branchApiObjj.id);
        insert branchApiMapp;
        
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();
        req.requestURI = '/services/apexrest/ewidisputeapi/v1.1/';  
        req.httpMethod = 'POST';
        req.addHeader('AccessToken', 'zd_espire-1626283768936-621d26a380f374d95c0ae6580941f48ef73fde84'); 
        
        req.requestBody = Blob.valueOf('{"Objects":{"dispute":{"applicant":"Agent","dispute_id":"Test-EWI00000315","user":{"user_id":"262","email":"pqr@gmail.com","firstname":"Alice","surname":"Lavender"}},"member":{"member_id":"test848","g_number":"testG01005","member_name":"SpicertestHaartResidentialLettingsLtd","note":"AgenthasconfirmedbankdetailsforallSpicerHaartPaymentsas::rnAccountNumber:43664171rnAccountName:SpicerhaartResidentialLettingsClientDepositAccountrnSortCode:401203rnBank:HSBC","approved_bodies":{"arla":"true","nla":"false","other_body":"false"},"branch":{"branch_id":"Test848::9148","branch_name":"Haart-Bracknell","branch_status":"Open"}},"landlord":{"landlord_type":"Non Member","landlord_id":"Test848::9148::253295","surname":"WhiteKnowleLtd","email":"abf@gmail.com,yrtt@gmail.com"}},"FormData":{"tenancy":{"start_date":"2023-02-06","end_date":"2023-02-06","deposit_amount":"1125.00","tenancy_type":"Agent","street":"CartersHill","town":"Bracknell","country":"UnitedKingdom","postcode":"RG425PL","number_of_tenants":"1","unique_id":"HPCoPyMtest","tenancy_id":"Test-848::9148::253295::975753"},"tenant":{"tenant_1":{"email":"abc@gmail.com,xyz@gmail.com","title":"Mr.","firstname":"John","surname":"Callinan","country":"UnitedKingdom"}},"agent":{"email":"xyz@gmail.com,jdkjd@gmail.com","surname":"Smith","country":"UnitedKingdom"}}}');
        RestContext.request = req;
        RestContext.response = res;
        
        Test.startTest();
        EI_EWI_DisputeAPIv2.postMethod();
        RestRequest req1 = new RestRequest(); 
        RestResponse res1 = new RestResponse();
        req1.requestURI = '/services/apexrest/ewiupdatedisputeapi/v1.1';  
        req1.httpMethod = 'POST';
        req1.addHeader('AccessToken', 'zd_espire-1626283768936-621d26a380f374d95c0ae6580941f48ef73fde84'); 
        
        req1.requestBody = Blob.valueOf('{"dispute_id":"Test-EWI00000315","type":"agent","firstname":"Alice","surname":"Lavender","email":"abc@gmail.com"}');
        RestContext.request = req1;
        RestContext.response = res1;
        EI_EWI_UpdateDisputeAPIV2.postMethod();
        
        RestRequest req2 = new RestRequest(); 
        RestResponse res2 = new RestResponse();
        req2.requestURI = '/services/apexrest/ewiupdatedisputeapi/v1.1';  
        req2.httpMethod = 'POST';
        req2.addHeader('AccessToken', 'zd_espire-1626283768936-621d26a380f374d95c0ae6580941f48ef73fde84'); 
        
        req2.requestBody = Blob.valueOf('{"dispute_id":"Test-EWI00000315","type":"tenant","firstname":"Alice","surname":"Lavender","email":"abc@gmail.com"}');
        RestContext.request = req2;
        RestContext.response = res2;
        EI_EWI_UpdateDisputeAPIV2.postMethod();
        
        RestRequest req3 = new RestRequest(); 
        RestResponse res3 = new RestResponse();
        req3.requestURI = '/services/apexrest/ewiupdatedisputeapi/v1.1';  
        req3.httpMethod = 'POST';
        req3.addHeader('AccessToken', 'zd_espire-1626283768936-621d26a380f374d95c0ae6580941f48ef73fde84'); 
        
        req3.requestBody = Blob.valueOf('{"dispute_id":"Test-EWI00000315","type":"agent","user_id":"262","firstname":"Alice","surname":"Lavender","email":"abc@gmail.com"}');
        RestContext.request = req3;
        RestContext.response = res3;
        EI_EWI_UpdateDisputeAPIV2.postMethod();
        
        
        Test.stopTest();
    }
   /* @isTest static void updateApi(){
        QueryLimits__c quryLimit = EI_EWI_TestDataFactory.createQueryLimit()[0];
        quryLimit.CheckOn__c=false;
        insert quryLimit;
        
        list<Scheme__c> scm =  EI_EWI_TestDataFactory.createScheme();
        //insert scm;
        API_Account__c ApAcc = EI_EWI_TestDataFactory.createAPIAccount();
        insert ApAcc;
        
        EWI_Dispute_API_Object__c agentApiObjj = EI_EWI_TestDataFactory.createDisputeAPIObject('agent');
        insert agentApiObjj; 
        list<EWI_Dispute_API_Mapping__c> agentApiMapp = EI_EWI_TestDataFactory.createAgentAPIMappings(agentApiObjj.id);
        insert agentApiMapp; 
        
        EWI_Dispute_API_Object__c landlordApiObjj = EI_EWI_TestDataFactory.createDisputeAPIObject('landlord');
        insert landlordApiObjj; 
        list<EWI_Dispute_API_Mapping__c> landlordApiMapp = EI_EWI_TestDataFactory.createLandloarAPIMappings(landlordApiObjj.id);
        insert landlordApiMapp; 
        
        EWI_Dispute_API_Object__c tenantApiObjj = EI_EWI_TestDataFactory.createDisputeAPIObject('tenant');
        insert tenantApiObjj; 
        list<EWI_Dispute_API_Mapping__c> tenantApiMapp = EI_EWI_TestDataFactory.createTenantAPIMappings(tenantApiObjj.id);
        insert tenantApiMapp;
        
        
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();
        req.requestURI = '/services/apexrest/ewiupdatedisputeapi/v1.1';  
        req.httpMethod = 'POST';
        req.addHeader('AccessToken', 'zd_espire-1626283768936-621d26a380f374d95c0ae6580941f48ef73fde84'); 
        
        req.requestBody = Blob.valueOf('');
        RestContext.request = req;
        RestContext.response = res;
        
        Test.startTest();
        EI_EWI_UpdateDisputeAPIV2.postMethod();
        Test.stopTest();
    }*/
}