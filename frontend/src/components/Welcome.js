import React from 'react';
import './Welcome.css'; // Ensure to create this CSS file

const Welcome = () => {
    return (
        <div className="welcome-container">
            <h1>Welcome to ChemQuote</h1>
            <p>
                ChemQuote is a powerful tool for chemical distribution companies, 
                helping you to quote your customers with the cost of orders, 
                including freight charges and various "what if" scenarios.
            </p>
            <div className="features">
                <h2>Features</h2>
                <ul>
                    <li>Calculate accurate quotes</li>
                    <li>Manage contacts effectively</li>
                    <li>Analyze freight costs</li>
                    <li>Explore different pricing scenarios</li>
                </ul>
            </div>
        </div>
    );
};

export default Welcome;
