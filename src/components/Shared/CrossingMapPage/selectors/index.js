import { createSelector } from 'reselect';

const getOpenCrossingsResult = props => props.openCrossings;
const getClosedCrossingsResult = props => props.closedCrossings;
const getCautionCrossingsResult = props => props.cautionCrossings;
const getLongtermCrossingsResult = props => props.longtermCrossings;
const getAllCommunitiesResult = props => props.allCommunities;
const getAllCamerasResult = props => props.allCameras;
const getSelectedCrossingId = props => props.selectedCrossingId;

export const getIsLoading = createSelector(
  [
    getOpenCrossingsResult,
    getClosedCrossingsResult,
    getCautionCrossingsResult,
    getLongtermCrossingsResult,
    getAllCommunitiesResult,
    getAllCamerasResult,
  ],
  (
    openCrossings,
    closedCrossings,
    cautionCrossings,
    longtermCrossings,
    allCommunities,
    allCameras,
  ) => {
    return (
      !openCrossings || openCrossings.loading ||
      !closedCrossings || closedCrossings.loading ||
      !cautionCrossings || cautionCrossings.loading ||
      !longtermCrossings || longtermCrossings.loading ||
      !allCommunities || allCommunities.loading ||
      !allCameras || allCameras.loading
    )
  }
)

export const isLoadedWithErrors = createSelector(
  [
    getIsLoading,
    getOpenCrossingsResult,
    getClosedCrossingsResult,
    getCautionCrossingsResult,
    getLongtermCrossingsResult,
  ],
  (
    isLoading,
    openCrossings,
    closedCrossings,
    cautionCrossings,
    longtermCrossings
  ) => {
    return !isLoading && (
      openCrossings.searchCrossings == null ||
      closedCrossings.searchCrossings == null ||
      cautionCrossings.searchCrossings == null ||
      longtermCrossings.searchCrossings == null
    )
  }
)

export const getOpenCrossings = createSelector(
  [getIsLoading, getOpenCrossingsResult],
  (isLoading, openCrossingsResult) => {
    return !isLoading
      ? openCrossingsResult.searchCrossings.nodes
      : null;
  }
)

export const getCautionCrossings = createSelector(
  [getIsLoading, getCautionCrossingsResult],
  (isLoading, cautionCrossingsResult) => {
    return !isLoading
      ? cautionCrossingsResult.searchCrossings.nodes
      : null;
  }
)

export const getClosedCrossings = createSelector(
  [getIsLoading, getClosedCrossingsResult],
  (isLoading, closedCrossingsResult) => {
    return !isLoading
      ? closedCrossingsResult.searchCrossings.nodes
      : null;
  }
)

export const getLongtermCrossings = createSelector(
  [getIsLoading, getLongtermCrossingsResult],
  (isLoading, longtermCrossingsResult) => {
    return !isLoading
      ? longtermCrossingsResult.searchCrossings.nodes
      : null;
  }
)

export const getAllCommunities = createSelector(
  [getIsLoading, getAllCommunitiesResult],
  (isLoading, allCommunitiesResult) => {
    return !isLoading
      ? allCommunitiesResult.allCommunities.nodes
      : null
  }
)

export const getAllCameras = createSelector(
  [getIsLoading, getAllCamerasResult],
  (isLoading, getAllCamerasResult) => {
    return !isLoading
      ? getAllCamerasResult.allCameras.nodes
      : null
  }
)

export const getSelectedCrossing = createSelector(
  [
    getSelectedCrossingId,
    getIsLoading,
    getOpenCrossings,
    getClosedCrossings,
    getCautionCrossings,
    getLongtermCrossings,
  ],
  (
    selectedCrossingId,
    isLoading,
    openCrossings,
    closedCrossings,
    cautionCrossings,
    longtermCrossings,
  ) => {
    if (!selectedCrossingId || isLoading) return null;

    const crossing = openCrossings.find(
      c => c.id === selectedCrossingId,
    ) ||
    closedCrossings.find(
      c => c.id === selectedCrossingId,
    ) ||
    cautionCrossings.find(
      c => c.id === selectedCrossingId,
    ) ||
    longtermCrossings.find(
      c => c.id === selectedCrossingId,
    );
    return crossing;
  }
)
