import { createSelector } from 'reselect';

const exists = x => {
  return (x !== null && x !== undefined)
}

const getOpenCrossingsResult = props => props.openCrossings;
const getClosedCrossingsResult = props => props.closedCrossings;
const getCautionCrossingsResult = props => props.cautionCrossings;
const getLongtermCrossingsResult = props => props.longtermCrossings;
const getAllCommunitiesResult = props => props.allCommunities;
const getAllCamerasResult = props => props.allCameras;

export const getSelectedCrossingId = props => {
  let selectedCrossingId = props.match.params.selectedCrossingId;
  return exists(selectedCrossingId) ? Number(selectedCrossingId) : null;
}
export const getSelectedCommunityId = props => {
  let selectedCommunityId = props.match.params.selectedCommunityId;
  return exists(selectedCommunityId) ? Number(selectedCommunityId) : null;
}
export const getSelectedCameraId = props => {
  let selectedCameraId = props.match.params.selectedCameraId;
  return exists(selectedCameraId) ? Number(selectedCameraId) : null;
}

export const isDataLoaded = createSelector(
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
    return !(
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
    isDataLoaded,
    getOpenCrossingsResult,
    getClosedCrossingsResult,
    getCautionCrossingsResult,
    getLongtermCrossingsResult,
  ],
  (
    isDataLoaded,
    openCrossings,
    closedCrossings,
    cautionCrossings,
    longtermCrossings
  ) => {
    return isDataLoaded && (
      openCrossings.searchCrossings == null ||
      closedCrossings.searchCrossings == null ||
      cautionCrossings.searchCrossings == null ||
      longtermCrossings.searchCrossings == null
    )
  }
)

export const getOpenCrossings = createSelector(
  [isDataLoaded, getOpenCrossingsResult],
  (isDataLoaded, openCrossingsResult) => {
    return isDataLoaded
      ? openCrossingsResult.searchCrossings.nodes
      : null;
  }
)

export const getCautionCrossings = createSelector(
  [isDataLoaded, getCautionCrossingsResult],
  (isDataLoaded, cautionCrossingsResult) => {
    return isDataLoaded
      ? cautionCrossingsResult.searchCrossings.nodes
      : null;
  }
)

export const getClosedCrossings = createSelector(
  [isDataLoaded, getClosedCrossingsResult],
  (isDataLoaded, closedCrossingsResult) => {
    return isDataLoaded
      ? closedCrossingsResult.searchCrossings.nodes
      : null;
  }
)

export const getLongtermCrossings = createSelector(
  [isDataLoaded, getLongtermCrossingsResult],
  (isDataLoaded, longtermCrossingsResult) => {
    return isDataLoaded
      ? longtermCrossingsResult.searchCrossings.nodes
      : null;
  }
)

export const getAllCommunities = createSelector(
  [isDataLoaded, getAllCommunitiesResult],
  (isDataLoaded, allCommunitiesResult) => {
    return isDataLoaded
      ? allCommunitiesResult.allCommunities.nodes
      : null
  }
)

export const getAllCameras = createSelector(
  [isDataLoaded, getAllCamerasResult],
  (isDataLoaded, getAllCamerasResult) => {
    return isDataLoaded
      ? getAllCamerasResult.getAllCamerasWithLatestPhoto.nodes
      : null
  }
)

export const getSelectedCrossing = createSelector(
  [
    getSelectedCrossingId,
    isDataLoaded,
    getOpenCrossings,
    getClosedCrossings,
    getCautionCrossings,
    getLongtermCrossings,
  ],
  (
    selectedCrossingId,
    isDataLoaded,
    openCrossings,
    closedCrossings,
    cautionCrossings,
    longtermCrossings,
  ) => {
    if (!selectedCrossingId || !isDataLoaded) return null;

    let crossing = openCrossings.find(
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
    if (crossing) {
      // TypeError: Cannot add property coordinates, object is not extensible
      crossing = Object.assign({}, crossing);
      crossing.coordinates = JSON.parse(crossing.geojson).coordinates;
    }
    return crossing || null;
  }
)

export const getSelectedCommunity = createSelector(
  [
    getSelectedCommunityId,
    isDataLoaded,
    getAllCommunities
  ],
  (selectedCommunityId, isDataLoaded, allCommunities) => {
    if (!allCommunities || !isDataLoaded) return null;
    return allCommunities.find(c => c.id === selectedCommunityId) || null
  }
)

export const getSelectedCamera = createSelector(
  [
    getSelectedCameraId,
    isDataLoaded,
    getAllCameras,
  ],
  (selectedCameraId, isDataLoaded, allCameras) => {
    if (!allCameras || !isDataLoaded) return null;
    let camera = allCameras.find(c => c.id === selectedCameraId);
    if (camera) {
      // TypeError: Cannot add property coordinates, object is not extensible
      camera = Object.assign({}, camera);
      camera.coordinates = JSON.parse(camera.geojson).coordinates;
    }
    return camera || null;
  }
)
