// MapView.js
import PropTypes from 'prop-types';
import React from 'react';
import {requireNativeComponent} from 'react-native';

class CastButton extends React.Component {
    render() {
        return <RNTCastButton {...this.props} />;
    }
}

CastButton.propTypes = {
    /**
     * The color of the button
     */
    tintColor: PropTypes.string,

};

CastButton.defaultProps = {
    /**
     * The size of the button
     */
    style: {
        width: 24,
        height: 24
    }

};

var RNTCastButton = requireNativeComponent('RNTCastButton', CastButton);

module.exports = CastButton;
