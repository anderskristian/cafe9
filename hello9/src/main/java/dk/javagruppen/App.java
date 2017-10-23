package dk.javagruppen;


import sun.awt.OSInfo;


/**
 * Hello world!
 */
public class App {
    public static void main(String[] args) {
        final String version = System.getProperty("java.version");
        System.out.println(String.format("Hello %s",version));
        App app= new App();
        System.out.println("Info: "+app.osName());
    }


    private String osName() {
        //noinspection StringBufferReplaceableByString
        StringBuilder sb=new StringBuilder();
        sb.append("type: ").append(OSInfo.getOSType());
        return sb.toString();
    }
}
