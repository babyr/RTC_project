<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <style>
        .video {
            width: 320px;
            height: 240px;
        }
    </style>
</head>
<body>
 <div>
      <label for="channelIdInput">Channel ID</label>
        <input type="text" id="channelIdInput" placeholder="ChannelId를 입력하세요." value="">
    <button id="connectChannelButton">채널 입장</button>
    <button id="createChannelButton">채널 생성 및 입장</button>
  </div>

  <video class="video" id="localVideo"></video>
  <video class="video" id="remoteVideo"></video>
<script src="http://www.playrtc.com/sdk/js/playrtc.min.js"></script>
    <script>
    app = new PlayRTC({
            projectKey: '60ba608a-e228-4530-8711-fa38004719c1',
            localVideoTarget: 'localVideo',
      remoteVideoTarget: 'remoteVideo'
    });

    app.on('connectChannel', function(channelId) {
      document.getElementById('channelIdInput').value = channelId;
    });

    document.getElementById('createChannelButton').onclick = function(event) {
      app.createChannel();
      return false;
    };

    document.getElementById('createChannelButton').onclick = function(event) {
      app.createChannel();
      return false;
    };

    document.getElementById('connectChannelButton').onclick = function(event) {
      var channelId = document.getElementById('channelIdInput').value;

            if (!channelId) { return; }
      app.connectChannel(channelId);
      return false;
    };
  </script>
</body>
</html>