'use strict';

var React = require('react-native');
var {
  Text,
  View
} = React;

var styles = React.StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: 'grey'
  },
  containerDone: {
    flex: 1,
    backgroundColor: 'orange'   
  },
  header: {
    backgroundColor: 'yellow',
    borderColor: 'black',
    borderStyle: 'solid',
    borderWidth: 2
  }
});

var ArticleView = React.createClass({
  getInitialState: function() {
    return {
      artcle: null
    };
  },

  componentDidMount: function() {
    console.log("fetching article");
    this.fetchData();
  },

  fetchData: function() {
    fetch(this.props.articleURL)
      .then((response) => response.json())
      .then((responseData) => {
        this.setState({
          article: responseData.result.article
        });
      }).done();
  },

  render: function() {
    if (!this.state.article) {
      return (
              <View style={styles.container}>
                <Text>Loading article ...</Text>
              </View>
      )
    }

    var cleanText = this.state.article.text.replace(/<\/?[^>]+(>|$)/g, "");
    return (
      <View style={styles.containerDone}>
        <View style={styles.header}>
          <Text>{this.state.article.name}</Text>
        </View>
        <Text>{cleanText}</Text>
      </View>
    )
  }
});

React.AppRegistry.registerComponent('ArticleView', () => ArticleView);

