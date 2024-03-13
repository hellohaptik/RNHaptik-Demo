import { NativeModules, Text, TouchableOpacity, View } from 'react-native'
import React, { PureComponent } from 'react'

export default class App extends PureComponent {

  initHaptik = () => {
    NativeModules.GlobalManager.loadHaptikConversation();
  }

  logoutHaptik = () => {
    NativeModules.GlobalManager.logoutHaptik();
  }

  render() {
    return (
      <View style={{flex: 1, alignItems: "center", justifyContent: "center", backgroundColor: "white"}}>

        <TouchableOpacity onPress={this.initHaptik}>
          <Text style={{fontSize: 20}}>Click to Open Haptik</Text>
        </TouchableOpacity>


        <TouchableOpacity onPress={this.logoutHaptik} style={{marginTop: 100}}>
          <Text style={{fontSize: 20}}>Click to Logout Haptik</Text>
        </TouchableOpacity>

      </View>
    )
  }
}
