import React from 'react';
import { MemoryRouter } from 'react-router';
import renderer from 'react-test-renderer';
import FloodsAdminRoutes from './FloodsAdminRoutes';
import auth from './services/gqlAuth';

jest.mock('./services/gqlAuth', () => {
  return {
    isAuthenticated: jest.fn()
  }
});

describe('when the user is logged in', () => {
  beforeAll(() => {
    auth.isAuthenticated.mockReturnValue(true);
  });
  
  it('should render the root page correctly', () => {
    const tree = renderer.create(
      <MemoryRouter initialEntries={[ '/' ]}>
        <FloodsAdminRoutes />
      </MemoryRouter>
    ).toJSON();

    expect(tree).toMatchSnapshot();
  });

  it('should render the public page correctly', () => {
    const tree = renderer.create(
      <MemoryRouter initialEntries={[ '/public' ]}>
        <FloodsAdminRoutes />
      </MemoryRouter>
    ).toJSON();

    expect(tree).toMatchSnapshot();
  });

  it('should render the protected page correctly', () => {
   const tree = renderer.create(
      <MemoryRouter initialEntries={[ '/protected' ]}>
        <FloodsAdminRoutes />
      </MemoryRouter>
    ).toJSON();

    expect(tree).toMatchSnapshot();
  });

  it('should render the create user page correctly', () => {
   const tree = renderer.create(
      <MemoryRouter initialEntries={[ '/createuser' ]}>
        <FloodsAdminRoutes />
      </MemoryRouter>
    ).toJSON();

    expect(tree).toMatchSnapshot();
  });

});

describe('when the user is logged out', () => {
  beforeAll(() => {
    auth.isAuthenticated.mockReturnValue(false);
  });

  it('should render the root page correctly', () => {
    const tree = renderer.create(
      <MemoryRouter initialEntries={[ '/' ]}>
        <FloodsAdminRoutes />
      </MemoryRouter>
    ).toJSON();

    expect(tree).toMatchSnapshot();
  });

  it('should render the public page correctly', () => {
    const tree = renderer.create(
      <MemoryRouter initialEntries={[ '/public' ]}>
        <FloodsAdminRoutes />
      </MemoryRouter>
    ).toJSON();

    expect(tree).toMatchSnapshot();
  });

  it('should render the protected page correctly', () => {
    const tree = renderer.create(
      <MemoryRouter initialEntries={[ '/protected' ]}>
        <FloodsAdminRoutes />
      </MemoryRouter>
    ).toJSON();

    expect(tree).toMatchSnapshot();
  });

  it('should render the create user page correctly', () => {
    const tree = renderer.create(
      <MemoryRouter initialEntries={[ '/createuser' ]}>
        <FloodsAdminRoutes />
      </MemoryRouter>
    ).toJSON();

    expect(tree).toMatchSnapshot();
  });

});
