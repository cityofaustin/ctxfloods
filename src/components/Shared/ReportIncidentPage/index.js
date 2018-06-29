import React, { Component } from 'react';
import { graphql } from 'react-apollo';
import gql from 'graphql-tag';

import { logError } from 'services/logger';

import ContentPage from 'components/Shared/ContentPage';
import ButtonPrimary from 'components/Shared/Button/ButtonPrimary';
import TextArea from 'components/Shared/Form/TextArea';
import Checkbox from 'components/Shared/Form/Checkbox';

import "./ReportIncidentPage.css";

function toggleArrayItem(array, item) {
  if (array.includes(item)) {
    return array.filter(el => el !== item);
  }
  return [...array, item];
}

class ReportIncidentPage extends Component {
  constructor(...args) {
    super(...args);

    this.state = {
      notes: '',
      description: '',
      latitude: 30,
      longitude: 30,
      communityIds: [],
      errorMessage: null,
    };
  }

  onSubmit = async e => {
    e.preventDefault();
    fetch(`${process.env.REACT_APP_BACKEND_URL}/incident/report`, {
      method: 'POST',
      body: JSON.stringify({
        notes: this.state.notes,
        description: this.state.description,
        latitude: this.state.latitude,
        longitude: this.state.longitude,
        communityIds: this.state.communityIds,
      }),
      headers: new Headers({
        'Content-Type': 'application/json',
      }),
    })
      .then(res => {
        console.log(res.status);
        console.log(res);
      })
      .catch(err => {
        logError(err);
        this.setState({
          errorMessage: err.message,
        });
      });
  };

  toggleCommunity = e => {
    const communityId = Number(e.target.value);
    this.setState({
      communityIds: toggleArrayItem(this.state.communityIds, communityId),
    });
  };

  render() {
    return (
      <ContentPage>
        {this.state.errorMessage && <div>Error: {this.state.errorMessage}</div>}
        <h1>Report Incident</h1>
        <p>
          Report an incident such as flooding. Your report will be sent the
          relevant community administrators.
        </p>
        <form onSubmit={this.onSubmit}>
          <div>
            <h2>Describe the incident (required)</h2>
            <TextArea
              rows={3}
              cols={50}
              id="incident-notes"
              name="incident-notes"
              value={this.state.notes}
              onChange={e => this.setState({ notes: e.target.value })}
            />
          </div>
          <div>
            <h2>Which communities should this incident be reported to? (required)</h2>
            <fieldset value={this.state.notes}>
              {this.props.data.allCommunities &&
                this.props.data.allCommunities.nodes.map(community => (
                  <Checkbox
                    value={community.id}
                    checked={this.state.communityIds.includes(community.id)}
                    onChange={this.toggleCommunity}
                  >
                    {community.name}
                  </Checkbox>
                ))}
            </fieldset>
          </div>
          <div>
            <h2>Where did this incident occur?</h2>
            <div>
              <h3 htmlFor="incident-location-description">
                Additional location details (optional)
              </h3>
              <TextArea
                rows={3}
                cols={50}
                id="incident-location-description"
                name="incident-location-description"
                value={this.state.locationDescription}
                onChange={e =>
                  this.setState({ locationDescription: e.target.value })
                }
              />
            </div>
          </div>
          <div>
            <ButtonPrimary
              onClick={this.onSubmit}
              disabled={
                !this.state.notes ||
                !this.state.communityIds.length
              }
            >
              Submit
            </ButtonPrimary>
          </div>
        </form>
      </ContentPage>
    );
  }
}

export default graphql(gql`
  query {
    allCommunities(orderBy: NAME_ASC) {
      nodes {
        id
        name
      }
    }
  }
`)(ReportIncidentPage);
