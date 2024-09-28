import { h } from 'preact';
import { Router } from 'preact-router';
import Home from './pages/Home';
import About from './pages/About';

const App = () => (
    <Router>
        <Home path="/" />
        <About path="/about" />
    </Router>
);

export default App;
