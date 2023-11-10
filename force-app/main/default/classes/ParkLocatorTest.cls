@isTest
private class ParkLocatorTest {

    @isTest static void testCallout(){
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String country = 'United States';
        System.assertEquals(new string[]{'Yosemite', 'Sequoin', 'Crater Lake'},ParkLocator.country(country));
    }
}