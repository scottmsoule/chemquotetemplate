// pages/About.tsx
import { FunctionalComponent } from 'preact';

const About: FunctionalComponent = () => {
  return (
    <main>
      <h2>About ChemQuote</h2>
      <p>
        ChemQuote is a tool designed for chemical distribution companies to streamline the quoting process for their customers. 
        With a user-friendly interface and robust backend, ChemQuote allows users to manage contacts, view quotes, and generate reports efficiently.
      </p>
      <h3>Features</h3>
      <ul>
        <li>Manage customer contacts</li>
        <li>Generate and track quotes</li>
        <li>Intuitive interface for ease of use</li>
        <li>Integration with MySQL for data persistence</li>
      </ul>
      <h3>Technologies Used</h3>
      <p>
        ChemQuote is built using a combination of modern technologies including:
      </p>
      <ul>
        <li>Preact for the frontend</li>
        <li>Flask for the backend API</li>
        <li>MySQL for data storage</li>
        <li>Docker for containerization</li>
      </ul>
      <h3>Getting Started</h3>
      <p>
        To get started with ChemQuote, check out the <a href="/">Getting Started</a> section in this repository.
      </p>
    </main>
  );
};

export default About;
