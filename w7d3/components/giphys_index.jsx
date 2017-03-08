import React from 'react';

class GiphysIndex extends React.Component {
  constructor (props) {
    super(props);
  }

  render () {
    let items = this.props.giphys;
    // debugger
    if (items.length === 0) {
      return <h3>No GIFs!</h3>;
    }
    else {
      return (
        <ul>
          {items.map((obj, i) => {
            return (<li key={i}>
              <img src={obj.images.original.url} />
            </li>
          );
        })}
      </ul>
    );
    }
  }
}

export default GiphysIndex;
