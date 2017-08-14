import React, { Component } from 'react';

class TableBody extends Component {

  render() {
    return (
      <tbody>
        {
          this.props.data.map((row, i) => {
            return (
              <tr key={i}>
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
    );
  }

}

export default TableBody;
