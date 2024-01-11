document.addEventListener("DOMContentLoaded", function() {
    // データの取得
    console.log("This code is executed."); // チェックのために追加
    var progresses = <%= @task.progresses.to_json %>;
    console.log(<%= @task.progresses.to_json %>)
  
    // 日付と進捗度のデータを抽出
    var labels = progresses.map(function(progress) {
      console.log(progress.date); // 日付をコンソールに表示
      return progress.date;
    });
    var data = progresses.map(function(progress) {
      console.log(progress.progress); // 進捗度をコンソールに表示
      return progress.progress;
    });
  
    // チャートの作成
    var ctx = document.getElementById("progressChart").getContext("2d");
    var chart = new Chart(ctx, {
      type: "line",
      data: {
        labels: labels,
        datasets: [{
          label: "進捗度",
          data: data,
          borderColor: "blue",
          fill: false
        }]
      },
      options: {
        scales: {
          x: {
            type: "time",
            time: {
              unit: "day"
            },
            title: {
              display: true,
              text: "日付"
            }
          },
          y: {
            beginAtZero: true,
            max: 100,
            title: {
              display: true,
              text: "進捗度"
            }
          }
        }
      }
    });
  });