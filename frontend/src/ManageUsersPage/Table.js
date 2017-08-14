import React, { Component } from 'react';
import TableHeader from './TableHeader'
import TableBody from './TableBody'

class Table extends Component {

  render() {
    return (
      <table>
        <TableHeader headers={this.props.headers} {...this.props} />
        <TableBody data={this.props.data} />
      </table>
    );
  }

}

export default Table;
