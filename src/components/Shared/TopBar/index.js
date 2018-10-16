import React from 'react';

import './TopBar.css';

export default function TopBar({ children }) {
  return (
    <div className="TopBar">
      <div className="TopBar__banner-message">
        <div>
          This site is a work in progress. If you don’t find what you need,
          visit
          <a
            href="https://atxfloods.com/"
            target="_blank"
            rel="noopener noreferrer"
          >
            atxfloods.com
          </a>
          .
        </div>
      </div>
      <div>{children}</div>
    </div>
  );
}
