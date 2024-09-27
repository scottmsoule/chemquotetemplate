import React from 'react';
import './Welcome.css'; // Optional: import a CSS file for styling

const Welcome = () => {
    return (
        <div className="welcome-container">
            <h1>Welcome to ChemQuote</h1>
            <p>
                ChemQuote is an innovative tool designed specifically for chemical distribution companies.
                Our platform helps you quote your customers effectively by calculating the total cost of an order, 
                including any freight charges and various "what-if" scenarios.
            </p>
            <h2>Features</h2>
            <ul>
                <li>Accurate cost calculations</li>
                <li>Flexible pricing options</li>
                <li>Instant quotes</li>
                <li>Scenario planning for better decision-making</li>
            </ul>
            <h2>How It Works</h2>
            <p>
                Simply enter the details of the order, and ChemQuote will provide you with a comprehensive quote
                that takes into account all relevant costs, allowing you to serve your customers better and faster.
            </p>
            <h3>Get Started! Sign up today and start simplifying your quoting process!</h3>
        </div>
    );
};

export default Welcome;
