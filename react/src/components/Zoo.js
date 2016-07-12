import React from 'react';

const Zoo = props => {
  return (
    <li className="zoo">
      <div>
        <a href={"/zoos/" + props.id} >{props.name}</a>
      </div>
    </li>
  );
};

export default Zoo;
