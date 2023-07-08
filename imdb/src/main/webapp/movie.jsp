<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.json.JSONArray" %>
<%@ page import="org.json.JSONObject" %>

<!DOCTYPE html>
<html>
<head>
    <title>Movie Search Results</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        integrity="sha384-pzjw8/+Lhm/R5p8+E79S8LjvC9S8xgD1A1PL9H2k0FmW4i8vXwwdzy4WJT0n+WSp"
        crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <h1>Movie Search Results</h1>
        <%-- Parse the JSON response into a JavaScript object --%>
        <%@ page import="java.util.List" %>
        <%@ page import="java.util.ArrayList" %>
        <%@ page import="java.util.Iterator" %>
        <%
            String jsonResponse = (String) request.getAttribute("jsonResponse");
            JSONObject jsonObject = new JSONObject(jsonResponse);
            String responseStatus = jsonObject.getString("Response");
            JSONArray searchResults = jsonObject.optJSONArray("Search");

            if (responseStatus.equals("True") && searchResults != null) {
                List<JSONObject> movies = new ArrayList<>();
                for (int i = 0; i < searchResults.length(); i++) {
                    JSONObject result = searchResults.getJSONObject(i);
                    movies.add(result);
                }

              
                for (JSONObject movie : movies) {
                	out.println(movie);
                    String title = movie.optString("Title", "");
                    String year = movie.optString("Year", "");
                    String imdbID = movie.optString("imdbID", "");
                    String type = movie.optString("Type", "");
                    String poster = movie.optString("Poster", "");
                    String Released = movie.optString("Released", "");

                    %>
                    <div class="card mb-3" style="max-width: 540px;">
                        <div class="row no-gutters">
                            <div class="col-md-4">
                                <img src="<%= poster %>" class="card-img" alt="<%= title %> Poster">
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title"><%= title %></h5>
                                    <p class="card-text">Year: <%= year %></p>
                                    <p class="card-text">IMDb ID: <%= imdbID %></p>
                                    <p class="card-text">Type: <%= type %></p>
                                      <p class="card-text">Released:<%= Released %></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                }
            } else {
                %>
                <p>No movies found.</p>
                <%
            }
        %>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBETdH5tIE10NkWHiRJGh0k"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"
        integrity="sha384-RhOV4sV85F3f3mCh5p+8dWQE9PhbHZcMhtTGMbV/LsiLuMQxuot95zWZmgJ1Wuab"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
        integrity="sha384-pzjw8/+Lhm/R5p8+E79S8LjvC9S8xgD1A1PL9H2k0FmW4i8vXwwdzy4WJT0n+WSp"
        crossorigin="anonymous"></script>
</body>
</html>
