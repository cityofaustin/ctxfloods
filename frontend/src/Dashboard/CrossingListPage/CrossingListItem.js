import React from 'react';
import FontAwesome from 'react-fontawesome';

class CrossingListItem extends React.Component {

  render () {
    return (

      <div>
        <img src={require('./example.png')} style={{"height":"348px"}} />
        CROSSING LIST ITEM
        <FontAwesome name='circle-o' />
        {this.props.status}
        {this.props.dirty}
      </div>
    );
  }
}

export default CrossingListItem;
