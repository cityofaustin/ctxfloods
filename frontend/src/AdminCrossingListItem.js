import React from 'react';
import AdminCrossingDescriptionCell from './AdminCrossingDescriptionCell';

class AdminCrossingListItem extends React.Component {

  render () {
    return (
      <div className='pa3 bg-black-05 ma3'>
        <AdminCrossingDescriptionCell crossing={this.props.crossing}/>
      </div>
    );
  }
}

export default AdminCrossingListItem;
