import java.net.HttpURLConnection;
import java.net.URL;
import java.io.IOException;

public class ImageChecker {
    public static boolean isImageExists(String imageUrl) {
        try {
            URL url = new URL(imageUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("HEAD");
            int responseCode = connection.getResponseCode();
            return (responseCode == HttpURLConnection.HTTP_OK);
        } catch (IOException e) {
            // Error occurred while checking the image
            return false;
        }
    }
}
