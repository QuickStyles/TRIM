@ProviderService = React.createClass
  render: ->
    React.DOM.div
      className: 'panel panel-default'
      React.DOM.div
        className: 'panel-heading'
        React.DOM.h3
          className: 'panel-title'
          @props.service.name
      React.DOM.div
        className: 'panel-body'
