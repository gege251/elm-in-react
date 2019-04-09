import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import { toggleGreeting, changeName } from './actions'

class App extends Component {
  render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1 className="App-title">Welcome to React</h1>
        </header>
        <p className="App-intro">
          {`${this.props.store.greeting} ${this.props.store.name}`}
        </p>
        <button onClick={() => this.props.dispatch(toggleGreeting())}>Toggle greeting</button>
        <button onClick={() => this.props.dispatch(changeName('Jeno'))}>Change name</button>
      </div>
    );
  }
}

export default App;
