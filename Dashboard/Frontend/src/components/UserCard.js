import React from "react";
import { Card } from "react-bootstrap";

function UserCard({ title, dance, x, y, z }) {
  return (
    <Card style={{ width: "18rem" }}>
      <Card.Body>
        <Card.Title>{title}</Card.Title>
        <Card.Text>
          <h1>Dance: {dance}</h1>
          <h1>X: {x}</h1>
          <h1>Y: {y}</h1>
          <h1>Z: {z}</h1>
        </Card.Text>
      </Card.Body>
    </Card>
  );
}

export default UserCard;
