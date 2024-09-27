import React from 'react';
import Welcome from './components/Welcome'; // Adjust the path as necessary
import Contacts from './components/Contacts'; // Assuming you have this component

const App = () => {
    return (
        <div>
            <Welcome />  {/* Display the welcome screen */}
            {/* <Contacts /> Uncomment to show the contacts component */}
        </div>
    );
};

export default App;
