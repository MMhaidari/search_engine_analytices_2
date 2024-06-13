<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
    <h1>Search Engine Analytics App</h1>
    <h2>What is Search Engine Analytics App?</h2>
    <p>Search Engine Analytics is a web application built using the Ruby on Rails framework that empowers users to search for articles efficiently. enabling users to input their search queries easily.</p>
    <h2>Key Features</h2>
    <ul>
        <li><strong>Real-time Search Box:</strong> Enjoy instant results for efficient and user-friendly searching.</li>
        <li><strong>Analytics Dashboard:</strong> Gain insights into the most searched articles, uncovering popular topics and trends.</li>
        <li><strong>User Identification:</strong> Secure and personalized user experience based on IP address.</li>
        <li><strong>Responsive Design:</strong> Optimized for seamless use across mobile, tablet, and desktop devices.</li>
        <li><strong>Stimulus Gem:</strong> Leverage Stimulus gem to listen to events and enhance interactivity.</li>
    </ul>
    <h2>Saving Examples</h2>
    <p>User searches:</p>
    <ul>
        <li>What</li>
        <li>What is a</li>
        <li>What is a good car?</li>
    </ul>
    <p>Search engine only records:</p>
    <ul>
        <li>What is a good car?</li>
    </ul>
    <h2>Getting Started</h2>
    <p>This section provides a guide to get started with the SimpleSearch App.</p>
    <h3>Prerequisites</h3>
    <p>Ensure you have the following installed:</p>
    <ul>
        <li>Ruby: Recommended version 3.3.0</li>
        <li>Rails: Recommended version 7.1.2</li>
        <li>PostgreSQL: Version 14 or higher.</li>
    </ul>
    <h3>Gems Used</h3>
    <ul>
        <li>Turbo Rails</li>
        <li>Amatch gem for String Match</li>
        <li>Stimulus</li>
        <li>faker</li>
        <li>tailwindcss-rails</li>
        <li>pg_search</li>
        <li>factory_bot_rails</li>
        <li>rails-controller-testing</li>
    </ul>
    <h3>Installation Documentation</h3>
    <p>Follow these steps to get a local copy up and running:</p>
    <ol>
        <li>Clone the repository:</li>
        <pre><code>git clone https://github.com/mmhaidari/search_engine_analytices</code></pre>
        <li>Navigate to the cloned directory:</li>
        <pre><code>cd search_engine_analytices</code></pre>
        <li>Install required gems:</li>
        <pre><code>bundle install</code></pre>
        <li>Update Ruby version if needed (if below 3.3.0).</li>
        <li>Check and configure PostgreSQL version in <code>config/database.yml</code> file.</li>
        <li>Set up the database:</li>
        <pre><code>rails db:create
        rails db:migrate
        rails db:seed</code></pre>
         <li>Raning The test Cases:</li>
        <pre><code>rspec spec</code></pre>
        <li>Start the server:</li>
        <pre><code>bin/dev</code></pre>
    </ol>
</body>
</html>
