var React = require('react');
var EntryButtons = require('./EntryButtons.jsx');

var DisplayBox = React.createClass({
  render: function() {
    console.log(this.props.entry)
    if(!this.props.project) 
      return <div id="display"></div>
    return (
      <div id="display">
        <h2 id="projectTitle">{this.props.project.title}</h2>
        <EntryButtons
          project={this.props.project}
          entry={this.props.entry}
          entries={this.props.entries}
          getEntries={this.props.getEntries}
          selectEntry={this.props.selectEntry}>
        </EntryButtons>
      </div>
    )
  }
})

module.exports = DisplayBox;