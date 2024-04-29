
public class EmbeddedJettyServer {
    public static void main(String[] args) {
        int port = 8080; // Set the port for the server

        //Server server = new Server(port);

        // Define the path to your WAR file or web application directory
        String webappPath = "path/to/your/webapp";

        // Create a WebAppContext for the web application
        //WebAppContext webappContext = new WebAppContext();
        //webappContext.setContextPath("/");
        //webappContext.setWar(webappPath);

        // Attach the WebAppContext to the server
        //server.setHandler(webappContext);

        try {
            // Start the server
            //server.start();
            //server.join(); // Wait for the server to finish starting
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Stop the server when finished
            try {
                //server.stop();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
