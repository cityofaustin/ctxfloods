import React, { Component } from 'react';
import './Table.css'

class Table extends Component {

  render() {
    const { data, checkboxColumn } = this.props;

    return (
      <table className="Table">
        <thead>
          <tr>
            {this.props.headers.map((header, i) => {
              return <th key={i} scope="col">{header.title}</th>
            })}
          </tr>
        </thead>
        <tbody>
          {
            data.map((row, i) => {
              return (
                <tr key={i}>
                  { checkboxColumn && <td><input type="checkbox" /></td> }
                  { row.map((cell, i) => {
                    return (
                      <td key={i}>{cell}</td>
                    )
                  })}
                </tr>
              )
            })
          }
        </tbody>
      </table>
    );
  }

}

export default Table;
