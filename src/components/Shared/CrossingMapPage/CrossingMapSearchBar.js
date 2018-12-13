import React, { Component } from 'react';
import PropTypes from 'prop-types';
import FontAwesome from 'react-fontawesome';
import Autosuggest from 'react-autosuggest';
import { withRouter } from 'react-router';

import CrossingMapSearchCrossingSuggestions from 'components/Shared/CrossingMapPage/CrossingMapSearchCrossingSuggestions';
import 'components/Shared/CrossingMapPage/CrossingMapSearchBar.css';
import { statusNames, statusIcons } from 'constants/StatusConstants';

const HERE_APP_ID = `NwvYKNdIJp8nYo74bUTU`;
const HERE_APP_CODE = `VHZxGy1nmghs2BCbo0cVCQ`;

// When suggestion is clicked, Autosuggest needs to populate the input
// based on the clicked suggestion. Teach Autosuggest how to calculate the
// input value for every given suggestion.
const getSuggestionValue = suggestion => {
  return suggestion.place_name || suggestion.name;
};

// Use your imagination to render suggestions.
const Suggestion = suggestion => (
  <div className="CrossingMapSearchBar__suggestion-container">
    <div className="CrossingMapSearchBar__suggestion-icon">
      {suggestion.__typename === 'Crossing' && (
        <img
          src={statusIcons[suggestion.latestStatusId]}
          alt={statusNames[suggestion.latestStatusId]}
        />
      )}
      {suggestion.__typename === 'Community' && (
        <FontAwesome name="globe" size="2x" />
      )}
      {suggestion.__typename !== 'Crossing' &&
        suggestion.__typename !== 'Community' && (
          <FontAwesome name="map-marker" size="2x" />
        )}
    </div>
    <div>
      <div className="CrossingMapSearchBar__suggestion-text--primary">
        {suggestion.name}
      </div>
      <div className="CrossingMapSearchBar__suggestion-text--secondary">
        {suggestion.humanAddress}
        {suggestion.__typename === 'Community' && 'Community'}
      </div>
    </div>
  </div>
);

const formatSearchQuery = query => {
  return `%${query.replace(/ /g, '%')}%`;
};

class CrossingMapSearchBar extends Component {
  static propTypes = {
    history: PropTypes.object.isRequired,
  };

  state = {
    typedValue: '',
    selectedValue: '',
    geocodeSuggestions: [],
    crossingSuggestions: [],
    communitySuggestions: [],
  };

  onChange = (event, { newValue, method }) => {
    if (method === 'type') {
      this.setState({
        typedValue: newValue,
        selectedValue: null,
      });
    } else if (method === 'escape') {
      this.setState({
        selectedValue: null,
      });
    } else if (method === 'enter' || method === 'click') {
      this.setState({
        selectedValue: newValue,
        typedValue: newValue,
      });
    } else if (method === 'down' || method === 'up') {
      this.setState({
        selectedValue: newValue,
      });
    }
  };

  dashPrepend = () => {
    return this.props.onDash ? '/dashboard' : '';
  };

  onSuggestionSelected = (
    event,
    { suggestion, suggestionValue, suggestionIndex, sectionIndex, method },
  ) => {
    if (suggestion.__typename === 'Crossing') {
      this.props.history.push(
        `${this.dashPrepend()}/map/crossing/${suggestion.id}`,
      );
    } else if (suggestion.__typename === 'Community') {
      this.props.history.push(
        `${this.dashPrepend()}/map/community/${suggestion.id}`,
      );
    } else if (suggestion.location) {
      const lng = suggestion.location[1];
      const lat = suggestion.location[0];
      this.props.setSelectedFeature({
        type: "Misc",
        data: {
          coordinates: [lng, lat],
          name: suggestion.name
        }
      });
    }

    // Unfocus the search bar
    this.autosuggestInput.blur();
  };

