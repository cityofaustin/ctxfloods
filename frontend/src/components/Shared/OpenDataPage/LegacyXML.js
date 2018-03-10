import React, { Component } from 'react';
import { graphql } from 'react-apollo';
import gql from 'graphql-tag';

class LegacyXML extends Component {
  render() {
    const isLoading =
      !this.props.data ||
      this.props.data.loading;

    if (isLoading) return "loading";

    return this.props.data.legacyXml;
  }
}

const legacyQuery = gql`
  {
    legacyXml
  }
`;

export default graphql(legacyQuery)(LegacyXML);
