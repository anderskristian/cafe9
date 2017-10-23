package dk.javagruppen;


import javax.xml.ws.Holder;

/**
 * Hello world!
 */
public class App {
    public static void main(String[] args) {
        final String version = System.getProperty("java.version");
        System.out.println(String.format("Hello %s",version));
        App app= new App();
        System.out.println("holder="+app.test());
    }


    private String test() {
        Holder<String> h= new Holder<>("horse");
        return h.value;
    }
}
