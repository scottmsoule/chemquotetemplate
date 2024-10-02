// components/ContactList.tsx
import { useEffect, useState } from 'preact/hooks';

interface Contact {
  contact_role: string;
  created_at: string;
  customer_id: number;
  email: string;
  first_name: string;
  id: number;
  last_name: string;
  phone: string;
  updated_at: string;
}

const ContactList = () => {
  const [contacts, setContacts] = useState<Contact[]>([]);
  const [loading, setLoading] = useState<boolean>(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchContacts = async () => {
      const apiUrl = `${import.meta.env.VITE_API_BASE_URL}api/contacts`; // Define the URL from the environment variable

      // Check if the API base URL is missing
      if (!import.meta.env.VITE_API_BASE_URL) {
        setError("Base URL is missing"); // Set error state
        setLoading(false); // Stop loading
        return; // Exit the function
      }

      try {
        const response = await fetch(apiUrl);
        if (!response.ok) {
          const errorText = await response.text(); // Get the response text for more details
          throw new Error(`Error ${response.status}: ${errorText}`);
        }

        const data: Contact[] = await response.json(); // Assume the response is JSON
        setContacts(data);
      } catch (err: unknown) {
        const apiBaseUrl = import.meta.env.VITE_API_BASE_URL; // Get the environment variable value
        if (err instanceof Error) {
          setError(`Failed to fetch contacts from ${apiBaseUrl}: ${err.message}`); // Include the API URL in the error message
        } else {
          setError(`An unknown error occurred while fetching contacts from ${apiBaseUrl}.`);
        }
        console.error(`Error fetching contacts from ${apiBaseUrl}:`, err); // Log the error with the API URL
      } finally {
        setLoading(false);
      }
    };

    fetchContacts();
  }, []);

  if (loading) {
    return <div>Loading...</div>;
  }

  if (error) {
    return <div>Error: {error}</div>; // Display error message
  }

  return (
    <div>
      <h2>Contact List</h2>
      <ul>
        {contacts.map(contact => (
          <li key={contact.id}>
            <h3>{contact.first_name} {contact.last_name}</h3>
            <p>Role: {contact.contact_role}</p>
            <p>Email: {contact.email}</p>
            <p>Phone: {contact.phone}</p>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default ContactList;
