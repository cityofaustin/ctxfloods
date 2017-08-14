import React, { Component } from 'react';

class TableHeader extends Component {

  render() {
    return (
      <thead>
        <tr>
          {this.props.headers.map((header) => {
            return <th>{header.title}</th>
          })}
        </tr>
      </thead>
    );
  }

}

export default TableHeader;
