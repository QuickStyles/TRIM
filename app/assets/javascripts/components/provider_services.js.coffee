@ProviderServices = React.createClass
  getInitialState: ->
    services: @props.data
  getDefaultProps: ->
    services: []
  render: ->
    React.DOM.div
      className: 'col-md-6'
      for service in @state.services
        React.createElement ProviderService, key: service.id, service: service
