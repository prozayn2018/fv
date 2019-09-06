//= require_self





$(window).unbind("load").on('load',function(e){
  e.stopImmediatePropagation()

  var z;
  $.ajax({
    type:"GET",
    url:"/markets/home/test",
    dataType:"JSON",
    contentType: "application/json",
    success:function(data){

      for(i=0; i <500; i++){
        //accessing json/javascript object
      var symb = data[i]['symbol'];
      var name = data[i]['name'];
      var stock = data[i]['current_price'];
      var mcap = data[i]['marketcap'];
      // inserting rows into table via cloned rows table value
      var clone =  $("#test1").clone().appendTo("#myTable");
      clone.find('[scope*=row]').html(i + 1);
      clone.find('[id*=symb]').html(symb);
      clone.find('[id*=name]').html(name);
      clone.find('[id*=stock]').html(stock);
      clone.find('[id*=mcap]').html(mcap);

    }
    $('#test1').remove();
  }
  });

//function for when user clicks a row;
//this changes the data in the
//blue squares to be updated with correct company
//by targeting symbol
  $(document).ready(function(e){
    $(this).click(function(){
      $("#dtMaterialDesignExample").find('tr').click( function(){
        //returns entire row data
      var y =  $(this).html();
      //returns symbol of row clicked
      var z =  this.children[1].innerText;

      //csv data holder

      var csvHolderDate = [];
      var csvHolderPrice = [];

      console.log('You clicked row '+ ($(this).index()+1) );

      $.ajax({
        type:"GET",
        url:"/markets/home/test",
        dataType:"JSON",
        contentType: "application/json",
        success:function(data){
          //looping through json to get symbol
          //will match variable z to symbol
        var variable = data;
        $.each(variable, function(index, value) {
            var x = value.symbol;
              if(z == x){

                //ajax call to rails controller for prices data


                //values for numbers in mills + bills

                var cap = value.marketcap;
                var rev = value.revenue ;
                var gross = value.grossprofit;

                var mkap = fnum(cap);
                var revv = fnum(rev);
                var gp = fnum(gross);

                //formats current_price and fairvalue with $ in front

                // initializing formatter
                const formatter = new Intl.NumberFormat('en-US', {
                  style: 'currency',
                  currency: 'USD',
                  minimumFractionDigits: 2
                })

                var curr_price = value.current_price ;
                var wallst = value.wallst;
                var curr_p = formatter.format(curr_price);
                var walls = formatter.format(wallst);

                //appends dom html elements with clicked company values
                document.getElementById('#1').innerHTML = value.name;
                  document.getElementById('#2').innerHTML = value.symbol;
                    document.getElementById('#3').innerHTML = curr_p
                      document.getElementById('#4').innerHTML = walls;
                        document.getElementById('#5').innerHTML = mkap;
                          document.getElementById('#6').innerHTML = revv;
                            document.getElementById('#7').innerHTML = gp;
                              document.getElementById('#8').innerHTML = value.roa;
                                document.getElementById('#9').innerHTML = value.roe;
                                  document.getElementById('#10').innerHTML = value.eps;
                                    document.getElementById('#11').innerHTML = value.ebitda;
                                      document.getElementById('#graphcomp').innerHTML = value.name;


                                    $.ajax({
                                      type:"GET",
                                      url:"/markets/home/price",
                                      data:{comp: z},
                                      dataType:"JSON",
                                      contentType: "application/json",
                                      success:function(record){
                                        let data1 = record;
                                        var response = record.responseText;
                                        console.log(data1);





                                        //looping through all returned records from prices
                                        //removing columns id, market_id and compsymb
                                        $.each(data1, function(index, value) {
                                                delete value.id;
                                                delete value.market_id;
                                                delete value.compsymb;
                                                //datetime was given with hours, slicing through it to format it to
                                                //yy-mm-dd
                                                value.datetime = value.datetime.slice(0,10);
                                                var csv = value;


                                                csvHolderDate.push(Papa.unparse([
	                                                 [value.datetime],
                                                 ]))

                                                 csvHolderPrice.push(Papa.unparse([
                                                   [value.stock_price],
                                                  ]))
                                                //converting object back to json to change to csv
                                        });
                                        console.log(csvHolderDate);
                                        console.log(csvHolderPrice);

                                        var trace1 = {
                                          type: "scatter",
                                          mode: "lines",
                                          x: csvHolderDate,
                                          y: csvHolderPrice,
                                          line: {color: '#67A9E5'}
                                        };




                                        var data = [trace1];

                                        var layout = {


                                          autosize: true,

                                          height: 565,

                                          xaxis: {
                                            autorange: true,
                                            range: [],
                                            rangeselector: {buttons: [
                                                {
                                                  count: 1,
                                                  label: '1m',
                                                  step: 'month',
                                                  stepmode: 'backward'
                                                },
                                                {
                                                  count: 6,
                                                  label: '6m',
                                                  step: 'month',
                                                  stepmode: 'backward'
                                                },
                                                {step: 'all'}
                                              ]},
                                            rangeslider: {range: []},
                                            type: 'date'
                                          },
                                          yaxis: {
                                            showgrid: true,
                                            autorange: true,
                                            range: [86.8700008333, 138.870004167],
                                            type: 'linear'
                                          }
                                        };

                                        Plotly.newPlot('insert', data, layout, {responsive: true}, {scrollZoom: true});
                                      }

                                    });

                //finish rest tomorrow!
              }else
              {
              }




              //function below breaks down numbers in mills and bills with a b; 9B or 9M
              function fnum(x) {
                  if(isNaN(x)) return x;

                    if(x < 9999) {
                        return x;
                          }
                        if(x < 1000000) {
                          return Math.round(x/1000) + "K";
                          }
                        if( x < 10000000) {
                          return (x/1000000).toFixed(2) + "M";
                          }
                          if(x < 1000000000) {
                            return Math.round((x/1000000)) + "M";
                          }
                          if(x < 1000000000000) {
                              return Math.round((x/1000000000)) + "B";
                              }
                              return "1T+";
                            }
                          {
                        }
                      });
                    }
                  });
                });
              })
            });


  //code for table search, currently broken!
  $(document).unbind().ready(function () {

  $('#dtMaterialDesignExample').DataTable();
  $('#dtMaterialDesignExample_wrapper').find('label').each(function () {
  $(this).parent().append($(this).children());
  });
  $('#dtMaterialDesignExample_wrapper .dataTables_filter').find('input').each(function () {
  $('input').attr("placeholder", "Search");
  $('input').removeClass('form-control-sm');
  });
  $('#dtMaterialDesignExample_wrapper .dataTables_length').addClass('d-flex flex-row');
  $('#dtMaterialDesignExample_wrapper .dataTables_filter').addClass('md-form');
  $('#dtMaterialDesignExample_wrapper select').removeClass(
  'custom-select custom-select-sm form-control form-control-sm');
  $('#dtMaterialDesignExample_wrapper select').addClass('mdb-select');

  $('#dtMaterialDesignExample_wrapper .dataTables_filter').find('label').remove();
  });

//= require_tree ./channels






});
