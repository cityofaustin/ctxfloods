import React from 'react';
import GraphiQL from 'graphiql';
import fetch from 'isomorphic-fetch';
import 'components/Shared/OpenDataPage/graphiql.css';
import 'components/Shared/OpenDataPage/OpenDataPage.css';

function graphQLFetcher(graphQLParams) {
  return fetch(process.env.REACT_APP_AWS_ENDPOINT, {
    method: 'post',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(graphQLParams),
  }).then(response => response.json());
}

export default function OpenDataPage() {
  return (
    <div className='OpenDataPage'>
      <div> Open Data </div>
      <a> Legacy XML </a>
      <GraphiQL fetcher={graphQLFetcher} />
    </div>
  );
}
