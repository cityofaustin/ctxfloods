const schema = `
"""All input for the 'addCameraImage' mutation."""
input AddCameraImageInput {
  """
  An arbitrary string value with no semantic meaning. Will be included in the
  payload verbatim. May be used to track mutations by the client.
  """
  clientMutationId: String
  cameraId: Int
  url: String
  uploadedAt: Datetime
}

"""The output of our 'addCameraImage' mutation."""
type AddCameraImagePayload {
  """
  The exact same 'clientMutationId' that was provided in the mutation input,
  unchanged and unused. May be used by a client to track mutations.
  """
  clientMutationId: String
  integer: Int

  """
  Our root query field type. Allows us to run any query from our mutation payload.
  """
  query: Query
}

"""All input for the 'addCrossingToCommunity' mutation."""
input AddCrossingToCommunityInput {
  """
  An arbitrary string value with no semantic meaning. Will be included in the
  payload verbatim. May be used to track mutations by the client.
  """
  clientMutationId: String
  crossingId: Int!
  communityId: Int!
}

"""The output of our 'addCrossingToCommunity' mutation."""
type AddCrossingToCommunityPayload {
  """
  The exact same 'clientMutationId' that was provided in the mutation input,
  unchanged and unused. May be used by a client to track mutations.
  """
  clientMutationId: String
  crossing: Crossing

  """
  Our root query field type. Allows us to run any query from our mutation payload.
  """
  query: Query

  """Reads a single 'StatusUpdate' that is related to this 'Crossing'."""
  statusUpdateByLatestStatusUpdateId: StatusUpdate

  """Reads a single 'Status' that is related to this 'Crossing'."""
  statusByLatestStatusId: Status

  """Reads a single 'WazeStreet' that is related to this 'Crossing'."""
  wazeStreetByWazeStreetId: WazeStreet

  """An edge for our 'Crossing'. May be used by Relay 1."""
  crossingEdge(
    """The method to use when ordering 'Crossing'."""
    orderBy: [CrossingsOrderBy!] = [PRIMARY_KEY_ASC]
  ): CrossingsEdge
}

"""All input for the 'addCrossingWithNewCommunity' mutation."""
input AddCrossingWithNewCommunityInput {
  """
  An arbitrary string value with no semantic meaning. Will be included in the
  payload verbatim. May be used to track mutations by the client.
  """
  clientMutationId: String
  crossingName: String
  humanAddress: String
  longitude: BigFloat
  latitude: BigFloat
  communityName: String
  description: String
  legacyId: Int
  wazeStreetId: Int
}

"""The output of our 'addCrossingWithNewCommunity' mutation."""
type AddCrossingWithNewCommunityPayload {
  """
  The exact same 'clientMutationId' that was provided in the mutation input,
  unchanged and unused. May be used by a client to track mutations.
  """
  clientMutationId: String
  crossing: Crossing

  """
  Our root query field type. Allows us to run any query from our mutation payload.
  """
  query: Query

  """Reads a single 'StatusUpdate' that is related to this 'Crossing'."""
  statusUpdateByLatestStatusUpdateId: StatusUpdate

  """Reads a single 'Status' that is related to this 'Crossing'."""
  statusByLatestStatusId: Status

  """Reads a single 'WazeStreet' that is related to this 'Crossing'."""
  wazeStreetByWazeStreetId: WazeStreet

  """An edge for our 'Crossing'. May be used by Relay 1."""
  crossingEdge(
    """The method to use when ordering 'Crossing'."""
    orderBy: [CrossingsOrderBy!] = [PRIMARY_KEY_ASC]
  ): CrossingsEdge
}

"""All input for the 'authenticate' mutation."""
input AuthenticateInput {
  """
  An arbitrary string value with no semantic meaning. Will be included in the
  payload verbatim. May be used to track mutations by the client.
  """
  clientMutationId: String
  email: String!
  password: String!
}

"""The output of our 'authenticate' mutation."""
type AuthenticatePayload {
  """
  The exact same 'clientMutationId' that was provided in the mutation input,
  unchanged and unused. May be used by a client to track mutations.
  """
  clientMutationId: String
  jwtToken: JwtToken

  """
  Our root query field type. Allows us to run any query from our mutation payload.
  """
  query: Query
}

"""
A floating point number that requires more precision than IEEE 754 binary 64
"""
scalar BigFloat

"""A camera location on a map"""
type Camera implements Node {
  """
  A globally unique identifier. Can be used in various places throughout the system to identify this single value.
  """
  nodeId: ID!

  """The primary unique identifier for the camera."""
  id: Int!

  """Where the camera data is from (beholder or atd)"""
  source: String!

  """Primary key of camera in original source"""
  sourceId: String!

  """Human-readable location name of the camera"""
  name: String!

  """The GeoJSON coordinates of the camera."""
  geojson: String!

  """Reads and enables pagination through a set of 'CameraImage'."""
  cameraImagesByCameraId(
    """Only read the first 'n' values of the set."""
    first: Int

    """Only read the last 'n' values of the set."""
    last: Int

    """
    Skip the first 'n' values from our 'after' cursor, an alternative to cursor
    based pagination. May not be used with 'last'.
    """
    offset: Int

    """Read all values in the set before (above) this cursor."""
    before: Cursor

    """Read all values in the set after (below) this cursor."""
    after: Cursor

    """The method to use when ordering 'CameraImage'."""
    orderBy: [CameraImagesOrderBy!] = [PRIMARY_KEY_ASC]

    """
    A condition to be used in determining which values should be returned by the collection.
    """
    condition: CameraImageCondition
  ): CameraImagesConnection!
}

"""
A condition to be used against 'Camera' object types. All fields are tested for equality and combined with a logical ‘and.’
"""
input CameraCondition {
  """Checks for equality with the object’s 'id' field."""
  id: Int

  """Checks for equality with the object’s 'source' field."""
  source: String

  """Checks for equality with the object’s 'sourceId' field."""
  sourceId: String

  """Checks for equality with the object’s 'name' field."""
  name: String

  """Checks for equality with the object’s 'geojson' field."""
  geojson: String
}

"""An image taken by a camera"""
type CameraImage implements Node {
  """
  A globally unique identifier. Can be used in various places throughout the system to identify this single value.
  """
  nodeId: ID!

  """The primary unique identifier for the image."""
  id: Int!

  """The id of the camera that took the image."""
  cameraId: Int!

  """The original url to the hosted camera image."""
  url: String

  """When image was taken (beholder) or loaded into ctxfloods (atd)"""
  uploadedAt: Datetime

  """Reads a single 'Camera' that is related to this 'CameraImage'."""
  cameraByCameraId: Camera
}

"""
A condition to be used against 'CameraImage' object types. All fields are tested
for equality and combined with a logical ‘and.’
"""
input CameraImageCondition {
  """Checks for equality with the object’s 'id' field."""
  id: Int

  """Checks for equality with the object’s 'cameraId' field."""
  cameraId: Int

  """Checks for equality with the object’s 'url' field."""
  url: String

  """Checks for equality with the object’s 'uploadedAt' field."""
  uploadedAt: Datetime
}

"""A connection to a list of 'CameraImage' values."""
type CameraImagesConnection {
  """A list of 'CameraImage' objects."""
  nodes: [CameraImage]!

  """
  A list of edges which contains the 'CameraImage' and cursor to aid in pagination.
  """
  edges: [CameraImagesEdge!]!

  """Information to aid in pagination."""
  pageInfo: PageInfo!

  """The count of *all* 'CameraImage' you could get from the connection."""
  totalCount: Int
}

"""A 'CameraImage' edge in the connection."""
type CameraImagesEdge {
  """A cursor for use in pagination."""
  cursor: Cursor

  """The 'CameraImage' at the end of the edge."""
  node: CameraImage
}

"""Methods to use when ordering 'CameraImage'."""
enum CameraImagesOrderBy {
  NATURAL
  ID_ASC
  ID_DESC
  CAMERA_ID_ASC
  CAMERA_ID_DESC
  URL_ASC
  URL_DESC
  UPLOADED_AT_ASC
  UPLOADED_AT_DESC
  PRIMARY_KEY_ASC
  PRIMARY_KEY_DESC
}

"""A connection to a list of 'Camera' values."""
type CamerasConnection {
  """A list of 'Camera' objects."""
  nodes: [Camera]!

  """
  A list of edges which contains the 'Camera' and cursor to aid in pagination.
  """
  edges: [CamerasEdge!]!

  """Information to aid in pagination."""
  pageInfo: PageInfo!

  """The count of *all* 'Camera' you could get from the connection."""
  totalCount: Int
}

"""A 'Camera' edge in the connection."""
type CamerasEdge {
  """A cursor for use in pagination."""
  cursor: Cursor

  """The 'Camera' at the end of the edge."""
  node: Camera
}

"""Methods to use when ordering 'Camera'."""
enum CamerasOrderBy {
  NATURAL
  ID_ASC
  ID_DESC
  SOURCE_ASC
  SOURCE_DESC
  SOURCE_ID_ASC
  SOURCE_ID_DESC
  NAME_ASC
  NAME_DESC
  GEOJSON_ASC
  GEOJSON_DESC
  PRIMARY_KEY_ASC
  PRIMARY_KEY_DESC
}

type CameraWithLatestPhoto {
  id: Int
  source: String
  name: String
  geojson: String
  latestPhotoUrl: String
  uploadedAt: Datetime
}

"""A connection to a list of 'CameraWithLatestPhoto' values."""
type CameraWithLatestPhotosConnection {
  """A list of 'CameraWithLatestPhoto' objects."""
  nodes: [CameraWithLatestPhoto]!

  """
  A list of edges which contains the 'CameraWithLatestPhoto' and cursor to aid in pagination.
  """
  edges: [CameraWithLatestPhotosEdge!]!

  """Information to aid in pagination."""
  pageInfo: PageInfo!

  """
  The count of *all* 'CameraWithLatestPhoto' you could get from the connection.
  """
  totalCount: Int
}

"""A 'CameraWithLatestPhoto' edge in the connection."""
type CameraWithLatestPhotosEdge {
  """A cursor for use in pagination."""
  cursor: Cursor

  """The 'CameraWithLatestPhoto' at the end of the edge."""
  node: CameraWithLatestPhoto
}

"""All input for the 'changeCommunityName' mutation."""
input ChangeCommunityNameInput {
  """
  An arbitrary string value with no semantic meaning. Will be included in the
  payload verbatim. May be used to track mutations by the client.
  """
  clientMutationId: String
  communityId: Int!
  name: String!
}

"""The output of our 'changeCommunityName' mutation."""
type ChangeCommunityNamePayload {
  """
  The exact same 'clientMutationId' that was provided in the mutation input,
  unchanged and unused. May be used by a client to track mutations.
  """
  clientMutationId: String
  community: Community

  """
  Our root query field type. Allows us to run any query from our mutation payload.
  """
  query: Query

  """An edge for our 'Community'. May be used by Relay 1."""
  communityEdge(
    """The method to use when ordering 'Community'."""
    orderBy: [CommunitiesOrderBy!] = [PRIMARY_KEY_ASC]
  ): CommunitiesEdge
}

"""All input for the 'changeStatusName' mutation."""
input ChangeStatusNameInput {
  """
  An arbitrary string value with no semantic meaning. Will be included in the
  payload verbatim. May be used to track mutations by the client.
  """
  clientMutationId: String
  statusId: Int!
  name: String!
}

"""The output of our 'changeStatusName' mutation."""
type ChangeStatusNamePayload {
  """
  The exact same 'clientMutationId' that was provided in the mutation input,
  unchanged and unused. May be used by a client to track mutations.
  """
  clientMutationId: String
  status: Status

  """
  Our root query field type. Allows us to run any query from our mutation payload.
  """
  query: Query

  """An edge for our 'Status'. May be used by Relay 1."""
  statusEdge(
    """The method to use when ordering 'Status'."""
    orderBy: [StatusesOrderBy!] = [PRIMARY_KEY_ASC]
  ): StatusesEdge
}

"""All input for the 'changeStatusReasonName' mutation."""
input ChangeStatusReasonNameInput {
  """
  An arbitrary string value with no semantic meaning. Will be included in the
  payload verbatim. May be used to track mutations by the client.
  """
  clientMutationId: String
  statusReasonId: Int!
  name: String!
}

"""The output of our 'changeStatusReasonName' mutation."""
type ChangeStatusReasonNamePayload {
  """
  The exact same 'clientMutationId' that was provided in the mutation input,
  unchanged and unused. May be used by a client to track mutations.
  """
  clientMutationId: String
  statusReason: StatusReason

  """
  Our root query field type. Allows us to run any query from our mutation payload.
  """
  query: Query

  """Reads a single 'Status' that is related to this 'StatusReason'."""
  statusByStatusId: Status

  """An edge for our 'StatusReason'. May be used by Relay 1."""
  statusReasonEdge(
    """The method to use when ordering 'StatusReason'."""
    orderBy: [StatusReasonsOrderBy!] = [PRIMARY_KEY_ASC]
  ): StatusReasonsEdge
}

"""A connection to a list of 'Community' values."""
type CommunitiesConnection {
  """A list of 'Community' objects."""
  nodes: [Community]!

  """
  A list of edges which contains the 'Community' and cursor to aid in pagination.
  """
  edges: [CommunitiesEdge!]!

  """Information to aid in pagination."""
  pageInfo: PageInfo!

  """The count of *all* 'Community' you could get from the connection."""
  totalCount: Int
}

"""A 'Community' edge in the connection."""
type CommunitiesEdge {
  """A cursor for use in pagination."""
  cursor: Cursor

  """The 'Community' at the end of the edge."""
  node: Community
}

"""Methods to use when ordering 'Community'."""
enum CommunitiesOrderBy {
  NATURAL
  ID_ASC
  ID_DESC
  NAME_ASC
  NAME_DESC
  ABBREVIATION_ASC
  ABBREVIATION_DESC
  VIEWPORTGEOJSON_ASC
  VIEWPORTGEOJSON_DESC
  PRIMARY_KEY_ASC
  PRIMARY_KEY_DESC
}

"""A community defined by a geospatial area."""
type Community implements Node {
  """
  A globally unique identifier. Can be used in various places throughout the system to identify this single value.
  """
  nodeId: ID!

  """The primary unique identifier for the community."""
  id: Int!

  """The name of the community."""
  name: String!

  """The abbreviation for the community."""
  abbreviation: String

  """The viewport of the community."""
  viewportgeojson: String

  """Reads and enables pagination through a set of 'User'."""
  usersByCommunityId(
    """Only read the first 'n' values of the set."""
    first: Int

    """Only read the last 'n' values of the set."""
    last: Int

    """
    Skip the first 'n' values from our 'after' cursor, an alternative to cursor
    based pagination. May not be used with 'last'.
    """
    offset: Int

    """Read all values in the set before (above) this cursor."""
    before: Cursor

    """Read all values in the set after (below) this cursor."""
    after: Cursor

    """The method to use when ordering 'User'."""
    orderBy: [UsersOrderBy!] = [PRIMARY_KEY_ASC]

    """
    A condition to be used in determining which values should be returned by the collection.
    """
    condition: UserCondition
  ): UsersConnection!

  """Reads and enables pagination through a set of 'PushLog'."""
  pushLogsByCommunityId(
    """Only read the first 'n' values of the set."""
    first: Int

    """Only read the last 'n' values of the set."""
    last: Int

    """
    Skip the first 'n' values from our 'after' cursor, an alternative to cursor
    based pagination. May not be used with 'last'.
    """
    offset: Int

    """Read all values in the set before (above) this cursor."""
    before: Cursor

    """Read all values in the set after (below) this cursor."""
    after: Cursor

    """The method to use when ordering 'PushLog'."""
    orderBy: [PushLogsOrderBy!] = [PRIMARY_KEY_ASC]

    """
    A condition to be used in determining which values should be returned by the collection.
    """
    condition: PushLogCondition
  ): PushLogsConnection!
}

"""
A condition to be used against 'Community' object types. All fields are tested
for equality and combined with a logical ‘and.’
"""
input CommunityCondition {
  """Checks for equality with the object’s 'id' field."""
  id: Int

  """Checks for equality with the object’s 'name' field."""
  name: String

  """Checks for equality with the object’s 'abbreviation' field."""
  abbreviation: String

  """Checks for equality with the object’s 'viewportgeojson' field."""
  viewportgeojson: String
}

"""A road crossing that might flood."""
type Crossing implements Node {
  """
  A globally unique identifier. Can be used in various places throughout the system to identify this single value.
  """
  nodeId: ID!

  """The primary unique identifier for the crossing."""
  id: Int!

  """The legacy id of the crossing from ATXFloods."""
  legacyId: Int

  """The name of the crossing."""
  name: String!

  """The human readable address of the crossing."""
  humanAddress: String!

  """The description of the crossing."""
  description: String!

  """The GIS coordinates of the crossing created with ST_MakePoint."""
  coordinates: String!

  """The GeoJSON coordinates of the crossing."""
  geojson: String!

  """The timestamp of the latest status update for the crossing."""
  latestStatusCreatedAt: Datetime

  """If the crossing is active or not."""
  active: Boolean

  """The ids of the communities the crossing belongs to."""
  communityIds: [Int]

  """The latest status update of the crossing."""
  latestStatusUpdateId: Int

  """The latest status of the crossing."""
  latestStatusId: Int

  """The type of camera associated with this crossing."""
  cameraType: String

  """The id of a camera associated with this crossing."""
  cameraId: String

  """The crossings street name according to the Waze geocoder."""
  wazeStreetId: Int

  """Reads a single 'StatusUpdate' that is related to this 'Crossing'."""
  statusUpdateByLatestStatusUpdateId: StatusUpdate

  """Reads a single 'Status' that is related to this 'Crossing'."""
  statusByLatestStatusId: Status

  """Reads a single 'WazeStreet' that is related to this 'Crossing'."""
  wazeStreetByWazeStreetId: WazeStreet

  """Reads and enables pagination through a set of 'StatusUpdate'."""
  statusUpdatesByCrossingId(
    """Only read the first 'n' values of the set."""
    first: Int

    """Only read the last 'n' values of the set."""
    last: Int

    """
    Skip the first 'n' values from our 'after' cursor, an alternative to cursor
    based pagination. May not be used with 'last'.
    """
    offset: Int

    """Read all values in the set before (above) this cursor."""
    before: Cursor

    """Read all values in the set after (below) this cursor."""
    after: Cursor

    """The method to use when ordering 'StatusUpdate'."""
    orderBy: [StatusUpdatesOrderBy!] = [PRIMARY_KEY_ASC]

    """
    A condition to be used in determining which values should be returned by the collection.
    """
    condition: StatusUpdateCondition
  ): StatusUpdatesConnection!

  """Get all the communities for a crossing."""
  communities(
    """Only read the first 'n' values of the set."""
    first: Int

    """Only read the last 'n' values of the set."""
    last: Int

    """
    Skip the first 'n' values from our 'after' cursor, an alternative to cursor
    based pagination. May not be used with 'last'.
    """
    offset: Int

    """Read all values in the set before (above) this cursor."""
    before: Cursor

    """Read all values in the set after (below) this cursor."""
    after: Cursor
  ): CommunitiesConnection!

  """
  Adds a human readable coordinates as a string in the Degrees, Minutes, Seconds representation.
  """
  humanCoordinates: String
}

"""
A condition to be used against 'Crossing' object types. All fields are tested
for equality and combined with a logical ‘and.’
"""
input CrossingCondition {
  """Checks for equality with the object’s 'id' field."""
  id: Int

  """Checks for equality with the object’s 'legacyId' field."""
  legacyId: Int

  """Checks for equality with the object’s 'name' field."""
  name: String

  """Checks for equality with the object’s 'humanAddress' field."""
  humanAddress: String

  """Checks for equality with the object’s 'description' field."""
  description: String

  """Checks for equality with the object’s 'coordinates' field."""
  coordinates: String

  """Checks for equality with the object’s 'geojson' field."""
  geojson: String

  """Checks for equality with the object’s 'latestStatusCreatedAt' field."""
  latestStatusCreatedAt: Datetime

  """Checks for equality with the object’s 'active' field."""
  active: Boolean

  """Checks for equality with the object’s 'communityIds' field."""
  communityIds: [Int]

  """Checks for equality with the object’s 'latestStatusUpdateId' field."""
  latestStatusUpdateId: Int

  """Checks for equality with the object’s 'latestStatusId' field."""
  latestStatusId: Int

  """Checks for equality with the object’s 'cameraType' field."""
  cameraType: String

  """Checks for equality with the object’s 'cameraId' field."""
  cameraId: String

  """Checks for equality with the object’s 'wazeStreetId' field."""
  wazeStreetId: Int
}

"""A connection to a list of 'Crossing' values."""
type CrossingsConnection {
  """A list of 'Crossing' objects."""
  nodes: [Crossing]!

  """
  A list of edges which contains the 'Crossing' and cursor to aid in pagination.
  """
  edges: [CrossingsEdge!]!

  """Information to aid in pagination."""
  pageInfo: PageInfo!

  """The count of *all* 'Crossing' you could get from the connection."""
  totalCount: Int
}

"""A 'Crossing' edge in the connection."""
type CrossingsEdge {
  """A cursor for use in pagination."""
  cursor: Cursor

  """The 'Crossing' at the end of the edge."""
  node: Crossing
}

"""Methods to use when ordering 'Crossing'."""
enum CrossingsOrderBy {
  NATURAL
  ID_ASC
  ID_DESC
  LEGACY_ID_ASC
  LEGACY_ID_DESC
  NAME_ASC
  NAME_DESC
  HUMAN_ADDRESS_ASC
  HUMAN_ADDRESS_DESC
  DESCRIPTION_ASC
  DESCRIPTION_DESC
  COORDINATES_ASC
  COORDINATES_DESC
  GEOJSON_ASC
  GEOJSON_DESC
  LATEST_STATUS_CREATED_AT_ASC
  LATEST_STATUS_CREATED_AT_DESC
  ACTIVE_ASC
  ACTIVE_DESC
  COMMUNITY_IDS_ASC
  COMMUNITY_IDS_DESC
  LATEST_STATUS_UPDATE_ID_ASC
  LATEST_STATUS_UPDATE_ID_DESC
  LATEST_STATUS_ID_ASC
  LATEST_STATUS_ID_DESC
  CAMERA_TYPE_ASC
  CAMERA_TYPE_DESC
  CAMERA_ID_ASC
  CAMERA_ID_DESC
  WAZE_STREET_ID_ASC
  WAZE_STREET_ID_DESC
  PRIMARY_KEY_ASC
  PRIMARY_KEY_DESC
}

"""A location in a connection that can be used for resuming pagination."""
scalar Cursor

"""The day, does not include a time."""
scalar Date

"""
A point in time as described by the [ISO
8601](https://en.wikipedia.org/wiki/ISO_8601) standard. May or may not include a timezone.
"""
scalar Datetime

"""All input for the 'deactivateUser' mutation."""
input DeactivateUserInput {
  """
  An arbitrary string value with no semantic meaning. Will be included in the
  payload verbatim. May be used to track mutations by the client.
  """
  clientMutationId: String
  userId: Int!
}

"""The output of our 'deactivateUser' mutation."""
type DeactivateUserPayload {
  """
  The exact same 'clientMutationId' that was provided in the mutation input,
  unchanged and unused. May be used by a client to track mutations.
  """
  clientMutationId: String
  user: User

  """
  Our root query field type. Allows us to run any query from our mutation payload.
  """
  query: Query

  """Reads a single 'Community' that is related to this 'User'."""
  communityByCommunityId: Community

  """An edge for our 'User'. May be used by Relay 1."""
  userEdge(
    """The method to use when ordering 'User'."""
    orderBy: [UsersOrderBy!] = [PRIMARY_KEY_ASC]
  ): UsersEdge
}

"""All input for the 'deleteCommunityFunction' mutation."""
input DeleteCommunityFunctionInput {
  """
  An arbitrary string value with no semantic meaning. Will be included in the
  payload verbatim. May be used to track mutations by the client.
  """
  clientMutationId: String
  communityId: Int!
}

"""The output of our 'deleteCommunityFunction' mutation."""
type DeleteCommunityFunctionPayload {
  """
  The exact same 'clientMutationId' that was provided in the mutation input,
  unchanged and unused. May be used by a client to track mutations.
  """
  clientMutationId: String
  community: Community

  """
  Our root query field type. Allows us to run any query from our mutation payload.
  """
  query: Query

  """An edge for our 'Community'. May be used by Relay 1."""
  communityEdge(
    """The method to use when ordering 'Community'."""
    orderBy: [CommunitiesOrderBy!] = [PRIMARY_KEY_ASC]
  ): CommunitiesEdge
}

"""All input for the 'deleteStatusFunction' mutation."""
input DeleteStatusFunctionInput {
  """
  An arbitrary string value with no semantic meaning. Will be included in the
  payload verbatim. May be used to track mutations by the client.
  """
  clientMutationId: String
  statusId: Int!
}

"""The output of our 'deleteStatusFunction' mutation."""
type DeleteStatusFunctionPayload {
  """
  The exact same 'clientMutationId' that was provided in the mutation input,
  unchanged and unused. May be used by a client to track mutations.
  """
  clientMutationId: String
  status: Status

  """
  Our root query field type. Allows us to run any query from our mutation payload.
  """
  query: Query

  """An edge for our 'Status'. May be used by Relay 1."""
  statusEdge(
    """The method to use when ordering 'Status'."""
    orderBy: [StatusesOrderBy!] = [PRIMARY_KEY_ASC]
  ): StatusesEdge
}

"""All input for the 'deleteStatusReasonFunction' mutation."""
input DeleteStatusReasonFunctionInput {
  """
  An arbitrary string value with no semantic meaning. Will be included in the
  payload verbatim. May be used to track mutations by the client.
  """
  clientMutationId: String
  statusReasonId: Int!
}

"""The output of our 'deleteStatusReasonFunction' mutation."""
type DeleteStatusReasonFunctionPayload {
  """
  The exact same 'clientMutationId' that was provided in the mutation input,
  unchanged and unused. May be used by a client to track mutations.
  """
  clientMutationId: String
  statusReason: StatusReason

  """
  Our root query field type. Allows us to run any query from our mutation payload.
  """
  query: Query

  """Reads a single 'Status' that is related to this 'StatusReason'."""
  statusByStatusId: Status

  """An edge for our 'StatusReason'. May be used by Relay 1."""
  statusReasonEdge(
    """The method to use when ordering 'StatusReason'."""
    orderBy: [StatusReasonsOrderBy!] = [PRIMARY_KEY_ASC]
  ): StatusReasonsEdge
}

"""All input for the 'editCrossing' mutation."""
input EditCrossingInput {
  """
  An arbitrary string value with no semantic meaning. Will be included in the
  payload verbatim. May be used to track mutations by the client.
  """
  clientMutationId: String
  crossingId: Int!
  name: String!
  description: String!
}

"""The output of our 'editCrossing' mutation."""
type EditCrossingPayload {
  """
  The exact same 'clientMutationId' that was provided in the mutation input,
  unchanged and unused. May be used by a client to track mutations.
  """
  clientMutationId: String
  crossing: Crossing

  """
  Our root query field type. Allows us to run any query from our mutation payload.
  """
  query: Query

  """Reads a single 'StatusUpdate' that is related to this 'Crossing'."""
  statusUpdateByLatestStatusUpdateId: StatusUpdate

  """Reads a single 'Status' that is related to this 'Crossing'."""
  statusByLatestStatusId: Status

  """Reads a single 'WazeStreet' that is related to this 'Crossing'."""
  wazeStreetByWazeStreetId: WazeStreet

  """An edge for our 'Crossing'. May be used by Relay 1."""
  crossingEdge(
    """The method to use when ordering 'Crossing'."""
    orderBy: [CrossingsOrderBy!] = [PRIMARY_KEY_ASC]
  ): CrossingsEdge
}

"""All input for the 'editUser' mutation."""
input EditUserInput {
  """
  An arbitrary string value with no semantic meaning. Will be included in the
  payload verbatim. May be used to track mutations by the client.
  """
  clientMutationId: String
  userId: Int!
  firstName: String!
  lastName: String!
  jobTitle: String!
  phoneNumber: String!
}

"""The output of our 'editUser' mutation."""
type EditUserPayload {
  """
  The exact same 'clientMutationId' that was provided in the mutation input,
  unchanged and unused. May be used by a client to track mutations.
  """
  clientMutationId: String
  user: User

  """
  Our root query field type. Allows us to run any query from our mutation payload.
  """
  query: Query

  """Reads a single 'Community' that is related to this 'User'."""
  communityByCommunityId: Community

  """An edge for our 'User'. May be used by Relay 1."""
  userEdge(
    """The method to use when ordering 'User'."""
    orderBy: [UsersOrderBy!] = [PRIMARY_KEY_ASC]
  ): UsersEdge
}

type IncidentReport implements Node {
  """
  A globally unique identifier. Can be used in various places throughout the system to identify this single value.
  """
  nodeId: ID!
  id: Int!
  notes: String
  locationDescription: String
  coordinates: String
  communityIds: [Int]
  createdAt: Datetime
}

"""
A condition to be used against 'IncidentReport' object types. All fields are
tested for equality and combined with a logical ‘and.’
"""
input IncidentReportCondition {
  """Checks for equality with the object’s 'id' field."""
  id: Int

  """Checks for equality with the object’s 'notes' field."""
  notes: String

  """Checks for equality with the object’s 'locationDescription' field."""
  locationDescription: String

  """Checks for equality with the object’s 'coordinates' field."""
  coordinates: String

  """Checks for equality with the object’s 'communityIds' field."""
  communityIds: [Int]

  """Checks for equality with the object’s 'createdAt' field."""
  createdAt: Datetime
}

"""A connection to a list of 'IncidentReport' values."""
type IncidentReportsConnection {
  """A list of 'IncidentReport' objects."""
  nodes: [IncidentReport]!

  """
  A list of edges which contains the 'IncidentReport' and cursor to aid in pagination.
  """
  edges: [IncidentReportsEdge!]!

  """Information to aid in pagination."""
  pageInfo: PageInfo!

  """
  The count of *all* 'IncidentReport' you could get from the connection.
  """
  totalCount: Int
}

"""A 'IncidentReport' edge in the connection."""
type IncidentReportsEdge {
  """A cursor for use in pagination."""
  cursor: Cursor

  """The 'IncidentReport' at the end of the edge."""
  node: IncidentReport
}

"""Methods to use when ordering 'IncidentReport'."""
enum IncidentReportsOrderBy {
  NATURAL
  ID_ASC
  ID_DESC
  NOTES_ASC
  NOTES_DESC
  LOCATION_DESCRIPTION_ASC
  LOCATION_DESCRIPTION_DESC
  COORDINATES_ASC
  COORDINATES_DESC
  COMMUNITY_IDS_ASC
  COMMUNITY_IDS_DESC
  CREATED_AT_ASC
  CREATED_AT_DESC
  PRIMARY_KEY_ASC
  PRIMARY_KEY_DESC
}

"""
A JSON Web Token defined by [RFC 7519](https://tools.ietf.org/html/rfc7519)
which securely represents claims between two parties.
"""
scalar JwtToken

"""
The root mutation type which contains root level fields which mutate data.
"""
type Mutation {
  """
  Adds an image for a camera and ensures that only a mamximum of 5 images remain stored.
  """
  addCameraImage(
    """
    The exclusive input argument for this mutation. An object type, make sure to see documentation for this object’s fields.
    """
    input: AddCameraImageInput!
  ): AddCameraImagePayload

  """Adds a crossing to a community."""
  addCrossingToCommunity(
    """
    The exclusive input argument for this mutation. An object type, make sure to see documentation for this object’s fields.
    """
    input: AddCrossingToCommunityInput!
  ): AddCrossingToCommunityPayload

  """Adds a new crossing to a new community."""
  addCrossingWithNewCommunity(
    """
    The exclusive input argument for this mutation. An object type, make sure to see documentation for this object’s fields.
    """
    input: AddCrossingWithNewCommunityInput!
  ): AddCrossingWithNewCommunityPayload

  """
  Creates a JWT token that will securely identify a user and give them certain permissions.
  """
  authenticate(
    """
    The exclusive input argument for this mutation. An object type, make sure to see documentation for this object’s fields.
    """
    input: AuthenticateInput!
  ): AuthenticatePayload

  """Changes the name of a community."""
  changeCommunityName(
    """
    The exclusive input argument for this mutation. An object type, make sure to see documentation for this object’s fields.
    """
    input: ChangeCommunityNameInput!
  ): ChangeCommunityNamePayload

  """Changes the name of a status."""
  changeStatusName(
    """
    The exclusive input argument for this mutation. An object type, make sure to see documentation for this object’s fields.
    """
    input: ChangeStatusNameInput!
  ): ChangeStatusNamePayload

  """Changes the name of a status reason."""
  changeStatusReasonName(
    """
    The exclusive input argument for this mutation. An object type, make sure to see documentation for this object’s fields.
    """
    input: ChangeStatusReasonNameInput!
  ): ChangeStatusReasonNamePayload

  """Deactivates a user and deletes their accountfrom the database."""
  deactivateUser(
    """
    The exclusive input argument for this mutation. An object type, make sure to see documentation for this object’s fields.
    """
    input: DeactivateUserInput!
  ): DeactivateUserPayload

  """Deletes a community."""
  deleteCommunityFunction(
    """
    The exclusive input argument for this mutation. An object type, make sure to see documentation for this object’s fields.
    """
    input: DeleteCommunityFunctionInput!
  ): DeleteCommunityFunctionPayload

  """Deletes a status."""
  deleteStatusFunction(
    """
    The exclusive input argument for this mutation. An object type, make sure to see documentation for this object’s fields.
    """
    input: DeleteStatusFunctionInput!
  ): DeleteStatusFunctionPayload

  """Deletes a status reason."""
  deleteStatusReasonFunction(
    """
    The exclusive input argument for this mutation. An object type, make sure to see documentation for this object’s fields.
    """
    input: DeleteStatusReasonFunctionInput!
  ): DeleteStatusReasonFunctionPayload

  """Edits an existing crossing."""
  editCrossing(
    """
    The exclusive input argument for this mutation. An object type, make sure to see documentation for this object’s fields.
    """
    input: EditCrossingInput!
  ): EditCrossingPayload

  """Edits an existing user."""
  editUser(
    """
    The exclusive input argument for this mutation. An object type, make sure to see documentation for this object’s fields.
    """
    input: EditUserInput!
  ): EditUserPayload

  """Adds a community."""
  newCommunity(
    """
    The exclusive input argument for this mutation. An object type, make sure to see documentation for this object’s fields.
    """
    input: NewCommunityInput!
  ): NewCommunityPayload

  """Adds a crossing."""
  newCrossing(
    """
    The exclusive input argument for this mutation. An object type, make sure to see documentation for this object’s fields.
    """
    input: NewCrossingInput!
  ): NewCrossingPayload

  """Adds an incident report."""
  newIncidentReport(
    """
    The exclusive input argument for this mutation. An object type, make sure to see documentation for this object’s fields.
    """
    input: NewIncidentReportInput!
  ): NewIncidentReportPayload

  """Adds a new push log."""
  newPushLogFunction(
    """
    The exclusive input argument for this mutation. An object type, make sure to see documentation for this object’s fields.
    """
    input: NewPushLogFunctionInput!
  ): NewPushLogFunctionPayload

  """Adds a status."""
  newStatus(
    """
    The exclusive input argument for this mutation. An object type, make sure to see documentation for this object’s fields.
    """
    input: NewStatusInput!
  ): NewStatusPayload

  """Adds a status reason."""
  newStatusReason(
    """
    The exclusive input argument for this mutation. An object type, make sure to see documentation for this object’s fields.
    """
    input: NewStatusReasonInput!
  ): NewStatusReasonPayload

  """Updates the status of a crossing."""
  newStatusUpdate(
    """
    The exclusive input argument for this mutation. An object type, make sure to see documentation for this object’s fields.
    """
    input: NewStatusUpdateInput!
  ): NewStatusUpdatePayload

  """Adds a waze street. Uses the default autoincrement id."""
  newWazeStreet(
    """
    The exclusive input argument for this mutation. An object type, make sure to see documentation for this object’s fields.
    """
    input: NewWazeStreetInput!
  ): NewWazeStreetPayload

  """
  Adds a waze street. You must specify the id. Used to populate the initial data from wazeStreets.csv.
  """
  newWazeStreetWithId(
    """
    The exclusive input argument for this mutation. An object type, make sure to see documentation for this object’s fields.
    """
    input: NewWazeStreetWithIdInput!
  ): NewWazeStreetWithIdPayload

  """Reactivates a user and creates an account."""
  reactivateUser(
    """
    The exclusive input argument for this mutation. An object type, make sure to see documentation for this object’s fields.
    """
    input: ReactivateUserInput!
  ): ReactivateUserPayload

  """Registers a single user and creates an account."""
  registerUser(
    """
    The exclusive input argument for this mutation. An object type, make sure to see documentation for this object’s fields.
    """
    input: RegisterUserInput!
  ): RegisterUserPayload

  """Adds a new user to new community."""
  registerUserWithNewCommunity(
    """
    The exclusive input argument for this mutation. An object type, make sure to see documentation for this object’s fields.
    """
    input: RegisterUserWithNewCommunityInput!
  ): RegisterUserWithNewCommunityPayload

  """Removes a crossing from the database."""
  removeCrossing(
    """
    The exclusive input argument for this mutation. An object type, make sure to see documentation for this object’s fields.
    """
    input: RemoveCrossingInput!
  ): RemoveCrossingPayload

  """Removes a crossing from a community."""
  removeCrossingFromCommunity(
    """
    The exclusive input argument for this mutation. An object type, make sure to see documentation for this object’s fields.
    """
    input: RemoveCrossingFromCommunityInput!
  ): RemoveCrossingFromCommunityPayload

  """Resets the password for a user and returns an authenticated JWT."""
  resetPassword(
    """
    The exclusive input argument for this mutation. An object type, make sure to see documentation for this object’s fields.
    """
    input: ResetPasswordInput!
  ): ResetPasswordPayload

  """
  Adds a new crossing or adds an existing legacy crossing to a community.
  """
  seedLegacyCrossing(
    """
    The exclusive input argument for this mutation. An object type, make sure to see documentation for this object’s fields.
    """
    input: SeedLegacyCrossingInput!
  ): SeedLegacyCrossingPayload

  """Sets a camera for a crossing."""
  setCameraForCrossing(
    """
    The exclusive input argument for this mutation. An object type, make sure to see documentation for this object’s fields.
    """
    input: SetCameraForCrossingInput!
  ): SetCameraForCrossingPayload
}

"""All input for the 'newCommunity' mutation."""
input NewCommunityInput {
  """
  An arbitrary string value with no semantic meaning. Will be included in the
  payload verbatim. May be used to track mutations by the client.
  """
  clientMutationId: String
  name: String
  abbreviation: String
}

"""The output of our 'newCommunity' mutation."""
type NewCommunityPayload {
  """
  The exact same 'clientMutationId' that was provided in the mutation input,
  unchanged and unused. May be used by a client to track mutations.
  """
  clientMutationId: String
  community: Community

  """
  Our root query field type. Allows us to run any query from our mutation payload.
  """
  query: Query

  """An edge for our 'Community'. May be used by Relay 1."""
  communityEdge(
    """The method to use when ordering 'Community'."""
    orderBy: [CommunitiesOrderBy!] = [PRIMARY_KEY_ASC]
  ): CommunitiesEdge
}

"""All input for the 'newCrossing' mutation."""
input NewCrossingInput {
  """
  An arbitrary string value with no semantic meaning. Will be included in the
  payload verbatim. May be used to track mutations by the client.
  """
  clientMutationId: String
  name: String
  humanAddress: String
  communityId: Int
  longitude: BigFloat
  latitude: BigFloat
  description: String
  legacyId: Int
  wazeStreetId: Int
}

"""The output of our 'newCrossing' mutation."""
type NewCrossingPayload {
  """
  The exact same 'clientMutationId' that was provided in the mutation input,
  unchanged and unused. May be used by a client to track mutations.
  """
  clientMutationId: String
  crossing: Crossing

  """
  Our root query field type. Allows us to run any query from our mutation payload.
  """
  query: Query

  """Reads a single 'StatusUpdate' that is related to this 'Crossing'."""
  statusUpdateByLatestStatusUpdateId: StatusUpdate

  """Reads a single 'Status' that is related to this 'Crossing'."""
  statusByLatestStatusId: Status

  """Reads a single 'WazeStreet' that is related to this 'Crossing'."""
  wazeStreetByWazeStreetId: WazeStreet

  """An edge for our 'Crossing'. May be used by Relay 1."""
  crossingEdge(
    """The method to use when ordering 'Crossing'."""
    orderBy: [CrossingsOrderBy!] = [PRIMARY_KEY_ASC]
  ): CrossingsEdge
}

"""All input for the 'newIncidentReport' mutation."""
input NewIncidentReportInput {
  """
  An arbitrary string value with no semantic meaning. Will be included in the
  payload verbatim. May be used to track mutations by the client.
  """
  clientMutationId: String
  notes: String
  locationDescription: String
  longitude: BigFloat
  latitude: BigFloat
  communityIds: [Int]
}

"""The output of our 'newIncidentReport' mutation."""
type NewIncidentReportPayload {
  """
  The exact same 'clientMutationId' that was provided in the mutation input,
  unchanged and unused. May be used by a client to track mutations.
  """
  clientMutationId: String
  incidentReport: IncidentReport

  """
  Our root query field type. Allows us to run any query from our mutation payload.
  """
  query: Query

  """An edge for our 'IncidentReport'. May be used by Relay 1."""
  incidentReportEdge(
    """The method to use when ordering 'IncidentReport'."""
    orderBy: [IncidentReportsOrderBy!] = [PRIMARY_KEY_ASC]
  ): IncidentReportsEdge
}

"""All input for the 'newPushLogFunction' mutation."""
input NewPushLogFunctionInput {
  """
  An arbitrary string value with no semantic meaning. Will be included in the
  payload verbatim. May be used to track mutations by the client.
  """
  clientMutationId: String
  date: Date
  userId: Int
  communityId: Int
  statusUpdates: [Int]
  success: Boolean
  errorMessage: String
}

"""The output of our 'newPushLogFunction' mutation."""
type NewPushLogFunctionPayload {
  """
  The exact same 'clientMutationId' that was provided in the mutation input,
  unchanged and unused. May be used by a client to track mutations.
  """
  clientMutationId: String
  pushLog: PushLog

  """
  Our root query field type. Allows us to run any query from our mutation payload.
  """
  query: Query

  """Reads a single 'User' that is related to this 'PushLog'."""
  userByUserId: User

  """Reads a single 'Community' that is related to this 'PushLog'."""
  communityByCommunityId: Community

  """An edge for our 'PushLog'. May be used by Relay 1."""
  pushLogEdge(
    """The method to use when ordering 'PushLog'."""
    orderBy: [PushLogsOrderBy!] = [PRIMARY_KEY_ASC]
  ): PushLogsEdge
}

"""All input for the 'newStatus' mutation."""
input NewStatusInput {
  """
  An arbitrary string value with no semantic meaning. Will be included in the
  payload verbatim. May be used to track mutations by the client.
  """
  clientMutationId: String
  name: String!
}

"""The output of our 'newStatus' mutation."""
type NewStatusPayload {
  """
  The exact same 'clientMutationId' that was provided in the mutation input,
  unchanged and unused. May be used by a client to track mutations.
  """
  clientMutationId: String
  status: Status

  """
  Our root query field type. Allows us to run any query from our mutation payload.
  """
  query: Query

  """An edge for our 'Status'. May be used by Relay 1."""
  statusEdge(
    """The method to use when ordering 'Status'."""
    orderBy: [StatusesOrderBy!] = [PRIMARY_KEY_ASC]
  ): StatusesEdge
}

"""All input for the 'newStatusReason' mutation."""
input NewStatusReasonInput {
  """
  An arbitrary string value with no semantic meaning. Will be included in the
  payload verbatim. May be used to track mutations by the client.
  """
  clientMutationId: String
  statusId: Int!
  name: String!
}

"""The output of our 'newStatusReason' mutation."""
type NewStatusReasonPayload {
  """
  The exact same 'clientMutationId' that was provided in the mutation input,
  unchanged and unused. May be used by a client to track mutations.
  """
  clientMutationId: String
  statusReason: StatusReason

  """
  Our root query field type. Allows us to run any query from our mutation payload.
  """
  query: Query

  """Reads a single 'Status' that is related to this 'StatusReason'."""
  statusByStatusId: Status

  """An edge for our 'StatusReason'. May be used by Relay 1."""
  statusReasonEdge(
    """The method to use when ordering 'StatusReason'."""
    orderBy: [StatusReasonsOrderBy!] = [PRIMARY_KEY_ASC]
  ): StatusReasonsEdge
}

"""All input for the 'newStatusUpdate' mutation."""
input NewStatusUpdateInput {
  """
  An arbitrary string value with no semantic meaning. Will be included in the
  payload verbatim. May be used to track mutations by the client.
  """
  clientMutationId: String
  statusId: Int
  crossingId: Int
  notes: String
  statusReasonId: Int
  reopenDate: Date
  indefiniteClosure: Boolean
}

"""The output of our 'newStatusUpdate' mutation."""
type NewStatusUpdatePayload {
  """
  The exact same 'clientMutationId' that was provided in the mutation input,
  unchanged and unused. May be used by a client to track mutations.
  """
  clientMutationId: String
  statusUpdate: StatusUpdate

  """
  Our root query field type. Allows us to run any query from our mutation payload.
  """
  query: Query

  """Reads a single 'Status' that is related to this 'StatusUpdate'."""
  statusByStatusId: Status

  """Reads a single 'User' that is related to this 'StatusUpdate'."""
  userByCreatorId: User

  """Reads a single 'Crossing' that is related to this 'StatusUpdate'."""
  crossingByCrossingId: Crossing

  """Reads a single 'StatusReason' that is related to this 'StatusUpdate'."""
  statusReasonByStatusReasonId: StatusReason

  """An edge for our 'StatusUpdate'. May be used by Relay 1."""
  statusUpdateEdge(
    """The method to use when ordering 'StatusUpdate'."""
    orderBy: [StatusUpdatesOrderBy!] = [PRIMARY_KEY_ASC]
  ): StatusUpdatesEdge
}

"""All input for the 'newWazeStreet' mutation."""
input NewWazeStreetInput {
  """
  An arbitrary string value with no semantic meaning. Will be included in the
  payload verbatim. May be used to track mutations by the client.
  """
  clientMutationId: String
  longitude: BigFloat
  latitude: BigFloat
  distance: BigFloat
  name: String
  names: [String]
  createdAt: Datetime
  updatedAt: Datetime
}

"""The output of our 'newWazeStreet' mutation."""
type NewWazeStreetPayload {
  """
  The exact same 'clientMutationId' that was provided in the mutation input,
  unchanged and unused. May be used by a client to track mutations.
  """
  clientMutationId: String
  wazeStreet: WazeStreet

  """
  Our root query field type. Allows us to run any query from our mutation payload.
  """
  query: Query

  """An edge for our 'WazeStreet'. May be used by Relay 1."""
  wazeStreetEdge(
    """The method to use when ordering 'WazeStreet'."""
    orderBy: [WazeStreetsOrderBy!] = [PRIMARY_KEY_ASC]
  ): WazeStreetsEdge
}

"""All input for the 'newWazeStreetWithId' mutation."""
input NewWazeStreetWithIdInput {
  """
  An arbitrary string value with no semantic meaning. Will be included in the
  payload verbatim. May be used to track mutations by the client.
  """
  clientMutationId: String
  id: Int
  longitude: BigFloat
  latitude: BigFloat
  distance: BigFloat
  name: String
  names: [String]
  createdAt: Datetime
  updatedAt: Datetime
}

"""The output of our 'newWazeStreetWithId' mutation."""
type NewWazeStreetWithIdPayload {
  """
  The exact same 'clientMutationId' that was provided in the mutation input,
  unchanged and unused. May be used by a client to track mutations.
  """
  clientMutationId: String
  wazeStreet: WazeStreet

  """
  Our root query field type. Allows us to run any query from our mutation payload.
  """
  query: Query

  """An edge for our 'WazeStreet'. May be used by Relay 1."""
  wazeStreetEdge(
    """The method to use when ordering 'WazeStreet'."""
    orderBy: [WazeStreetsOrderBy!] = [PRIMARY_KEY_ASC]
  ): WazeStreetsEdge
}

"""An object with a globally unique 'ID'."""
interface Node {
  """
  A globally unique identifier. Can be used in various places throughout the system to identify this single value.
  """
  nodeId: ID!
}

"""Information about pagination in a connection."""
type PageInfo {
  """When paginating forwards, are there more items?"""
  hasNextPage: Boolean!

  """When paginating backwards, are there more items?"""
  hasPreviousPage: Boolean!

  """When paginating backwards, the cursor to continue."""
  startCursor: Cursor

  """When paginating forwards, the cursor to continue."""
  endCursor: Cursor
}

"""track metadata about email notifications that get sent to admins"""
type PushLog implements Node {
  """
  A globally unique identifier. Can be used in various places throughout the system to identify this single value.
  """
  nodeId: ID!

  """The primary unique identifier for the log."""
  id: Int!

  """The date the email was sent."""
  date: Date!

  """The user who received the email"""
  userId: Int

  """The community the email was for."""
  communityId: Int!

  """The status updates this email was notifying about."""
  statusUpdates: [Int]

  """Whether the email was successfully sent or not."""
  success: Boolean!

  """The error message in the event of a failure."""
  errorMessage: String

  """Reads a single 'User' that is related to this 'PushLog'."""
  userByUserId: User

  """Reads a single 'Community' that is related to this 'PushLog'."""
  communityByCommunityId: Community
}

"""
A condition to be used against 'PushLog' object types. All fields are tested for equality and combined with a logical ‘and.’
"""
input PushLogCondition {
  """Checks for equality with the object’s 'id' field."""
  id: Int

  """Checks for equality with the object’s 'date' field."""
  date: Date

  """Checks for equality with the object’s 'userId' field."""
  userId: Int

  """Checks for equality with the object’s 'communityId' field."""
  communityId: Int

  """Checks for equality with the object’s 'statusUpdates' field."""
  statusUpdates: [Int]

  """Checks for equality with the object’s 'success' field."""
  success: Boolean

  """Checks for equality with the object’s 'errorMessage' field."""
  errorMessage: String
}

"""A connection to a list of 'PushLog' values."""
type PushLogsConnection {
  """A list of 'PushLog' objects."""
  nodes: [PushLog]!

  """
  A list of edges which contains the 'PushLog' and cursor to aid in pagination.
  """
  edges: [PushLogsEdge!]!

  """Information to aid in pagination."""
  pageInfo: PageInfo!

  """The count of *all* 'PushLog' you could get from the connection."""
  totalCount: Int
}

"""A 'PushLog' edge in the connection."""
type PushLogsEdge {
  """A cursor for use in pagination."""
  cursor: Cursor

  """The 'PushLog' at the end of the edge."""
  node: PushLog
}

"""Methods to use when ordering 'PushLog'."""
enum PushLogsOrderBy {
  NATURAL
  ID_ASC
  ID_DESC
  DATE_ASC
  DATE_DESC
  USER_ID_ASC
  USER_ID_DESC
  COMMUNITY_ID_ASC
  COMMUNITY_ID_DESC
  STATUS_UPDATES_ASC
  STATUS_UPDATES_DESC
  SUCCESS_ASC
  SUCCESS_DESC
  ERROR_MESSAGE_ASC
  ERROR_MESSAGE_DESC
  PRIMARY_KEY_ASC
  PRIMARY_KEY_DESC
}

"""The root query type which gives access points into the data universe."""
type Query implements Node {
  """
  Exposes the root query type nested one level down. This is helpful for Relay 1
  which can only query top level fields if they are in a particular form.
  """
  query: Query!

  """
  The root query type must be a 'Node' to work well with Relay 1 mutations. This just resolves to 'query'.
  """
  nodeId: ID!

  """Fetches an object given its globally unique 'ID'."""
  node(
    """The globally unique 'ID'."""
    nodeId: ID!
  ): Node

  """Reads and enables pagination through a set of 'Camera'."""
  allCameras(
    """Only read the first 'n' values of the set."""
    first: Int

    """Only read the last 'n' values of the set."""
    last: Int

    """
    Skip the first 'n' values from our 'after' cursor, an alternative to cursor
    based pagination. May not be used with 'last'.
    """
    offset: Int

    """Read all values in the set before (above) this cursor."""
    before: Cursor

    """Read all values in the set after (below) this cursor."""
    after: Cursor

    """The method to use when ordering 'Camera'."""
    orderBy: [CamerasOrderBy!] = [PRIMARY_KEY_ASC]

    """
    A condition to be used in determining which values should be returned by the collection.
    """
    condition: CameraCondition
  ): CamerasConnection

  """Reads and enables pagination through a set of 'CameraImage'."""
  allCameraImages(
    """Only read the first 'n' values of the set."""
    first: Int

    """Only read the last 'n' values of the set."""
    last: Int

    """
    Skip the first 'n' values from our 'after' cursor, an alternative to cursor
    based pagination. May not be used with 'last'.
    """
    offset: Int

    """Read all values in the set before (above) this cursor."""
    before: Cursor

    """Read all values in the set after (below) this cursor."""
    after: Cursor

    """The method to use when ordering 'CameraImage'."""
    orderBy: [CameraImagesOrderBy!] = [PRIMARY_KEY_ASC]

    """
    A condition to be used in determining which values should be returned by the collection.
    """
    condition: CameraImageCondition
  ): CameraImagesConnection

  """Reads and enables pagination through a set of 'Community'."""
  allCommunities(
    """Only read the first 'n' values of the set."""
    first: Int

    """Only read the last 'n' values of the set."""
    last: Int

    """
    Skip the first 'n' values from our 'after' cursor, an alternative to cursor
    based pagination. May not be used with 'last'.
    """
    offset: Int

    """Read all values in the set before (above) this cursor."""
    before: Cursor

    """Read all values in the set after (below) this cursor."""
    after: Cursor

    """The method to use when ordering 'Community'."""
    orderBy: [CommunitiesOrderBy!] = [PRIMARY_KEY_ASC]

    """
    A condition to be used in determining which values should be returned by the collection.
    """
    condition: CommunityCondition
  ): CommunitiesConnection

  """Reads and enables pagination through a set of 'Crossing'."""
  allCrossings(
    """Only read the first 'n' values of the set."""
    first: Int

    """Only read the last 'n' values of the set."""
    last: Int

    """
    Skip the first 'n' values from our 'after' cursor, an alternative to cursor
    based pagination. May not be used with 'last'.
    """
    offset: Int

    """Read all values in the set before (above) this cursor."""
    before: Cursor

    """Read all values in the set after (below) this cursor."""
    after: Cursor

    """The method to use when ordering 'Crossing'."""
    orderBy: [CrossingsOrderBy!] = [PRIMARY_KEY_ASC]

    """
    A condition to be used in determining which values should be returned by the collection.
    """
    condition: CrossingCondition
  ): CrossingsConnection

  """Reads and enables pagination through a set of 'IncidentReport'."""
  allIncidentReports(
    """Only read the first 'n' values of the set."""
    first: Int

    """Only read the last 'n' values of the set."""
    last: Int

    """
    Skip the first 'n' values from our 'after' cursor, an alternative to cursor
    based pagination. May not be used with 'last'.
    """
    offset: Int

    """Read all values in the set before (above) this cursor."""
    before: Cursor

    """Read all values in the set after (below) this cursor."""
    after: Cursor

    """The method to use when ordering 'IncidentReport'."""
    orderBy: [IncidentReportsOrderBy!] = [PRIMARY_KEY_ASC]

    """
    A condition to be used in determining which values should be returned by the collection.
    """
    condition: IncidentReportCondition
  ): IncidentReportsConnection

  """Reads and enables pagination through a set of 'PushLog'."""
  allPushLogs(
    """Only read the first 'n' values of the set."""
    first: Int

    """Only read the last 'n' values of the set."""
    last: Int

    """
    Skip the first 'n' values from our 'after' cursor, an alternative to cursor
    based pagination. May not be used with 'last'.
    """
    offset: Int

    """Read all values in the set before (above) this cursor."""
    before: Cursor

    """Read all values in the set after (below) this cursor."""
    after: Cursor

    """The method to use when ordering 'PushLog'."""
    orderBy: [PushLogsOrderBy!] = [PRIMARY_KEY_ASC]

    """
    A condition to be used in determining which values should be returned by the collection.
    """
    condition: PushLogCondition
  ): PushLogsConnection

  """Reads and enables pagination through a set of 'Status'."""
  allStatuses(
    """Only read the first 'n' values of the set."""
    first: Int

    """Only read the last 'n' values of the set."""
    last: Int

    """
    Skip the first 'n' values from our 'after' cursor, an alternative to cursor
    based pagination. May not be used with 'last'.
    """
    offset: Int

    """Read all values in the set before (above) this cursor."""
    before: Cursor

    """Read all values in the set after (below) this cursor."""
    after: Cursor

    """The method to use when ordering 'Status'."""
    orderBy: [StatusesOrderBy!] = [PRIMARY_KEY_ASC]

    """
    A condition to be used in determining which values should be returned by the collection.
    """
    condition: StatusCondition
  ): StatusesConnection

  """Reads and enables pagination through a set of 'StatusAssociation'."""
  allStatusAssociations(
    """Only read the first 'n' values of the set."""
    first: Int

    """Only read the last 'n' values of the set."""
    last: Int

    """
    Skip the first 'n' values from our 'after' cursor, an alternative to cursor
    based pagination. May not be used with 'last'.
    """
    offset: Int

    """Read all values in the set before (above) this cursor."""
    before: Cursor

    """Read all values in the set after (below) this cursor."""
    after: Cursor

    """The method to use when ordering 'StatusAssociation'."""
    orderBy: [StatusAssociationsOrderBy!] = [PRIMARY_KEY_ASC]

    """
    A condition to be used in determining which values should be returned by the collection.
    """
    condition: StatusAssociationCondition
  ): StatusAssociationsConnection

  """Reads and enables pagination through a set of 'StatusReason'."""
  allStatusReasons(
    """Only read the first 'n' values of the set."""
    first: Int

    """Only read the last 'n' values of the set."""
    last: Int

    """
    Skip the first 'n' values from our 'after' cursor, an alternative to cursor
    based pagination. May not be used with 'last'.
    """
    offset: Int

    """Read all values in the set before (above) this cursor."""
    before: Cursor

    """Read all values in the set after (below) this cursor."""
    after: Cursor

    """The method to use when ordering 'StatusReason'."""
    orderBy: [StatusReasonsOrderBy!] = [PRIMARY_KEY_ASC]

    """
    A condition to be used in determining which values should be returned by the collection.
    """
    condition: StatusReasonCondition
  ): StatusReasonsConnection

  """Reads and enables pagination through a set of 'StatusUpdate'."""
  allStatusUpdates(
    """Only read the first 'n' values of the set."""
    first: Int

    """Only read the last 'n' values of the set."""
    last: Int

    """
    Skip the first 'n' values from our 'after' cursor, an alternative to cursor
    based pagination. May not be used with 'last'.
    """
    offset: Int

    """Read all values in the set before (above) this cursor."""
    before: Cursor

    """Read all values in the set after (below) this cursor."""
    after: Cursor

    """The method to use when ordering 'StatusUpdate'."""
    orderBy: [StatusUpdatesOrderBy!] = [PRIMARY_KEY_ASC]

    """
    A condition to be used in determining which values should be returned by the collection.
    """
    condition: StatusUpdateCondition
  ): StatusUpdatesConnection

  """Reads and enables pagination through a set of 'User'."""
  allUsers(
    """Only read the first 'n' values of the set."""
    first: Int

    """Only read the last 'n' values of the set."""
    last: Int

    """
    Skip the first 'n' values from our 'after' cursor, an alternative to cursor
    based pagination. May not be used with 'last'.
    """
    offset: Int

    """Read all values in the set before (above) this cursor."""
    before: Cursor

    """Read all values in the set after (below) this cursor."""
    after: Cursor

    """The method to use when ordering 'User'."""
    orderBy: [UsersOrderBy!] = [PRIMARY_KEY_ASC]

    """
    A condition to be used in determining which values should be returned by the collection.
    """
    condition: UserCondition
  ): UsersConnection

  """Reads and enables pagination through a set of 'WazeStreet'."""
  allWazeStreets(
    """Only read the first 'n' values of the set."""
    first: Int

    """Only read the last 'n' values of the set."""
    last: Int

    """
    Skip the first 'n' values from our 'after' cursor, an alternative to cursor
    based pagination. May not be used with 'last'.
    """
    offset: Int

    """Read all values in the set before (above) this cursor."""
    before: Cursor

    """Read all values in the set after (below) this cursor."""
    after: Cursor

    """The method to use when ordering 'WazeStreet'."""
    orderBy: [WazeStreetsOrderBy!] = [PRIMARY_KEY_ASC]

    """
    A condition to be used in determining which values should be returned by the collection.
    """
    condition: WazeStreetCondition
  ): WazeStreetsConnection
  cameraById(id: Int!): Camera
  cameraImageById(id: Int!): CameraImage
  communityById(id: Int!): Community
  crossingById(id: Int!): Crossing
  incidentReportById(id: Int!): IncidentReport
  pushLogById(id: Int!): PushLog
  statusById(id: Int!): Status
  statusAssociationById(id: Int!): StatusAssociation
  statusReasonById(id: Int!): StatusReason
  statusUpdateById(id: Int!): StatusUpdate
  userById(id: Int!): User
  wazeStreetById(id: Int!): WazeStreet

  """Gets the user who was identified by our JWT."""
  currentUser: User

  """Finds users that administrate the specified communities."""
  findUsersInCommunities(
    communityIds: [Int]

    """Only read the first 'n' values of the set."""
    first: Int

    """Only read the last 'n' values of the set."""
    last: Int

    """
    Skip the first 'n' values from our 'after' cursor, an alternative to cursor
    based pagination. May not be used with 'last'.
    """
    offset: Int

    """Read all values in the set before (above) this cursor."""
    before: Cursor

    """Read all values in the set after (below) this cursor."""
    after: Cursor
  ): UsersConnection!

  """Retrieve all cameras with their latest photo"""
  getAllCamerasWithLatestPhoto(
    """Only read the first 'n' values of the set."""
    first: Int

    """Only read the last 'n' values of the set."""
    last: Int

    """
    Skip the first 'n' values from our 'after' cursor, an alternative to cursor
    based pagination. May not be used with 'last'.
    """
    offset: Int

    """Read all values in the set before (above) this cursor."""
    before: Cursor

    """Read all values in the set after (below) this cursor."""
    after: Cursor
  ): CameraWithLatestPhotosConnection!

  """
  Gets status updates for all crossings, a single crossing, or all crossings in a community. Can filter by date range.
  """
  getStatusUpdateHistory(
    crossingId: Int
    communityId: Int
    dateLowerBound: Datetime
    dateUpperBound: Datetime
    idUpperBound: Int
    rowLimit: Int

    """Only read the first 'n' values of the set."""
    first: Int

    """Only read the last 'n' values of the set."""
    last: Int

    """
    Skip the first 'n' values from our 'after' cursor, an alternative to cursor
    based pagination. May not be used with 'last'.
    """
    offset: Int

    """Read all values in the set before (above) this cursor."""
    before: Cursor

    """Read all values in the set after (below) this cursor."""
    after: Cursor
  ): StatusUpdateHistoriesConnection!

  """Generates legacy xml from current data."""
  legacyXml: String

  """Searches crossings."""
  searchCrossings(
    search: String
    showOpen: Boolean
    showClosed: Boolean
    showCaution: Boolean
    showLongterm: Boolean
    orderAsc: Boolean
    communityId: Int

    """Only read the first 'n' values of the set."""
    first: Int

    """Only read the last 'n' values of the set."""
    last: Int

    """
    Skip the first 'n' values from our 'after' cursor, an alternative to cursor
    based pagination. May not be used with 'last'.
    """
    offset: Int

    """Read all values in the set before (above) this cursor."""
    before: Cursor

    """Read all values in the set after (below) this cursor."""
    after: Cursor
  ): CrossingsConnection!

  """Searches users."""
  searchUsers(
    search: String
    community: Int

    """Only read the first 'n' values of the set."""
    first: Int

    """Only read the last 'n' values of the set."""
    last: Int

    """
    Skip the first 'n' values from our 'after' cursor, an alternative to cursor
    based pagination. May not be used with 'last'.
    """
    offset: Int

    """Read all values in the set before (above) this cursor."""
    before: Cursor

    """Read all values in the set after (below) this cursor."""
    after: Cursor
  ): UsersConnection!

  """Reads and enables pagination through a set of 'WazeFeedIncident'."""
  wazeFeed(
    """Only read the first 'n' values of the set."""
    first: Int

    """Only read the last 'n' values of the set."""
    last: Int

    """
    Skip the first 'n' values from our 'after' cursor, an alternative to cursor
    based pagination. May not be used with 'last'.
    """
    offset: Int

    """Read all values in the set before (above) this cursor."""
    before: Cursor

    """Read all values in the set after (below) this cursor."""
    after: Cursor
  ): WazeFeedIncidentsConnection!

  """Reads a single 'Camera' using its globally unique 'ID'."""
  camera(
    """The globally unique 'ID' to be used in selecting a single 'Camera'."""
    nodeId: ID!
  ): Camera

  """Reads a single 'CameraImage' using its globally unique 'ID'."""
  cameraImage(
    """
    The globally unique 'ID' to be used in selecting a single 'CameraImage'.
    """
    nodeId: ID!
  ): CameraImage

  """Reads a single 'Community' using its globally unique 'ID'."""
  community(
    """
    The globally unique 'ID' to be used in selecting a single 'Community'.
    """
    nodeId: ID!
  ): Community

  """Reads a single 'Crossing' using its globally unique 'ID'."""
  crossing(
    """The globally unique 'ID' to be used in selecting a single 'Crossing'."""
    nodeId: ID!
  ): Crossing

  """Reads a single 'IncidentReport' using its globally unique 'ID'."""
  incidentReport(
    """
    The globally unique 'ID' to be used in selecting a single 'IncidentReport'.
    """
    nodeId: ID!
  ): IncidentReport

  """Reads a single 'PushLog' using its globally unique 'ID'."""
  pushLog(
    """The globally unique 'ID' to be used in selecting a single 'PushLog'."""
    nodeId: ID!
  ): PushLog

  """Reads a single 'Status' using its globally unique 'ID'."""
  status(
    """The globally unique 'ID' to be used in selecting a single 'Status'."""
    nodeId: ID!
  ): Status

  """Reads a single 'StatusAssociation' using its globally unique 'ID'."""
  statusAssociation(
    """
    The globally unique 'ID' to be used in selecting a single 'StatusAssociation'.
    """
    nodeId: ID!
  ): StatusAssociation

  """Reads a single 'StatusReason' using its globally unique 'ID'."""
  statusReason(
    """
    The globally unique 'ID' to be used in selecting a single 'StatusReason'.
    """
    nodeId: ID!
  ): StatusReason

  """Reads a single 'StatusUpdate' using its globally unique 'ID'."""
  statusUpdate(
    """
    The globally unique 'ID' to be used in selecting a single 'StatusUpdate'.
    """
    nodeId: ID!
  ): StatusUpdate

  """Reads a single 'User' using its globally unique 'ID'."""
  user(
    """The globally unique 'ID' to be used in selecting a single 'User'."""
    nodeId: ID!
  ): User

  """Reads a single 'WazeStreet' using its globally unique 'ID'."""
  wazeStreet(
    """
    The globally unique 'ID' to be used in selecting a single 'WazeStreet'.
    """
    nodeId: ID!
  ): WazeStreet
}

"""All input for the 'reactivateUser' mutation."""
input ReactivateUserInput {
  """
  An arbitrary string value with no semantic meaning. Will be included in the
  payload verbatim. May be used to track mutations by the client.
  """
  clientMutationId: String
  userId: Int!
}

"""The output of our 'reactivateUser' mutation."""
type ReactivateUserPayload {
  """
  The exact same 'clientMutationId' that was provided in the mutation input,
  unchanged and unused. May be used by a client to track mutations.
  """
  clientMutationId: String
  user: User

  """
  Our root query field type. Allows us to run any query from our mutation payload.
  """
  query: Query

  """Reads a single 'Community' that is related to this 'User'."""
  communityByCommunityId: Community

  """An edge for our 'User'. May be used by Relay 1."""
  userEdge(
    """The method to use when ordering 'User'."""
    orderBy: [UsersOrderBy!] = [PRIMARY_KEY_ASC]
  ): UsersEdge
}

"""All input for the 'registerUser' mutation."""
input RegisterUserInput {
  """
  An arbitrary string value with no semantic meaning. Will be included in the
  payload verbatim. May be used to track mutations by the client.
  """
  clientMutationId: String
  firstName: String!
  lastName: String!
  jobTitle: String!
  communityId: Int!
  phoneNumber: String!
  email: String!
  password: String!
  role: String!
  immutable: Boolean
}

"""The output of our 'registerUser' mutation."""
type RegisterUserPayload {
  """
  The exact same 'clientMutationId' that was provided in the mutation input,
  unchanged and unused. May be used by a client to track mutations.
  """
  clientMutationId: String
  user: User

  """
  Our root query field type. Allows us to run any query from our mutation payload.
  """
  query: Query

  """Reads a single 'Community' that is related to this 'User'."""
  communityByCommunityId: Community

  """An edge for our 'User'. May be used by Relay 1."""
  userEdge(
    """The method to use when ordering 'User'."""
    orderBy: [UsersOrderBy!] = [PRIMARY_KEY_ASC]
  ): UsersEdge
}

"""All input for the 'registerUserWithNewCommunity' mutation."""
input RegisterUserWithNewCommunityInput {
  """
  An arbitrary string value with no semantic meaning. Will be included in the
  payload verbatim. May be used to track mutations by the client.
  """
  clientMutationId: String
  firstName: String
  lastName: String
  jobTitle: String
  phoneNumber: String
  email: String
  password: String
  role: String
  communityName: String
}

"""The output of our 'registerUserWithNewCommunity' mutation."""
type RegisterUserWithNewCommunityPayload {
  """
  The exact same 'clientMutationId' that was provided in the mutation input,
  unchanged and unused. May be used by a client to track mutations.
  """
  clientMutationId: String
  user: User

  """
  Our root query field type. Allows us to run any query from our mutation payload.
  """
  query: Query

  """Reads a single 'Community' that is related to this 'User'."""
  communityByCommunityId: Community

  """An edge for our 'User'. May be used by Relay 1."""
  userEdge(
    """The method to use when ordering 'User'."""
    orderBy: [UsersOrderBy!] = [PRIMARY_KEY_ASC]
  ): UsersEdge
}

"""All input for the 'removeCrossingFromCommunity' mutation."""
input RemoveCrossingFromCommunityInput {
  """
  An arbitrary string value with no semantic meaning. Will be included in the
  payload verbatim. May be used to track mutations by the client.
  """
  clientMutationId: String
  crossingId: Int!
  communityId: Int!
}

"""The output of our 'removeCrossingFromCommunity' mutation."""
type RemoveCrossingFromCommunityPayload {
  """
  The exact same 'clientMutationId' that was provided in the mutation input,
  unchanged and unused. May be used by a client to track mutations.
  """
  clientMutationId: String
  crossing: Crossing

  """
  Our root query field type. Allows us to run any query from our mutation payload.
  """
  query: Query

  """Reads a single 'StatusUpdate' that is related to this 'Crossing'."""
  statusUpdateByLatestStatusUpdateId: StatusUpdate

  """Reads a single 'Status' that is related to this 'Crossing'."""
  statusByLatestStatusId: Status

  """Reads a single 'WazeStreet' that is related to this 'Crossing'."""
  wazeStreetByWazeStreetId: WazeStreet

  """An edge for our 'Crossing'. May be used by Relay 1."""
  crossingEdge(
    """The method to use when ordering 'Crossing'."""
    orderBy: [CrossingsOrderBy!] = [PRIMARY_KEY_ASC]
  ): CrossingsEdge
}

"""All input for the 'removeCrossing' mutation."""
input RemoveCrossingInput {
  """
  An arbitrary string value with no semantic meaning. Will be included in the
  payload verbatim. May be used to track mutations by the client.
  """
  clientMutationId: String
  crossingId: Int!
}

"""The output of our 'removeCrossing' mutation."""
type RemoveCrossingPayload {
  """
  The exact same 'clientMutationId' that was provided in the mutation input,
  unchanged and unused. May be used by a client to track mutations.
  """
  clientMutationId: String
  crossing: Crossing

  """
  Our root query field type. Allows us to run any query from our mutation payload.
  """
  query: Query

  """Reads a single 'StatusUpdate' that is related to this 'Crossing'."""
  statusUpdateByLatestStatusUpdateId: StatusUpdate

  """Reads a single 'Status' that is related to this 'Crossing'."""
  statusByLatestStatusId: Status

  """Reads a single 'WazeStreet' that is related to this 'Crossing'."""
  wazeStreetByWazeStreetId: WazeStreet

  """An edge for our 'Crossing'. May be used by Relay 1."""
  crossingEdge(
    """The method to use when ordering 'Crossing'."""
    orderBy: [CrossingsOrderBy!] = [PRIMARY_KEY_ASC]
  ): CrossingsEdge
}

"""All input for the 'resetPassword' mutation."""
input ResetPasswordInput {
  """
  An arbitrary string value with no semantic meaning. Will be included in the
  payload verbatim. May be used to track mutations by the client.
  """
  clientMutationId: String
  newPassword: String!
}

"""The output of our 'resetPassword' mutation."""
type ResetPasswordPayload {
  """
  The exact same 'clientMutationId' that was provided in the mutation input,
  unchanged and unused. May be used by a client to track mutations.
  """
  clientMutationId: String
  jwtToken: JwtToken

  """
  Our root query field type. Allows us to run any query from our mutation payload.
  """
  query: Query
}

"""All input for the 'seedLegacyCrossing' mutation."""
input SeedLegacyCrossingInput {
  """
  An arbitrary string value with no semantic meaning. Will be included in the
  payload verbatim. May be used to track mutations by the client.
  """
  clientMutationId: String
  name: String
  humanAddress: String
  communityId: Int
  longitude: BigFloat
  latitude: BigFloat
  description: String
  legacyId: Int
  wazeStreetId: Int
}

"""The output of our 'seedLegacyCrossing' mutation."""
type SeedLegacyCrossingPayload {
  """
  The exact same 'clientMutationId' that was provided in the mutation input,
  unchanged and unused. May be used by a client to track mutations.
  """
  clientMutationId: String

  """
  Our root query field type. Allows us to run any query from our mutation payload.
  """
  query: Query
}

"""All input for the 'setCameraForCrossing' mutation."""
input SetCameraForCrossingInput {
  """
  An arbitrary string value with no semantic meaning. Will be included in the
  payload verbatim. May be used to track mutations by the client.
  """
  clientMutationId: String
  crossingId: Int!
  cameraType: String!
  cameraId: String!
}

"""The output of our 'setCameraForCrossing' mutation."""
type SetCameraForCrossingPayload {
  """
  The exact same 'clientMutationId' that was provided in the mutation input,
  unchanged and unused. May be used by a client to track mutations.
  """
  clientMutationId: String
  crossing: Crossing

  """
  Our root query field type. Allows us to run any query from our mutation payload.
  """
  query: Query

  """Reads a single 'StatusUpdate' that is related to this 'Crossing'."""
  statusUpdateByLatestStatusUpdateId: StatusUpdate

  """Reads a single 'Status' that is related to this 'Crossing'."""
  statusByLatestStatusId: Status

  """Reads a single 'WazeStreet' that is related to this 'Crossing'."""
  wazeStreetByWazeStreetId: WazeStreet

  """An edge for our 'Crossing'. May be used by Relay 1."""
  crossingEdge(
    """The method to use when ordering 'Crossing'."""
    orderBy: [CrossingsOrderBy!] = [PRIMARY_KEY_ASC]
  ): CrossingsEdge
}

"""A status a crossing might be in."""
type Status implements Node {
  """
  A globally unique identifier. Can be used in various places throughout the system to identify this single value.
  """
  nodeId: ID!

  """The primary unique identifier for the status."""
  id: Int!

  """The name of the status."""
  name: String!

  """Reads and enables pagination through a set of 'Crossing'."""
  crossingsByLatestStatusId(
    """Only read the first 'n' values of the set."""
    first: Int

    """Only read the last 'n' values of the set."""
    last: Int

    """
    Skip the first 'n' values from our 'after' cursor, an alternative to cursor
    based pagination. May not be used with 'last'.
    """
    offset: Int

    """Read all values in the set before (above) this cursor."""
    before: Cursor

    """Read all values in the set after (below) this cursor."""
    after: Cursor

    """The method to use when ordering 'Crossing'."""
    orderBy: [CrossingsOrderBy!] = [PRIMARY_KEY_ASC]

    """
    A condition to be used in determining which values should be returned by the collection.
    """
    condition: CrossingCondition
  ): CrossingsConnection!

  """Reads and enables pagination through a set of 'StatusReason'."""
  statusReasonsByStatusId(
    """Only read the first 'n' values of the set."""
    first: Int

    """Only read the last 'n' values of the set."""
    last: Int

    """
    Skip the first 'n' values from our 'after' cursor, an alternative to cursor
    based pagination. May not be used with 'last'.
    """
    offset: Int

    """Read all values in the set before (above) this cursor."""
    before: Cursor

    """Read all values in the set after (below) this cursor."""
    after: Cursor

    """The method to use when ordering 'StatusReason'."""
    orderBy: [StatusReasonsOrderBy!] = [PRIMARY_KEY_ASC]

    """
    A condition to be used in determining which values should be returned by the collection.
    """
    condition: StatusReasonCondition
  ): StatusReasonsConnection!

  """Reads and enables pagination through a set of 'StatusAssociation'."""
  statusAssociationsByStatusId(
    """Only read the first 'n' values of the set."""
    first: Int

    """Only read the last 'n' values of the set."""
    last: Int

    """
    Skip the first 'n' values from our 'after' cursor, an alternative to cursor
    based pagination. May not be used with 'last'.
    """
    offset: Int

    """Read all values in the set before (above) this cursor."""
    before: Cursor

    """Read all values in the set after (below) this cursor."""
    after: Cursor

    """The method to use when ordering 'StatusAssociation'."""
    orderBy: [StatusAssociationsOrderBy!] = [PRIMARY_KEY_ASC]

    """
    A condition to be used in determining which values should be returned by the collection.
    """
    condition: StatusAssociationCondition
  ): StatusAssociationsConnection!

  """Reads and enables pagination through a set of 'StatusUpdate'."""
  statusUpdatesByStatusId(
    """Only read the first 'n' values of the set."""
    first: Int

    """Only read the last 'n' values of the set."""
    last: Int

    """
    Skip the first 'n' values from our 'after' cursor, an alternative to cursor
    based pagination. May not be used with 'last'.
    """
    offset: Int

    """Read all values in the set before (above) this cursor."""
    before: Cursor

    """Read all values in the set after (below) this cursor."""
    after: Cursor

    """The method to use when ordering 'StatusUpdate'."""
    orderBy: [StatusUpdatesOrderBy!] = [PRIMARY_KEY_ASC]

    """
    A condition to be used in determining which values should be returned by the collection.
    """
    condition: StatusUpdateCondition
  ): StatusUpdatesConnection!
}

"""An association of a status to a rule about status details."""
type StatusAssociation implements Node {
  """
  A globally unique identifier. Can be used in various places throughout the system to identify this single value.
  """
  nodeId: ID!

  """The primary unique identifier for the status association."""
  id: Int!
  statusId: Int!

  """The type of detailed information in the association."""
  detail: StatusDetail!

  """The rule about the permissions in the association."""
  rule: StatusRule!

  """Reads a single 'Status' that is related to this 'StatusAssociation'."""
  statusByStatusId: Status
}

"""
A condition to be used against 'StatusAssociation' object types. All fields are
tested for equality and combined with a logical ‘and.’
"""
input StatusAssociationCondition {
  """Checks for equality with the object’s 'id' field."""
  id: Int

  """Checks for equality with the object’s 'statusId' field."""
  statusId: Int

  """Checks for equality with the object’s 'detail' field."""
  detail: StatusDetail

  """Checks for equality with the object’s 'rule' field."""
  rule: StatusRule
}

"""A connection to a list of 'StatusAssociation' values."""
type StatusAssociationsConnection {
  """A list of 'StatusAssociation' objects."""
  nodes: [StatusAssociation]!

  """
  A list of edges which contains the 'StatusAssociation' and cursor to aid in pagination.
  """
  edges: [StatusAssociationsEdge!]!

  """Information to aid in pagination."""
  pageInfo: PageInfo!

  """
  The count of *all* 'StatusAssociation' you could get from the connection.
  """
  totalCount: Int
}

"""A 'StatusAssociation' edge in the connection."""
type StatusAssociationsEdge {
  """A cursor for use in pagination."""
  cursor: Cursor

  """The 'StatusAssociation' at the end of the edge."""
  node: StatusAssociation
}

"""Methods to use when ordering 'StatusAssociation'."""
enum StatusAssociationsOrderBy {
  NATURAL
  ID_ASC
  ID_DESC
  STATUS_ID_ASC
  STATUS_ID_DESC
  DETAIL_ASC
  DETAIL_DESC
  RULE_ASC
  RULE_DESC
  PRIMARY_KEY_ASC
  PRIMARY_KEY_DESC
}

"""
A condition to be used against 'Status' object types. All fields are tested for equality and combined with a logical ‘and.’
"""
input StatusCondition {
  """Checks for equality with the object’s 'id' field."""
  id: Int

  """Checks for equality with the object’s 'name' field."""
  name: String
}

enum StatusDetail {
  REASON
  DURATION
}

"""A connection to a list of 'Status' values."""
type StatusesConnection {
  """A list of 'Status' objects."""
  nodes: [Status]!

  """
  A list of edges which contains the 'Status' and cursor to aid in pagination.
  """
  edges: [StatusesEdge!]!

  """Information to aid in pagination."""
  pageInfo: PageInfo!

  """The count of *all* 'Status' you could get from the connection."""
  totalCount: Int
}

"""A 'Status' edge in the connection."""
type StatusesEdge {
  """A cursor for use in pagination."""
  cursor: Cursor

  """The 'Status' at the end of the edge."""
  node: Status
}

"""Methods to use when ordering 'Status'."""
enum StatusesOrderBy {
  NATURAL
  ID_ASC
  ID_DESC
  NAME_ASC
  NAME_DESC
  PRIMARY_KEY_ASC
  PRIMARY_KEY_DESC
}

"""A reason a crossing might be in a given status."""
type StatusReason implements Node {
  """
  A globally unique identifier. Can be used in various places throughout the system to identify this single value.
  """
  nodeId: ID!

  """The primary unique identifier for the status reason."""
  id: Int!

  """The id of the status the reason applies to."""
  statusId: Int!

  """The name of the status reason."""
  name: String!

  """Reads a single 'Status' that is related to this 'StatusReason'."""
  statusByStatusId: Status

  """Reads and enables pagination through a set of 'StatusUpdate'."""
  statusUpdatesByStatusReasonId(
    """Only read the first 'n' values of the set."""
    first: Int

    """Only read the last 'n' values of the set."""
    last: Int

    """
    Skip the first 'n' values from our 'after' cursor, an alternative to cursor
    based pagination. May not be used with 'last'.
    """
    offset: Int

    """Read all values in the set before (above) this cursor."""
    before: Cursor

    """Read all values in the set after (below) this cursor."""
    after: Cursor

    """The method to use when ordering 'StatusUpdate'."""
    orderBy: [StatusUpdatesOrderBy!] = [PRIMARY_KEY_ASC]

    """
    A condition to be used in determining which values should be returned by the collection.
    """
    condition: StatusUpdateCondition
  ): StatusUpdatesConnection!
}

"""
A condition to be used against 'StatusReason' object types. All fields are
tested for equality and combined with a logical ‘and.’
"""
input StatusReasonCondition {
  """Checks for equality with the object’s 'id' field."""
  id: Int

  """Checks for equality with the object’s 'statusId' field."""
  statusId: Int

  """Checks for equality with the object’s 'name' field."""
  name: String
}

"""A connection to a list of 'StatusReason' values."""
type StatusReasonsConnection {
  """A list of 'StatusReason' objects."""
  nodes: [StatusReason]!

  """
  A list of edges which contains the 'StatusReason' and cursor to aid in pagination.
  """
  edges: [StatusReasonsEdge!]!

  """Information to aid in pagination."""
  pageInfo: PageInfo!

  """The count of *all* 'StatusReason' you could get from the connection."""
  totalCount: Int
}

"""A 'StatusReason' edge in the connection."""
type StatusReasonsEdge {
  """A cursor for use in pagination."""
  cursor: Cursor

  """The 'StatusReason' at the end of the edge."""
  node: StatusReason
}

"""Methods to use when ordering 'StatusReason'."""
enum StatusReasonsOrderBy {
  NATURAL
  ID_ASC
  ID_DESC
  STATUS_ID_ASC
  STATUS_ID_DESC
  NAME_ASC
  NAME_DESC
  PRIMARY_KEY_ASC
  PRIMARY_KEY_DESC
}

enum StatusRule {
  DISABLED
  ENABLED
  REQUIRED
}

"""A status update of a crossing."""
type StatusUpdate implements Node {
  """
  A globally unique identifier. Can be used in various places throughout the system to identify this single value.
  """
  nodeId: ID!

  """The primary key for the status update."""
  id: Int!

  """The id of the status."""
  statusId: Int!

  """The id of the user who created the status update."""
  creatorId: Int!

  """The id of the crossing."""
  crossingId: Int!

  """The id of the status reason."""
  statusReasonId: Int

  """Notes about the status update."""
  notes: String!

  """The time this update was made."""
  createdAt: Datetime

  """Estimated date for longterm closure to reopen."""
  reopenDate: Date

  """Flag for a longterm closure with no estimated reopen date."""
  indefiniteClosure: Boolean

  """Reads a single 'Status' that is related to this 'StatusUpdate'."""
  statusByStatusId: Status

  """Reads a single 'User' that is related to this 'StatusUpdate'."""
  userByCreatorId: User

  """Reads a single 'Crossing' that is related to this 'StatusUpdate'."""
  crossingByCrossingId: Crossing

  """Reads a single 'StatusReason' that is related to this 'StatusUpdate'."""
  statusReasonByStatusReasonId: StatusReason

  """Reads and enables pagination through a set of 'Crossing'."""
  crossingsByLatestStatusUpdateId(
    """Only read the first 'n' values of the set."""
    first: Int

    """Only read the last 'n' values of the set."""
    last: Int

    """
    Skip the first 'n' values from our 'after' cursor, an alternative to cursor
    based pagination. May not be used with 'last'.
    """
    offset: Int

    """Read all values in the set before (above) this cursor."""
    before: Cursor

    """Read all values in the set after (below) this cursor."""
    after: Cursor

    """The method to use when ordering 'Crossing'."""
    orderBy: [CrossingsOrderBy!] = [PRIMARY_KEY_ASC]

    """
    A condition to be used in determining which values should be returned by the collection.
    """
    condition: CrossingCondition
  ): CrossingsConnection!
}

"""
A condition to be used against 'StatusUpdate' object types. All fields are
tested for equality and combined with a logical ‘and.’
"""
input StatusUpdateCondition {
  """Checks for equality with the object’s 'id' field."""
  id: Int

  """Checks for equality with the object’s 'statusId' field."""
  statusId: Int

  """Checks for equality with the object’s 'creatorId' field."""
  creatorId: Int

  """Checks for equality with the object’s 'crossingId' field."""
  crossingId: Int

  """Checks for equality with the object’s 'statusReasonId' field."""
  statusReasonId: Int

  """Checks for equality with the object’s 'notes' field."""
  notes: String

  """Checks for equality with the object’s 'createdAt' field."""
  createdAt: Datetime

  """Checks for equality with the object’s 'reopenDate' field."""
  reopenDate: Date

  """Checks for equality with the object’s 'indefiniteClosure' field."""
  indefiniteClosure: Boolean
}

"""A connection to a list of 'StatusUpdateHistory' values."""
type StatusUpdateHistoriesConnection {
  """A list of 'StatusUpdateHistory' objects."""
  nodes: [StatusUpdateHistory]!

  """
  A list of edges which contains the 'StatusUpdateHistory' and cursor to aid in pagination.
  """
  edges: [StatusUpdateHistoriesEdge!]!

  """Information to aid in pagination."""
  pageInfo: PageInfo!

  """
  The count of *all* 'StatusUpdateHistory' you could get from the connection.
  """
  totalCount: Int
}

"""A 'StatusUpdateHistory' edge in the connection."""
type StatusUpdateHistoriesEdge {
  """A cursor for use in pagination."""
  cursor: Cursor

  """The 'StatusUpdateHistory' at the end of the edge."""
  node: StatusUpdateHistory
}

type StatusUpdateHistory {
  statusUpdateId: Int
  userId: Int
  userLastName: String
  userFirstName: String
  statusId: Int
  statusName: String
  statusReasonName: String
  reopenDate: Date
  indefiniteClosure: Boolean
  createdAt: Datetime
  notes: String
  crossingId: Int
  crossingName: String
  crossingHumanAddress: String
  geojson: String
  communities: [String]
}

"""A connection to a list of 'StatusUpdate' values."""
type StatusUpdatesConnection {
  """A list of 'StatusUpdate' objects."""
  nodes: [StatusUpdate]!

  """
  A list of edges which contains the 'StatusUpdate' and cursor to aid in pagination.
  """
  edges: [StatusUpdatesEdge!]!

  """Information to aid in pagination."""
  pageInfo: PageInfo!

  """The count of *all* 'StatusUpdate' you could get from the connection."""
  totalCount: Int
}

"""A 'StatusUpdate' edge in the connection."""
type StatusUpdatesEdge {
  """A cursor for use in pagination."""
  cursor: Cursor

  """The 'StatusUpdate' at the end of the edge."""
  node: StatusUpdate
}

"""Methods to use when ordering 'StatusUpdate'."""
enum StatusUpdatesOrderBy {
  NATURAL
  ID_ASC
  ID_DESC
  STATUS_ID_ASC
  STATUS_ID_DESC
  CREATOR_ID_ASC
  CREATOR_ID_DESC
  CROSSING_ID_ASC
  CROSSING_ID_DESC
  STATUS_REASON_ID_ASC
  STATUS_REASON_ID_DESC
  NOTES_ASC
  NOTES_DESC
  CREATED_AT_ASC
  CREATED_AT_DESC
  REOPEN_DATE_ASC
  REOPEN_DATE_DESC
  INDEFINITE_CLOSURE_ASC
  INDEFINITE_CLOSURE_DESC
  PRIMARY_KEY_ASC
  PRIMARY_KEY_DESC
}

"""A user of the flood tracking applicaiton."""
type User implements Node {
  """
  A globally unique identifier. Can be used in various places throughout the system to identify this single value.
  """
  nodeId: ID!

  """The primary unique identifier for the user."""
  id: Int!

  """The user’s first name."""
  firstName: String!

  """The user’s last name."""
  lastName: String!

  """The user’s authorization role."""
  role: String!

  """The user’s job title."""
  jobTitle: String!

  """The id of the user’s community."""
  communityId: Int

  """The user’s email address."""
  emailAddress: String

  """The user’s phone number."""
  phoneNumber: String
  active: Boolean

  """
  Indicate that user cannot be deleted. Used for administrative functions.
  """
  immutable: Boolean

  """Reads a single 'Community' that is related to this 'User'."""
  communityByCommunityId: Community

  """Reads and enables pagination through a set of 'StatusUpdate'."""
  statusUpdatesByCreatorId(
    """Only read the first 'n' values of the set."""
    first: Int

    """Only read the last 'n' values of the set."""
    last: Int

    """
    Skip the first 'n' values from our 'after' cursor, an alternative to cursor
    based pagination. May not be used with 'last'.
    """
    offset: Int

    """Read all values in the set before (above) this cursor."""
    before: Cursor

    """Read all values in the set after (below) this cursor."""
    after: Cursor

    """The method to use when ordering 'StatusUpdate'."""
    orderBy: [StatusUpdatesOrderBy!] = [PRIMARY_KEY_ASC]

    """
    A condition to be used in determining which values should be returned by the collection.
    """
    condition: StatusUpdateCondition
  ): StatusUpdatesConnection!

  """Reads and enables pagination through a set of 'PushLog'."""
  pushLogsByUserId(
    """Only read the first 'n' values of the set."""
    first: Int

    """Only read the last 'n' values of the set."""
    last: Int

    """
    Skip the first 'n' values from our 'after' cursor, an alternative to cursor
    based pagination. May not be used with 'last'.
    """
    offset: Int

    """Read all values in the set before (above) this cursor."""
    before: Cursor

    """Read all values in the set after (below) this cursor."""
    after: Cursor

    """The method to use when ordering 'PushLog'."""
    orderBy: [PushLogsOrderBy!] = [PRIMARY_KEY_ASC]

    """
    A condition to be used in determining which values should be returned by the collection.
    """
    condition: PushLogCondition
  ): PushLogsConnection!
}

"""
A condition to be used against 'User' object types. All fields are tested for equality and combined with a logical ‘and.’
"""
input UserCondition {
  """Checks for equality with the object’s 'id' field."""
  id: Int

  """Checks for equality with the object’s 'firstName' field."""
  firstName: String

  """Checks for equality with the object’s 'lastName' field."""
  lastName: String

  """Checks for equality with the object’s 'role' field."""
  role: String

  """Checks for equality with the object’s 'jobTitle' field."""
  jobTitle: String

  """Checks for equality with the object’s 'communityId' field."""
  communityId: Int

  """Checks for equality with the object’s 'emailAddress' field."""
  emailAddress: String

  """Checks for equality with the object’s 'phoneNumber' field."""
  phoneNumber: String

  """Checks for equality with the object’s 'active' field."""
  active: Boolean

  """Checks for equality with the object’s 'immutable' field."""
  immutable: Boolean
}

"""A connection to a list of 'User' values."""
type UsersConnection {
  """A list of 'User' objects."""
  nodes: [User]!

  """
  A list of edges which contains the 'User' and cursor to aid in pagination.
  """
  edges: [UsersEdge!]!

  """Information to aid in pagination."""
  pageInfo: PageInfo!

  """The count of *all* 'User' you could get from the connection."""
  totalCount: Int
}

"""A 'User' edge in the connection."""
type UsersEdge {
  """A cursor for use in pagination."""
  cursor: Cursor

  """The 'User' at the end of the edge."""
  node: User
}

"""Methods to use when ordering 'User'."""
enum UsersOrderBy {
  NATURAL
  ID_ASC
  ID_DESC
  FIRST_NAME_ASC
  FIRST_NAME_DESC
  LAST_NAME_ASC
  LAST_NAME_DESC
  ROLE_ASC
  ROLE_DESC
  JOB_TITLE_ASC
  JOB_TITLE_DESC
  COMMUNITY_ID_ASC
  COMMUNITY_ID_DESC
  EMAIL_ADDRESS_ASC
  EMAIL_ADDRESS_DESC
  PHONE_NUMBER_ASC
  PHONE_NUMBER_DESC
  ACTIVE_ASC
  ACTIVE_DESC
  IMMUTABLE_ASC
  IMMUTABLE_DESC
  PRIMARY_KEY_ASC
  PRIMARY_KEY_DESC
}

type WazeFeedIncident {
  id: Int
  street: String
  polyline: String
  direction: String
  type: String
  subtype: String
  starttime: Datetime
  description: String
  reference: String
}

"""A connection to a list of 'WazeFeedIncident' values."""
type WazeFeedIncidentsConnection {
  """A list of 'WazeFeedIncident' objects."""
  nodes: [WazeFeedIncident]!

  """
  A list of edges which contains the 'WazeFeedIncident' and cursor to aid in pagination.
  """
  edges: [WazeFeedIncidentsEdge!]!

  """Information to aid in pagination."""
  pageInfo: PageInfo!

  """
  The count of *all* 'WazeFeedIncident' you could get from the connection.
  """
  totalCount: Int
}

"""A 'WazeFeedIncident' edge in the connection."""
type WazeFeedIncidentsEdge {
  """A cursor for use in pagination."""
  cursor: Cursor

  """The 'WazeFeedIncident' at the end of the edge."""
  node: WazeFeedIncident
}

"""
A street name suggested by the Waze geocoder. When we query the waze geocoder it
can return multiple matching streets. For waze to consume the waze_feed they
need our street names to match their internal names.
"""
type WazeStreet implements Node {
  """
  A globally unique identifier. Can be used in various places throughout the system to identify this single value.
  """
  nodeId: ID!
  id: Int!
  coordinates: String
  distance: BigFloat
  name: String
  names: [String]
  createdAt: Datetime
  updatedAt: Datetime

  """Reads and enables pagination through a set of 'Crossing'."""
  crossingsByWazeStreetId(
    """Only read the first 'n' values of the set."""
    first: Int

    """Only read the last 'n' values of the set."""
    last: Int

    """
    Skip the first 'n' values from our 'after' cursor, an alternative to cursor
    based pagination. May not be used with 'last'.
    """
    offset: Int

    """Read all values in the set before (above) this cursor."""
    before: Cursor

    """Read all values in the set after (below) this cursor."""
    after: Cursor

    """The method to use when ordering 'Crossing'."""
    orderBy: [CrossingsOrderBy!] = [PRIMARY_KEY_ASC]

    """
    A condition to be used in determining which values should be returned by the collection.
    """
    condition: CrossingCondition
  ): CrossingsConnection!

  """
  Adds a human readable coordinates as a string in the Degrees, Minutes, Seconds representation.
  """
  humanCoordinates: String
}

"""
A condition to be used against 'WazeStreet' object types. All fields are tested
for equality and combined with a logical ‘and.’
"""
input WazeStreetCondition {
  """Checks for equality with the object’s 'id' field."""
  id: Int

  """Checks for equality with the object’s 'coordinates' field."""
  coordinates: String

  """Checks for equality with the object’s 'distance' field."""
  distance: BigFloat

  """Checks for equality with the object’s 'name' field."""
  name: String

  """Checks for equality with the object’s 'names' field."""
  names: [String]

  """Checks for equality with the object’s 'createdAt' field."""
  createdAt: Datetime

  """Checks for equality with the object’s 'updatedAt' field."""
  updatedAt: Datetime
}

"""A connection to a list of 'WazeStreet' values."""
type WazeStreetsConnection {
  """A list of 'WazeStreet' objects."""
  nodes: [WazeStreet]!

  """
  A list of edges which contains the 'WazeStreet' and cursor to aid in pagination.
  """
  edges: [WazeStreetsEdge!]!

  """Information to aid in pagination."""
  pageInfo: PageInfo!

  """The count of *all* 'WazeStreet' you could get from the connection."""
  totalCount: Int
}

"""A 'WazeStreet' edge in the connection."""
type WazeStreetsEdge {
  """A cursor for use in pagination."""
  cursor: Cursor

  """The 'WazeStreet' at the end of the edge."""
  node: WazeStreet
}

"""Methods to use when ordering 'WazeStreet'."""
enum WazeStreetsOrderBy {
  NATURAL
  ID_ASC
  ID_DESC
  COORDINATES_ASC
  COORDINATES_DESC
  DISTANCE_ASC
  DISTANCE_DESC
  NAME_ASC
  NAME_DESC
  NAMES_ASC
  NAMES_DESC
  CREATED_AT_ASC
  CREATED_AT_DESC
  UPDATED_AT_ASC
  UPDATED_AT_DESC
  PRIMARY_KEY_ASC
  PRIMARY_KEY_DESC
}

`; export default schema;
