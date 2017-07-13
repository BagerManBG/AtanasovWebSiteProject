$.ajax({
  type: "POST",
  url: "Controllers/Lectures/getStats.php",
  success: function(json) {
      var obj = JSON.parse(json);
      var data = [];
      var labels = [];
      var colours = [];

      for (var i = 0; i < obj.length; i++) {
        data.push(parseInt(obj[i]["seats_taken"]));
        labels.push(obj[i]["title"]);
        colours.push('#5d836e');
      }

      var ctx = document.getElementById('lectures_chart').getContext('2d');
      var chart = new Chart(ctx, {
          // The type of chart we want to create
          type: 'bar',

          // The data for our dataset
          data: {
              labels: labels,
              datasets: [{
                data: data,
                backgroundColor: colours
              }]
          },

          // Configuration options go here
          options: {
            responsive: true,
            legend: {
              display: false
            },
            scales: {
              yAxes: [{
                ticks: {
                  beginAtZero: true,
                  callback: function (value) { if (Number.isInteger(value)) { return value; } },
                  stepSize: 1
                },
                scaleLabel: {
                  display: true,
                  labelString: 'Seats Taken'
                }
              }]
            }
          }
      });
  }
});
