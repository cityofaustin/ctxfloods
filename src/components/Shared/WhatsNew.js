import React from 'react';

import ContentPage from 'components/Shared/ContentPage';
import octocat from 'images/github_octocat.png';

const octocatImage = (
  <img src={octocat} alt={"github"} style={{height:"1.5em", position:"relative", top:"5px", left:"-5px"}}/>
);
const newFeature = (issue, message) => (
  <li>
    <a href={`https://github.com/cityofaustin/ctxfloods/issues/${issue}`}>{octocatImage}</a>
    {` ${message}`}
  </li>
)

export default function WhatsNew() {
  return (
    <ContentPage>
      <h1>What's New</h1>

      <p>For a complete list of all development updates, please visit our{' '}
      <a href="https://github.com/cityofaustin/ctxfloods/issues?utf8=%E2%9C%93&q=is%3Aissue+is%3Aclosed+updated%3A%3E%3D2018-10-01">
      {`github page`}
      </a>.
      </p>

      <h2>01/25/2019</h2>
      <ul>
        {newFeature(440, "Add message if login is invalid")}
        {newFeature(389, "Fix case sensitive email logins")}
      </ul>

      <h2>12/14/2018</h2>
      <ul>
        {newFeature(195, "Cameras added to Crossing Map")}
      </ul>

      <h2>12/11/2018</h2>
      <ul>
        {[
          newFeature(390, "Push Notifications about closed crossings are emailed to admins after 24 hours"),
          newFeature(402, "Admins can create new communities when adding a new user"),
          newFeature(404, "Crossings can be added by inputing latitude and longitude"),
          newFeature(382, "History can be filtered by community and date"),
          newFeature(353, "Login bugs fixed"),
          newFeature(379, "Converted backend to Graphile library"),
          newFeature(410, "Floods Safety page updated to include new links"),
        ]}
      </ul>

      <h2>11/07/2018</h2>
      <ul>
        {[
          newFeature(396, "Allow users to select a duration for longterm closure crossings."),
        ]}
      </ul>

    </ContentPage>
  );
}
