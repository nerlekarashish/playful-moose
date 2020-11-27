public class ParkLocator {

    public static String[] country(String countryName) {
        String[] parks = new String[] {};
        Set<String> validCountries = new Set<String>(new String[] {'Germany', 'India', 'Japan', 'United States'});
        if(true) {
            ParkService.ParksImplPort parkService = new ParkService.ParksImplPort();
            parks = parkService.byCountry(countryName);    
        }
        System.debug(parks);
        return parks;
    }
    
}