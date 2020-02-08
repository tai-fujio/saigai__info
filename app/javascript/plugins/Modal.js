import React, { Component } from "react";

class Modal extends Component {
  render() {
    if (!this.props.explication) {
      return null;
    }

    return (
      <div>
        <div>{this.props.children}
        </div>
      </div>
    );
  }
}

export default Modal;
