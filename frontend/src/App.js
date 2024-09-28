import React from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import Welcome from './components/Welcome';
// other imports...

function App() {
    return (
        <Router>
            <Switch>
                <Route path="/" exact component={Welcome} />
                {/* Other routes */}
            </Switch>
        </Router>
    );
}

