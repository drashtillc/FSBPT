public with sharing class FloSetup {
  public class FlowInput {
    @InvocableVariable(label='Augmentation')
    public String augment;
  }
  public class FlowOutput {
    @InvocableVariable(label='MyDomain')
    public String curDomain;

    @InvocableVariable(label='Experiences')
    public String xpSetup;
  }

  @InvocableMethod(
    category='Org Manager'
    label='FLO Cleaner'
    description='Fonteva KD Team Org Setup Action'
  )
  public static List<FlowOutput> performFix(List<FlowInput> flowInputs) {
    List<FlowOutput> flowOutputs = new List<FlowOutput>();
    for (FlowInput flowInput : flowInputs) {
      FlowOutput flowOutput = new flowOutput();
      EventApi.PackageScripts.install();
      String baseURL = System.URL.getSalesforceBaseUrl().toExternalForm();
      flowOutput.curDomain = baseURL;
      flowOutput.xpSetup =
        baseURL.subStringBefore('my') +
        'lightning.force.com/lightning/setup/SetupNetworks/home';
      flowOutputs.add(flowOutput);
    }

    return flowOutputs;
  }
}