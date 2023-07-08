package movie;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/moviesearch")
public class MovieSearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String API_KEY = "750ac55e";


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Read the movie name from the request parameter
        String movieName = request.getParameter("moviename");

        // Encode the movie name for the URL
        String encodedMovieName = URLEncoder.encode(movieName, "UTF-8");

        // Build the API URL
        String apiUrl = "http://www.omdbapi.com/?apikey=" + API_KEY + "&s=" + encodedMovieName;

        // Make an API request and get the JSON response
        String jsonResponse = ApiClient.makeGetRequest(apiUrl);

        // Set the JSON response as a request attribute
        request.setAttribute("jsonResponse", jsonResponse);
        System.out.println(jsonResponse);
        // Forward the request to the JSP page for rendering
        request.getRequestDispatcher("/movie.jsp").forward(request, response);
    }
}
