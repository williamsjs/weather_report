<h1>Weather Report</h1>
<p>Weather Report uses the Weather Underground API to access information through the web with either a zipcode, or a city, state value. </p>

<h2>Classes: </h2>

<ul>
<li><h3>Location</h3><p>accepts user input and stores it in local variable that is accessed by other classes</li>
<li><h3>Conditions</h3><p>Takes the location object and calls the API for temperature(celsius and fahrenheit), humidity, and cloud cover</p></li>
<li><h3>Hurricane</h3><p>stores a list of hurricanes and major storms</p></li>
<li><h3>Alert</h3><p>Stores alerts for the location object in an array and structures the results, outputting the information in an easy to read format</p>
<li><h3>SunriseSunset</h3><p>Stores the sunrise and sunset times for the given location</p></li>
<li><h3>TenDayForecast</h3><p>Stores the ten day forecast for the given location</p></li>
</ul>
