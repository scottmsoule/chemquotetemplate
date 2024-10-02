import { FunctionalComponent } from 'preact';
import ContactList from '../components/ContactList'; // Adjust the path as necessary

const Home: FunctionalComponent = () => {
  return (
    <main>
      <h2>Welcome to ChemQuote</h2>
      <p>This is a tool for chemical distribution companies to quote their customers.</p>
      <ContactList /> {/* Add the ContactList component here */}
    </main>
  );
};

export default Home;
