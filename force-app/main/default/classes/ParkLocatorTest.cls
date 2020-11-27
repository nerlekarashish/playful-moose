@isTest
private class ParkLocatorTest {
    @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String[] actual = ParkLocator.country('India');
        String[] expected = new String[] {'Lala Land', 'Park Land'};
        System.assertEquals(expected, actual);
    }
}