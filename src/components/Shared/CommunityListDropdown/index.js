import React, { Component } from 'react';
import PropTypes from 'prop-types';
import gql from 'graphql-tag';
import { graphql } from 'react-apollo';
import { Link } from 'react-router-dom';
import onClickOutside from 'react-onclickoutside';
import Media from 'react-media';

import Modal from 'components/Shared/Modal';
import ButtonSecondary from 'components/Shared/Button/ButtonSecondary';

import './CommunityListDropdown.css';

class CommunityListDropdown extends Component {
  static propTypes = {
    data: PropTypes.object.isRequired,
    closeDropdown: PropTypes.func.isRequired,
    location: PropTypes.object.isRequired,
  };

  handleClickOutside = () => {
    this.props.closeDropdown();
  };

  render() {
    if (this.props.data.loading) {
      return null;
    }
    if (this.props.data.error) {
      return <div>{this.props.data.error}</div>;
    }

    const items = (
      <div className="CommunityListDropdown">
        {this.props.data.allCommunities.nodes.map(community => (
          <Link
            to={`${(this.props.location.pathname.includes('dashboard') ? '/dashboard' : '')}/map/community/${community.id}`}
            className="CommunityListDropdown__item"
            onClick={this.props.closeDropdown}
            key={community.id}
          >
            {community.name}
          </Link>
        ))}
      </div>
    );

    return (
      <React.Fragment>
        <Media query="(min-width: 600px)" render={() => <div>{items}</div>} />
        <Media
          query="(max-width: 600px)"
          render={() => (
            <Modal
              isOpen
              title="All Communities"
              onClose={this.props.closeDropdown}
              footer={
                <ButtonSecondary onClick={this.props.closeDropdown}>
                  Cancel
                </ButtonSecondary>
              }
            >
              {items}
            </Modal>
          )}
        />
      </React.Fragment>
    );
  }
}

export default graphql(gql`
  query allCommunities {
    allCommunities(orderBy: NAME_ASC) {
      nodes {
        id
        name
      }
    }
  }
`)(onClickOutside(CommunityListDropdown));
