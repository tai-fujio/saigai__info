import React, { Component } from "react";
import Modal from "./Modal.js";
import picture from "../../../app/assets/images/disaster.png"

class App extends Component {
  state = {
    explication: false,
    };

  closeExplication = e => {
    this.setState({
      explication: false,
    });
  };

  showExplication = e => {
    this.setState({
      explication: true,
    });
  };

  render(){
    return(
      <div className="container">
        <div>
          <span
            onClick={e => {
            this.showExplication();
            }}
          >
            <u>Saigai infoとは</u>
          </span>
        </div>
        <Modal
        explication={
          this.state.explication
        }
        >
        <div className="modal">
          <div className="modal-container">
            <div className="modal-header">
              <div>
                <img src={picture} alt="Picture" />;
              </div>
            </div>
            <div className="modal-body">
              <div>
                <h4>Saigai infoとは、災害発生時の自治体や民間企業のライフライン支援情報、災害情報などをマップ上で共有するアプリです。<br></br>地図上の任意の地点に選んだアイコンを登録できます。<br></br>登録されたアイコンに情報を加えることができます。<br></br>マップ作成者は災害ボランティアを想定しています。</h4>
              </div>
            </div>
            <div className="modal-footer">
              <div className="btn-close-container">
                <button
                  className="btn-close"
                  onClick={this.closeExplication}
                >
                  閉じる
                </button>
              </div>
            </div>
          </div>
        </div>
        </Modal>
      </div>
    );
  };
}

export default App;
