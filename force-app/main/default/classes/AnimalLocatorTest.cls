@isTest
private class AnimalLocatorTest {
    
    @isTest
    static void animalLocatorTest1(){
        Test.setMock(HttPCalloutMock.class, new AnimalLocatorMock());
        String actual = AnimalLocator.getAnimalNameById(1);
        String expected = 'moose';
        System.assertEquals(actual, expected);
    }
    

}