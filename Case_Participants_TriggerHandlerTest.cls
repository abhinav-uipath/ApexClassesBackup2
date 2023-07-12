@isTest
public class Case_Participants_TriggerHandlerTest {
    @testSetup
    public static void dataSetup() {    
        List<Account> accounts = new List<Account>();
        List<Case_Participant__c> caseParticipants = new List<Case_Participant__c>();
        List<String> itemsName = new List<String>{'Cleaning', 'Damage', 'Redecoration', 'Gardening', 'Rent'};
            
            // Creating custom metadata
            List<QueryLimits__c> queryLimits = EI_EWI_TestDataFactory.createQueryLimit();
        queryLimits[0].CheckOn__c = false;
        upsert queryLimits;
        // Creating schemes
        List<Scheme__c> schemes = EI_EWI_TestDataFactory.createScheme();
        // Creating agent
        accounts.addAll(EI_EWI_TestDataFactory.createAgent(1));
        // Creating tenant
        accounts.addAll(EI_EWI_TestDataFactory.createTenant(1));
        upsert accounts;
        
        accounts[0].firstName = 'Agent';
        accounts[0].lastName = 'Unknown Red';
        accounts[1].firstName = 'Agent';
        accounts[1].lastName = 'Unknown Red';
        update accounts;
        
        List<Contact> contacts = [SELECT Id, FirstName, LastName, AccountId FROM Contact WHERE AccountId IN:accounts];
        
        // Creating user
        //List<User> users = EI_EWI_TestDataFactory.createUser(1, 'System Administrator');
        // Creating property
        List<Property__c> properties = EI_EWI_TestDataFactory.createProperty(1, accounts[0].Id);
        properties[0].House_No__c='44';
        insert properties;
        // Creating deposit
        List<Deposit__c> deposits = EI_EWI_TestDataFactory.createDeposit(1, schemes[0].Id, accounts[0].Id, properties[0].Id);
        insert deposits;
        // Creating case
        List<Case> disputes = EI_EWI_TestDataFactory.createDispute(1, deposits[0].Id);
        disputes[0].V_External_Id__c='Agent Unknown Red';
        disputes[0].Member_Notes__c='jjj';
        insert disputes;
        // Creating case participant for agent
        caseParticipants.addAll(EI_EWI_TestDataFactory.createCaseParticipant(1, contacts[0], disputes[0].Id, 'Agent', 'abcpqrxyz1', true));
        // Creating case participants for tenant
        caseParticipants.addAll(EI_EWI_TestDataFactory.createCaseParticipant(1, contacts[1], disputes[0].Id, 'Tenant', 'abcpqrxyz2', true));
        
        insert caseParticipants;
        // Creating dispute items
        List<Dispute_Item__c> disputeItems = EI_EWI_TestDataFactory.createDisputeItem(disputes[0].Id, itemsName, 100.25, 70.75);
        insert disputeItems;
        // Creating installments
        set<id> contactIds = new set<id>();
        contactIds.add(contacts[0].id);
        contactIds.add(contacts[1].id);
        List<Installment__c> installments = EI_EWI_TestDataFactory.createInstallments(deposits[0].Id, contactIds, 'Pending Processing', 'Payable', 
                                                                                      'Repayment agreed');
        installments[0].Amount__c=20.00;
        installments[0].Reason_For_Flag__c=null;
        installments[0].Bank_Account_Holder_Name__c='ddd';
        installments[0].Bank_Account_Number__c='44343343';
        installments[0].Bank_Sort_Code__c='999999';
        installments[0].Lock_payments__c=false;
        installments[0].Case__c=disputes[0].Id;
        installments[0].Case_participant__c= caseParticipants[0].id;   
        insert installments;
        
        List<Inbound_Report__c> inboundReports = EI_EWI_TestDataFactory.createInboundReports(installments[0].id, 20.00, System.today(), 'Agent Unknown Red');  
        insert inboundReports;
        
        List<Inbound_Report__c> inboundReports1 = EI_EWI_TestDataFactory.createInboundReports(installments[0].id, 20.00, System.today(), 'Agent Unknown Reds');  
        insert inboundReports1;
        
    }
    
    @isTest
    public static void testMethod1(){
        Test.startTest();
        List<Case_Participant__c> cpobject = [Select Id, Case__c,Bank_Account_Holder_Name__c,Bank_Sort_Code__c,Bank_Account_Number__c,Bank_Name__c from Case_Participant__c limit 1];
        cpobject[0].Type__c='Agent';
        cpobject[0].Primary_Agent__c=true;  
        update cpobject;
        
        list<case> caseIDs = [select id,Member_Notes__c from case];
        set<id> idss = new set<id>();
        idss.add(caseIDs[0].id);
        Case_Participants_TriggerHandler.processMemberNotes(idss,cpobject);
        // EWI_AddBankDetails.updateBankDetails(cpobject[0].id,'UK','nameofacc','23232323','560003','23232323','nameOntheAccount','intBankName','BIC','swiftCode','IBAN','homeAddress');
        //EWI_AddBankDetails.updateBankDetails(cpobject[0].id,'International','nameofacc','23232323','560003','23232323','nameOntheAccount','intBankName','BIC','560003','GB29NWBK60161331926819','homeAddress');
        
        Test.stopTest();
    }
    
    @isTest
    public static void testMethod2(){
        Test.startTest();
        List<Case_Participant__c> cpobject = [Select Id, Case__c,Bank_Account_Holder_Name__c,Bank_Sort_Code__c,Bank_Account_Number__c,Bank_Name__c from Case_Participant__c limit 1];
        //cpobject[0].Type__c='Agent';
        cpobject[0].Bank_Account_Holder_Name__c='ddd';
        cpobject[0].Bank_Account_Number__c='44343343';
        cpobject[0].Bank_Sort_Code__c='999999';
        update cpobject;
        Case_Participants_TriggerHandler.justIncrement();
        Case_Participants_TriggerHandler.justIncrement1();
        Case_Participants_TriggerHandler.justIncrement2();
        Test.stopTest();
    }
    
    @isTest
    public static void testMethod3(){
        Test.startTest();
        List<Case_Participant__c> cpobject = [Select Id, Case__c,Bank_Account_Holder_Name__c,Bank_Sort_Code__c,Bank_Account_Number__c,Bank_Name__c from Case_Participant__c limit 1];
        cpobject[0].Type__c='Tenant';
        update cpobject;
        Case_Participants_TriggerHandler.updateTenantsNamesOnCase(cpobject);
        Case_Participants_TriggerHandler.justIncrement();
        Case_Participants_TriggerHandler.justIncrement1();
        Test.stopTest();
    }
    
}