  // Autosuggest will call this function every time you need to update suggestions.
  onSuggestionsFetchRequested = ({ value }) => {
    const { center, communityId, communities } = this.props;
    const inputLength = value.length;

    if (inputLength > 2) {
      fetch(
        `https://places.api.here.com/places/v1/autosuggest?at=${center.lat},${
          center.lng
        }&q=${value}&app_id=${HERE_APP_ID}&app_code=${HERE_APP_CODE}`,
      )
        .then(response => {
          if (response.status !== 200) {
            console.log(
              'Looks like there was a problem. Status Code: ' + response.status,
            );
            this.setState({ geocodeSuggestions: [] });
            return;
          }

          response.json().then(data => {
            const filteredResults = data.results.filter(
              result => result.position && result.vicinity,
            );
            const suggestions = filteredResults.map(result => ({
              name: result.title,
              location: result.position,
              humanAddress: result.vicinity.replace(/<br\/>/g, ', '),
            }));
            this.setState({ geocodeSuggestions: suggestions });
          });
        })
        .catch(err => {
          console.log('Fetch Error :-S', err);
          this.setState({ geocodeSuggestions: [] });
        });
    } else {
      this.setState({ geocodeSuggestions: [] });
    }

    // If we aren't filtering by community, get the communities
    if (communities && !communityId) {
      const inputValue = value.trim().toLowerCase();
      const communitySuggestions = communities
        .filter(c => c.name.toLowerCase().includes(inputValue))
        .slice(0, 4);
      this.setState({ communitySuggestions: communitySuggestions });
    } else {
      this.setState({ communitySuggestions: [] });
    }
  };

  // Autosuggest will call this function every time you need to clear suggestions.
  onSuggestionsClearRequested = () => {
    this.setState({
      geocodeSuggestions: [],
      communitySuggestions: [],
    });
  };

  clearSearch = () => {
    this.setState({ typedValue: '', selectedValue: null });
    this.props.history.push(`${this.dashPrepend()}/map`);
  };

  updateCrossingSuggestions = suggestions => {
    this.setState({
      crossingSuggestions: suggestions,
    });
  };

  onInputFocus = () => {
    this.props.toggleSearchFocus(true);
  };

  onInputBlur = () => {
    this.props.toggleSearchFocus(false);
  };

  render() {
    const { selectedCrossingId, communityId } = this.props;

    const {
      typedValue,
      selectedValue,
      geocodeSuggestions,
      crossingSuggestions,
      communitySuggestions,
    } = this.state;

    const suggestions =
      typedValue.length > 2
        ? communitySuggestions
            .concat(crossingSuggestions)
            .concat(geocodeSuggestions)
        : [];

    const value = selectedValue ? selectedValue : typedValue;

    // Autosuggest will pass through all these props to the input.
    const inputProps = {
      placeholder: 'Search...',
      value,
      onChange: this.onChange,
      onFocus: this.onInputFocus,
      onBlur: this.onInputBlur,
      type: 'search',
    };

    const formattedQuery = formatSearchQuery(typedValue);

    return (
      <div className="CrossingMapSearchBar__container">
        <CrossingMapSearchCrossingSuggestions
          searchQuery={formattedQuery}
          communityId={communityId}
          updateSuggestions={this.updateCrossingSuggestions}
        />
        <div className="CrossingMapSearchBar__text-entry">
          {selectedCrossingId &&
            !this.props.mobile && (
              <div
                className="CrossingMapSearchBar__close-selection"
                onClick={this.clearSearch}
              >
                <FontAwesome name="window-close" size="2x" />
              </div>
            )}
          {(!selectedCrossingId || this.props.mobile) && (
            <Autosuggest
              ref={autosuggest => {
                if (autosuggest !== null) {
                  this.autosuggestInput = autosuggest.input;
                }
              }}
              suggestions={suggestions}
              onSuggestionsFetchRequested={this.onSuggestionsFetchRequested}
              onSuggestionsClearRequested={this.onSuggestionsClearRequested}
              onSuggestionSelected={this.onSuggestionSelected}
              onSuggestionHighlighted={this.onSuggestionHighlighted}
              getSuggestionValue={getSuggestionValue}
              renderSuggestion={Suggestion}
              inputProps={inputProps}
              shouldRenderSuggestions={() => true}
              focusInputOnSuggestionClick={false}
              highlightFirstSuggestion={true}
            />
          )}
        </div>
      </div>
    );
  }
}

export default withRouter(CrossingMapSearchBar);
