// components/Header.tsx
import { FunctionalComponent } from 'preact';
import { Link } from 'preact-router';

const Header: FunctionalComponent = () => {
  return (
    <header>
      <h1>ChemQuote</h1>
      <nav>
        <Link href="/">Home</Link>
        <Link href="/about">About</Link> 
      </nav>
    </header>
  );
};

export default Header;
