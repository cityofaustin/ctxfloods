import React, { Component } from 'react';
import { graphql } from 'react-apollo';
import gql from 'graphql-tag';

import ContentPage from 'components/Shared/ContentPage';
import ButtonPrimary from 'components/Shared/Button/ButtonPrimary';
import TextInput from 'components/Shared/Form/TextInput';
import Label from 'components/Shared/Form/Label';

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
      coordinates: null,
      notes: '',
      description: '',
      communityIds: [],
    };
  }

  onSubmit = () => window.alert('hi');

  toggleCommunity = e => {
    const communityId = Number(e.target.value);
    this.setState({
      communityIds: toggleArrayItem(this.state.communityIds, communityId),
    });
  };

  render() {
    return (
      <ContentPage>
        <h1>Report Incident</h1>
        <p>
          Report an incident such as flooding. Your report will be sent the
          relevant community administrators.
        </p>
        <form>
          <div>
            <h2>Describe the incident</h2>
            <TextInput
              id="incident-notes"
              name="incident-notes"
              type="text"
              value={this.state.notes}
              onChange={e => this.setState({ notes: e.target.value })}
            />
          </div>
          <div>
            <h2>
              Which communities should this incident be reported to?
            </h2>
            <fieldset value={this.state.notes}>
              {this.props.data.allCommunities &&
                this.props.data.allCommunities.nodes.map(community => (
                  <div>
                    <label>
                      <input
                        type="checkbox"
                        value={community.id}
                        checked={this.state.communityIds.includes(community.id)}
                        onChange={this.toggleCommunity}
                      />
                      {community.name}
                    </label>
                  </div>
                ))}
            </fieldset>
          </div>
          <div>
            <h2>
              Where did this incident occur?
            </h2>
            <Label htmlFor="incident-location">
              Address or description of location
            </Label>
            <TextInput
              id="incident-location-description"
              name="incident-location-description"
              type="text"
              value={this.state.notes}
              onChange={e => this.setState({ notes: e.target.value })}
            />
          </div>
          <div>
            <ButtonPrimary onClick={this.onSubmit}>Submit</ButtonPrimary>
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
