import React from 'react';
import GraphiQL from 'graphiql';
import fetch from 'isomorphic-fetch';
import 'components/Shared/OpenDataPage/graphiql.css';
import 'components/Shared/OpenDataPage/OpenDataPage.css';

function graphQLFetcher(graphQLParams) {
  return fetch(`${process.env.REACT_APP_BACKEND_URL}/graphql`, {
    method: 'post',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(graphQLParams),
  }).then(response => response.json());
}

export default function OpenDataPage() {
  return (
    <div className="OpenDataPage">
      <div className="OpenDataPage__header">
        <h1 className="OpenDataPage__heading">Open Data</h1>
        <a
          className="OpenDataPage__api-link"
          href={`${process.env.REACT_APP_BACKEND_URL}/xml`}
        >
          Legacy XML
        </a>
        <a
          className="OpenDataPage__api-link"
          href={`${process.env.REACT_APP_BACKEND_URL}/graphql`}
        >
          GraphQL Endpoint
        </a>
      </div>
      <GraphiQL fetcher={graphQLFetcher} />
    </div>
  );
}
