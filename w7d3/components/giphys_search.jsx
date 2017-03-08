import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor (props) {
    super(props);
    this.state = {searchTerm: ""};
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(e) {
    e.preventDefault;
    this.setState({searchTerm: e.target.value});
  }

  handleSubmit (e) {
    e.preventDefault;
    this.props.fetchSearchGiphys(this.state.searchTerm);
    this.setState({searchTerm: ""});
  }

  render () {
    const state = this.state;
    return (
      <div>
      <label id="search">Search</label>
      <input type="text" onChange = {this.handleChange}/>
      <button onClick= {this.handleSubmit}>Submit</button>
      <GiphysIndex state = {state} giphys = {this.props.giphys} fetchSearchGiphys = {this.props.fetchSearchGiphys}/>
      </div>
    );
  }
}

export default GiphysSearch;
