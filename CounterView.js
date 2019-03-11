import React, { Component } from "react";
import {
  requireNativeComponent,
  UIManager,
  findNodeHandle
} from "react-native";

const COMPONENT_NAME = "CounterView";
const RNCounterView = requireNativeComponent(COMPONENT_NAME);

export default class CounterView extends Component {
  render() {
    const { count, style } = this.props;
    return (
      <RNCounterView
        style={style}
        count={count}
        ref={ref => (this.ref = ref)}
      />
    );
  }

  update = (...args) => {
    UIManager.dispatchViewManagerCommand(
      findNodeHandle(this.ref),
      UIManager[COMPONENT_NAME].Commands.updateFromManager,
      [...args]
    );
  };
}
