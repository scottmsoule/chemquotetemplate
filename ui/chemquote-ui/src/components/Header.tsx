import { FunctionalComponent } from 'preact';

const Header: FunctionalComponent = () => {
  return (
    <header>
      <h1>ChemQuote</h1>
      <nav>
        <a href="/">Home</a>
        <a href="/about">About</a>
      </nav>
    </header>
  );
};

export default Header;
