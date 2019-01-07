import PropTypes from 'prop-types';
import React from 'react';
import {requireNativeComponent} from 'react-native';

var RNTCastButton = requireNativeComponent('RNTCastButton', CastButton);

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
    /**
     * If it has not been shown before, presents a fullscreen modal view controller that calls
     * attention to the Cast button and displays some brief instructional text about its use.
     */
    presentCastInstructionsOnce: PropTypes.bool,
    /**
     * An object representing the media to be cast
     */
    media: PropTypes.shape({
        /**
         * The media URL
         */
        url: PropTypes.string.isRequired,
        /**
         * The content (MIME) type.
         */
        contentType: PropTypes.string.isRequired,
        /**
         * The title of the media. For example, this could be the title of a song, movie, or TV show episode. This value is suitable for display purposes.
         */
        title: PropTypes.string,
        /**
         * The subtitle of the media. This value is suitable for display purposes.
         */
        subtitle: PropTypes.string,
        /**
         * The media image URL
         */
        imageUrl: PropTypes.string,
        /**
         * The length of the stream, in seconds.
         */
        streamDuration: PropTypes.number,
        /**
         * The media image URL
         */
        playPosition: PropTypes.number,
        /**
         * Start playing the media rignt after loading
         */
        autoPlay: PropTypes.number
    })
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

module.exports = CastButton;
