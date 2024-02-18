$(function () {
  const lat = gon.lat;
  const lon = gon.lon;
  const key = gon.api;
  
  const weather_url = 'https://api.openweathermap.org/data/2.5/onecall?lat=' + lat + '&lon=' + lon + '&exclude=current,minutely,alerts&units=metric&appid=' + key;
  $.ajax({
    url: weather_url,
    dataType: 'json',
    type: 'GET',
  })
  .done(function (weather) {
    let insertHTML = '';
    for (let i = 0; i <= 1; i++) {
      insertHTML += buildHTML(weather, i);
    }
    $('#weather').html(insertHTML);
  })
  .fail(function (weather) {
    alert('天気予報の取得に失敗しました');
  });
});

function buildHTML(weather, i) {
  const date = new Date(weather.daily[i].dt * 1000);
  date.setHours(date.getHours() + 9);
  const month = date.getMonth() + 1;
  const Week = new Array('(日)', '(月)', '(火)', '(水)', '(木)', '(金)', '(土)');
  const day = month + '/' + date.getDate() + Week[date.getDay()];
  const icon = weather.daily[i].weather[0].icon;
  const wind_speed = Math.floor(weather.daily[i].wind_speed * 10) / 10;
  const get_deg_string = function(wind_deg) {
    let r = '北';
    if (wind_deg>=11.25) r = '北北東';
    if (wind_deg>=33.75) r = '北東';
    if (wind_deg>=56.25) r = '東北東';
    if (wind_deg>=78.75) r = '東';
    if (wind_deg>=101.25) r = '東南東';
    if (wind_deg>=123.75) r = '南東';
    if (wind_deg>=146.25) r = '南南東';
    if (wind_deg>=168.75) r = '南';
    if (wind_deg>=191.25) r = '南南西';
    if (wind_deg>=213.75) r = '南西';
    if (wind_deg>=236.25) r = '西南西';
    if (wind_deg>=258.75) r = '西';
    if (wind_deg>=281.25) r = '西北西';
    if (wind_deg>=303.75) r = '北西';
    if (wind_deg>=326.25) r = '北北西';
    return r + '風';
  };
  const wind_deg = get_deg_string(weather.daily[i].wind_deg); // 修正点：daily → hourly

  const html =
    '<div class="weather__content--report">' +
      '<p class="weather__content--report-date">' + day + "</p>" +
      '<img src="https://openweathermap.org/img/w/' + icon + '.png">' +
      '<p class="weather__content--report-wind_deg">' + wind_deg + "</p>" +
      '<p class="weather__content--report-wind_speed">' + wind_speed + "m</p>" +
      '<div class="weather__content--report-temp-max">' + '最高：' + Math.round(weather.daily[i].temp.max) + "℃</div>" +
      '<span class="weather__content--report-temp-min">' + '最低：' + Math.floor(weather.daily[i].temp.min) + "℃</span>" +
    '</div>';
  return html;
}
