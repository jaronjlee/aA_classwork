import React from 'react';

class Tile extends React.Component {
    constructor(props) {
        super(props);

    }

    render () {
        const tile = this.props.tile;
        let klass;
        let text;
        let count;
        
        if (tile.explored) {
            if (tile.bombed) {
                
            } else {

            }
        } else if (tile.flagged) {

        } else {

        }

        
        return (
            <div>
                T
            </div>
        )
    }
}

export default Tile;