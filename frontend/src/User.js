import React from 'react'

class User extends React.Component {

  render () {
    const { firstName, lastName, id, role, communityByCommunityId } = this.props.user;
    const communityName = communityByCommunityId.name;

    return (
      <div className='pa3 bg-black-05 ma3'>
        <div className='pt3'>
          {firstName} {lastName}&nbsp;
        </div>
        <div className='pt3'>
          {id}&nbsp;
        </div>
        <p>{role}</p>
        <p>{communityName}</p>
      </div>
    );
  }
}

export default User;
