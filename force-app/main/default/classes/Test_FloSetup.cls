@isTest
public inherited sharing class Test_FloSetup {
  @TestSetup
  static void setup() {
    Profile prof = [
      SELECT Id, Name
      FROM Profile
      WHERE Name = 'System Administrator'
      LIMIT 1
    ];

    User tstUser = new User();
    tstUser.Username = 'test42@fonteva.test';
    tstUser.Email = 'test42@fonteva.test';
    tstUser.FirstName = 'TestFirst';
    tstUser.LastName = 'TestLast';
    tstUser.Alias = 'tstusr';
    tstUser.TimeZoneSidKey = 'America/New_York';
    tstUser.LocaleSidKey = 'en_US';
    tstUser.LanguageLocaleKey = 'en_US';
    tstUser.EmailEncodingKey = 'ISO-8859-1';
    tstUser.IsActive = true;
    tstUser.ProfileId = prof.Id;
    insert tstUser;
  }

  @isTest
  public static void floSetupTestMethod() {
    User tstUsr = [
      SELECT Id, Username, Email
      FROM User
      WHERE Username = 'test42@fonteva.test'
      LIMIT 1
    ];
    System.runAs(tstUsr) {
      Test.startTest();
      FloSetup.FlowInput curReq = new FloSetup.FlowInput();
      List<FloSetup.FlowInput> curReqs = new List<FloSetup.FlowInput>();
      curReqs.add(curReq);
      List<FloSetup.FlowOutput> curResps = FloSetup.performFix(curReqs);
      System.assertEquals(curResps[0].curDomain != null, true);
      Test.stopTest();
    }
  }
}