import React, { useState, useEffect } from 'react';
import axios from 'axios';

const Contacts = () => {
    const [contacts, setContacts] = useState([]);
    const [newContact, setNewContact] = useState({ first_name: '', last_name: '', email: '', customer_id: '', contact_role: '', phone: '' });

    useEffect(() => {
        fetchContacts();
    }, []);

    const fetchContacts = async () => {
        const response = await axios.get('/api/contacts');
        setContacts(response.data);
    };

    const handleInputChange = (e) => {
        setNewContact({ ...newContact, [e.target.name]: e.target.value });
    };

    const addContact = async () => {
        await axios.post('/api/contacts', newContact);
        fetchContacts(); // Refresh the list
        setNewContact({ first_name: '', last_name: '', email: '', customer_id: '', contact_role: '', phone: '' }); // Reset form
    };

    const deleteContact = async (id) => {
        if (window.confirm('Are you sure you want to delete this contact?')) {
            await axios.delete(`/api/contacts/${id}`);
            fetchContacts(); // Refresh the list
        }
    };

    return (
        <div>
            <h2>Contact Management</h2>
            <table>
                <thead>
                    <tr>
                        <th>Customer ID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Contact Role</th>
                        <th>Phone</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    {contacts.map(contact => (
                        <tr key={contact.id}>
                            <td>{contact.customer_id}</td>
                            <td>{contact.first_name}</td>
                            <td>{contact.last_name}</td>
                            <td>{contact.email}</td>
                            <td>{contact.contact_role}</td>
                            <td>{contact.phone}</td>
                            <td>
                                <button onClick={() => deleteContact(contact.id)}>🗑️</button>
                            </td>
                        </tr>
                    ))}
                </tbody>
            </table>
            <h3>Add New Contact</h3>
            <input name="customer_id" placeholder="Customer ID" value={newContact.customer_id} onChange={handleInputChange} />
            <input name="first_name" placeholder="First Name" value={newContact.first_name} onChange={handleInputChange} />
            <input name="last_name" placeholder="Last Name" value={newContact.last_name} onChange={handleInputChange} />
            <input name="email" placeholder="Email" value={newContact.email} onChange={handleInputChange} />
            <input name="contact_role" placeholder="Contact Role" value={newContact.contact_role} onChange={handleInputChange} />
            <input name="phone" placeholder="Phone" value={newContact.phone} onChange={handleInputChange} />
            <button onClick={addContact}>Add Contact</button>
        </div>
    );
};

export default Contacts;
