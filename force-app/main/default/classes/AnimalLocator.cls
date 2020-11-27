public class AnimalLocator {

    public static String getAnimalNameById(Integer id) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        String name = null;
        
        if (response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            Object animal = (Object) results.get('animal');
            System.debug('Received the following animal:');
            System.debug(animal);

            Map<String, Object> animalAttributes = (Map<String, Object>)animal;
            // now loop through our animal attributes.
            for (String attributeName : animalAttributes.keyset()) {
                if(attributeName == 'name') {
                    name =(String) animalAttributes.get(attributeName);
                }
            }

        }
        return name;        
    }
}