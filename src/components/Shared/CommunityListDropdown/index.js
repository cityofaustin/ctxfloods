import React, { Component } from 'react';
import PropTypes from 'prop-types';
import gql from 'graphql-tag';
import { graphql } from 'react-apollo';
import { Link } from 'react-router-dom';
import onClickOutside from 'react-onclickoutside';

import './CommunityListDropdown.css';

class CommunityListDropdown extends Component {
  static propTypes = {
    data: PropTypes.object.isRequired,
    closeDropdown: PropTypes.func.isRequired,
  };
  
  handleClickOutside = () => {
    this.props.closeDropdown();
  };

  render() {
    if (this.props.data.loading) return null;
    if (this.props.data.error) {
      return <div>{this.props.data.error}</div>;
    }

    return (
      <div className="CommunityListDropdown">
        {this.props.data.allCommunities.nodes.map(community => (
          <Link
            to={`/map/community/${community.id}`}
            className="CommunityListDropdown__item"
            onClick={this.props.closeDropdown}
          >
            {community.name}
          </Link>
        ))}
      </div>
    );
  }
}

export default graphql(gql`
  query allCommunities {
    allCommunities {
      nodes {
        id
        name
      }
    }
  }
`)(onClickOutside(CommunityListDropdown));
