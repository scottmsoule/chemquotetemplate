import { FunctionalComponent } from 'preact';
import { Route, Router } from 'preact-router';
import Header from './components/Header';
import Home from './pages/Home';

const App: FunctionalComponent = () => {
  return (
    <div>
      <Header />
      <Router>
        <Route path="/" component={Home} />
        {/* Add more routes as needed */}
      </Router>
    </div>
  );
};

export default App;
