import React, { Component } from 'react';
import { graphql } from 'react-apollo';
import gql from 'graphql-tag';
import Recaptcha from "react-google-recaptcha";

import { logError } from 'services/logger';

import ContentPage from 'components/Shared/ContentPage';
import ButtonPrimary from 'components/Shared/Button/ButtonPrimary';
import ButtonSecondary from 'components/Shared/Button/ButtonSecondary';
import TextArea from 'components/Shared/Form/TextArea';
import Checkbox from 'components/Shared/Form/Checkbox';

import IncidentLocationModal from './IncidentLocationModal';
import './ReportIncidentPage.css';

const Required = () => (
  <span className="ReportIncidentPage__required">Required*</span>
);
const Optional = () => (
  <span className="ReportIncidentPage__optional">Optional</span>
);

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
      locationDescription: '',
      latitude: null,
      longitude: null,
      communityIds: [],
      errorMessage: '',
      loading: false,
      usersNotifiedCount: null,
      createdReport: null,
      isLocationModalOpen: false,
      recaptchaResponse: null,
    };
  }

  onSubmit = async e => {
    try {
      e.preventDefault();

      this.setState({
        loading: true,
        errorMessage: '',
      });

      const res = await fetch(
        `${process.env.REACT_APP_BACKEND_URL}/incident/report`,
        {
          method: 'POST',
          body: JSON.stringify({
            notes: this.state.notes,
            locationDescription: this.state.locationDescription,
            latitude: this.state.latitude,
            longitude: this.state.longitude,
            communityIds: this.state.communityIds,
            recaptchaResponse: this.state.recaptchaResponse,
          }),
          headers: new Headers({
            'Content-Type': 'application/json',
          }),
        },
      );

      const data = await res.json();

      if (data.errorMessage) {
        throw new Error(data.errorMessage);
      }

      this.setState({
        usersNotifiedCount: data.usersNotifiedCount,
        createdReport: data.createdReport,
      });
    } catch (err) {
      logError(err);
      this.setState({
        errorMessage: err.message,
      });
    } finally {
      this.setState({
        loading: false,
      });
    }
  };

  toggleCommunity = e => {
    const communityId = Number(e.target.value);
    this.setState({
      communityIds: toggleArrayItem(this.state.communityIds, communityId),
    });
  };

  render() {
    if (this.state.createdReport) {
      return (
        <ContentPage className="ReportIncidentPage">
          <h1>Report Incident</h1>
          <h2>Incident report #{this.state.createdReport.id} created</h2>
          <p>
            Notified {this.state.usersNotifiedCount} community{' '}
            {this.state.usersNotifiedCount === 1
              ? 'administrators'
              : 'administrator'}
            .
          </p>
        </ContentPage>
      );
    }

    return (
      <ContentPage className="ReportIncidentPage">
        <h1>Report Incident</h1>
        <p>
          Report an incident such as flooding. Your report will be sent to the
          appropriate community administrators.
        </p>
        <form onSubmit={this.onSubmit}>
          <div>
            <h2>
              What happened? <Required />
            </h2>
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
            <h2>
              Which communities should this incident be reported to?{' '}
              <Required />
            </h2>
            <fieldset value={this.state.notes}>
              {this.props.data.allCommunities &&
                this.props.data.allCommunities.nodes.map(community => (
                  <Checkbox
                    key={community.id}
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
            <h2>
              Where did this incident occur? <Required />
            </h2>
            <div>
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
            <h2>
              Where on the map did this incident occurr? <Optional />
            </h2>
            <ButtonSecondary
              className="ReportIncidentPage__location-btn"
              onClick={e => {
                e.preventDefault();
                this.setState({
                  isLocationModalOpen: true,
                });
              }}
            >
              {this.state.longitude
                ? 'Update location'
                : 'Choose location on map'}
            </ButtonSecondary>
            {this.state.isLocationModalOpen && (
              <IncidentLocationModal
                isOpen={this.state.isLocationModalOpen}
                lngLat={
                  this.state.longitude && [
                    this.state.longitude,
                    this.state.latitude,
                  ]
                }
                onClose={() => {
                  this.setState({
                    isLocationModalOpen: false,
                  });
                }}
                saveLngLat={lngLat => {
                  this.setState({
                    longitude: lngLat[0],
                    latitude: lngLat[1],
                  });
                }}
              />
            )}
          </div>
          <div className="ReportIncidentPage__recaptcha">
            <Recaptcha
              sitekey="6LdUs3YUAAAAALEB7OGR-Gcozoa3xFPMFB5W6GvK"
              render="explicit"
              onChange={recaptchaResponse =>
                this.setState({ recaptchaResponse })
              }
            />
          </div>
          {this.state.errorMessage && (
            <div className="ReportIncidentPage__error-message">
              {this.state.errorMessage}
            </div>
          )}
          <div>
            <ButtonPrimary
              loading={this.state.loading}
              onClick={this.onSubmit}
              disabled={
                !this.state.notes ||
                !this.state.communityIds.length ||
                !this.state.locationDescription ||
                !this.state.recaptchaResponse
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
