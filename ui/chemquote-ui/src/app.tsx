import { FunctionalComponent } from 'preact';
import { Route, Router } from 'preact-router';
import Header from './components/Header';
import Home from './pages/Home';
import About from './pages/About';

const App: FunctionalComponent = () => {
  return (
    <div>
      <Header />
      <Router>
        <Route path="/" component={Home} />
        <Route path="/about" component={About} />
        {/* Add more routes as needed */}
      </Router>
    </div>
  );
};

export default App;
